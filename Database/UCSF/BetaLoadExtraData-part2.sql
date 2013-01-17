/****** Script for SelectTopNRows command from SSMS  ******/

DECLARE @basePath varchar(100)

SELECT @basePath = [Value] from [Framework.].[Parameter] where ParameterID = 'baseURI'

-- fix some issues with old names in the new system
update u set u.FirstName = v.FirstName, u.DisplayName = v.DisplayName from [User.Account].[User] u
join cls.dbo.vw_user_10x v on u.internalusername = v.internalusername

update u set u.FirstName = v.FirstName, u.DisplayName = v.DisplayName from [User.Account].[User] u
join cls.dbo.vw_person_10x v on u.internalusername = v.internalusername

-- gadget id fixes
update r set personid = @basePath + cast(i.nodeid as varchar)
from  orng.appregistry r join
[RDF.stage].[internalnodemap] i on cast(r.personId as varchar) = i.InternalID
where i.[Class] = 'http://xmlns.com/foaf/0.1/Person' 

update d set userId = @basePath + cast(i.nodeid as varchar)
from  orng.appdata d join
[RDF.stage].[internalnodemap] i on cast(d.userId as varchar) = i.InternalID
where i.[Class] = 'http://xmlns.com/foaf/0.1/Person' 