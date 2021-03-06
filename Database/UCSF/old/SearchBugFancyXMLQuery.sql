/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [SearchRequest]
      ,[SearchResponse]
      ,[id]
      ,[dt]
      ,[Lookup]
      ,[UseCache]
  FROM [profiles_102].[dbo].[SearchDebug];
  
  
  declare @foo xml;
  select @foo = cast(
  '<SearchOptions>
  <MatchOptions>
    <SearchFiltersList>
      <SearchFilter Property="http://xmlns.com/foaf/0.1/lastName" MatchType="Left">Turner</SearchFilter>
    </SearchFiltersList>
    <ClassURI>http://xmlns.com/foaf/0.1/Person</ClassURI>
  </MatchOptions>
  <OutputOptions>
    <Offset>0</Offset>
    <Limit>15</Limit>
    <SortByList />
  </OutputOptions>
</SearchOptions>' as xml)

exec [Search.Cache].[Public.GetNodes] @SearchOptions=@foo
  
  
  
  select cast('<SearchOptions><MatchOptions><SearchString ExactMatch="false">cow</SearchString><SearchFiltersList><SearchFilter IsExclude="0" Property="http://profiles.catalyst.harvard.edu/ontology/prns#personInPrimaryPosition" Property2="http://vivoweb.org/ontology/core#positionInOrganization" MatchType="Left">http://dev-profiles.ucsf.edu/profiles_102/profile/343600</SearchFilter></SearchFiltersList><ClassURI>http://xmlns.com/foaf/0.1/Person</ClassURI></MatchOptions><OutputOptions><Offset>-15</Offset><Limit>15</Limit><SortByList /></OutputOptions></SearchOptions>' as xml);

-- dude  
select * from [search.cache].[public.nodesummary] where nodeid = 344560
select * from [search.cache].[public.noderdf] where nodeid = 344560
select * from [search.cache].[public.nodeprefix] where nodeid = 344560
select * from [search.cache].[public.nodemap] where nodeid = 344560 and MatchedByNodeId = 343600
select * from [search.cache].[public.nodeexpand] where nodeid = 344560
select * from [search.cache].[public.nodeclass] where nodeid = 344560

-- SOM  
select * from [search.cache].[public.nodesummary] where nodeid = 343512
select * from [search.cache].[public.noderdf] where nodeid = 343512
select * from [search.cache].[public.nodeprefix] where nodeid = 343512
select * from [search.cache].[public.nodemap] where nodeid = 343512
select * from [search.cache].[public.nodeexpand] where nodeid = 343512
select * from [search.cache].[public.nodeclass] where nodeid = 343512

-- onto something!!!
select * from [search.cache].[public.nodemap] m join [search.cache].[public.nodesummary] s 
on m.matchedbynodeid = s.nodeid where m.nodeid = 346851 