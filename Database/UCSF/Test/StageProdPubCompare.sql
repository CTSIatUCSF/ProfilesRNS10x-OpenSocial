/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [LogID]
      ,[JobID]
      ,[JobGroup]
      ,[Step]
      ,[Script]
      ,[JobStart]
      ,[JobEnd]
      ,[Status]
      ,[ErrorCode]
      ,[ErrorMsg]
  FROM [profiles_102].[Framework.].[Log.Job] order by logid desc;
  
-- people in prod not in stage
select personid, internalusername, displayname from cls.dbo.person where isactive = 1  and personid not in 
(select personid from [Profile.Data].[Person] where IsActive = 1);

-- people in stage not in prod
select personid, internalusername, displayname from [Profile.Data].[Person]  where isactive = 1  and personid not in 
(select personid from cls.dbo.person  where IsActive = 1);
  
  -- pubs in prod not in stage
select i.PMID, i.personid, p.internalusername, p.displayname from cls.dbo.publications_include i 
join cls.dbo.person p on p.personid = i.personid where i.pmid is not null and p.isactive = 1 and i.personid in 
(select personid from [profile.data].[publication.person.include])
and cast(i.personid as varchar) + cast(i.pmid as varchar) not in (select cast(personid as varchar) + cast(pmid as varchar) from 
[profile.data].[publication.person.include] where pmid is not null) order by i.personid; --5665

  -- pubs in stage not in prod
select i.PMID, i.personid, p.internalusername, p.displayname from [profile.data].[publication.person.include] i 
join [profile.data].[person] p on p.personid = i.personid where i.pmid is not null and p.isactive = 1 and i.personid in 
(select personid from cls.dbo.publications_include)
and cast(i.personid as varchar) + cast(i.pmid as varchar) not in (select cast(personid as varchar) + cast(pmid as varchar) from 
cls.dbo.publications_include where pmid is not null) order by i.personid; --5665


  -- pubs in prod not in stage, check against excluded and create sql to add them
select 'exec [Profile.Data].[Publication.Pubmed.AddPublication] ' + CAST(p.Personid as varchar) + ',' + cast(i.pmid as varchar) + ';'
 from cls.dbo.publications_include i join [Profile.Data].[Person] p on i.PersonID = p.personid 
 where p.IsActive = 1 and i.pmid is not null and i.personid in 
(select personid from [profile.data].[publication.person.include])
and cast(i.personid as varchar) + cast(i.pmid as varchar) not in (select cast(personid as varchar) + cast(pmid as varchar) from 
[profile.data].[publication.person.include] where pmid is not null) 
and cast(i.personid as varchar) + cast(i.pmid as varchar) not in (select cast(personid as varchar) + cast(pmid as varchar) from 
[profile.data].[publication.person.exclude] where pmid is not null) 
order by p.personid; --5665, now 4416


  -- pubs excluded in prod not in stage, create sql to remove them
select 'exec [Profile.Data].[Publication.DeleteOnePublication] ' +  CAST(i.Personid as varchar) + ',''' + cast(i.PubID as varchar(max)) + ''';'
 from [profile.data].[publication.person.include] i where i.pmid is not null and i.personid in 
(select personid from [profile.data].[person])
and cast(i.personid as varchar) + cast(i.pmid as varchar) in (select cast(personid as varchar) + cast(pmid as varchar) from 
cls.dbo.publications_exclude where pmid is not null)
order by i.personid; --5665, now 4416



-- ralph gonzales
select * from [profile.data].[publication.person.include] where PersonID = 4873314;
select * from [profile.data].[publication.person.add] where PersonID = 4873314;
select * from [profile.data].[publication.person.exclude] where PersonID = 4873314;
select * from cls.dbo.publications_include where PersonID = 4873314;

select * from [profile.data].[publication.person.include] where PersonID = 4570766;


-- pubs in stage not in prod
select * from [profile.data].[publication.person.include] i where i.pmid is not null and i.personid in 
(select personid from cls.dbo.publications_include)
and cast(i.personid as varchar) + cast(i.pmid as varchar) not in (select cast(personid as varchar) + cast(pmid as varchar) from 
cls.dbo.publications_include where pmid is not null) order by personid; --60


-- find pubs from prod that are not in stage but need to be (16787)
select distinct i.pmid from cls.dbo.pm_all_xml i where i.pmid is not null and i.PMID not in 
(select pmid from [Profile.Data].[Publication.PubMed.AllXML]) and i.pmid in (select pmid from cls.dbo.publications_include);

-- query to move over missing pubs
declare @pmid int
declare @x XML

declare newpubs cursor fast_forward for select i.pmid, i.x from cls.dbo.pm_all_xml i where i.pmid is not null and i.PMID not in 
(select pmid from [Profile.Data].[Publication.PubMed.AllXML]) and i.pmid in (select pmid from cls.dbo.publications_include);

open newpubs
fetch next from newpubs into @pmid, @x
while @@fetch_status = 0 begin

exec [Profile.Data].[Publication.Pubmed.AddPubMedXML] @pmid, @x

fetch next from newpubs into @pmid, @x
end
close newpubs
deallocate newpubs


