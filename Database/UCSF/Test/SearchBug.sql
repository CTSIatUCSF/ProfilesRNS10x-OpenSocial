 declare @SearchOptions XML
 declare @SessionID uniqueidentifier
 declare @lookup bit
 
 set @SearchOptions = cast('<SearchOptions><MatchOptions><SearchString>meeks</SearchString><ClassGroupURI>http://profiles.catalyst.harvard.edu/ontology/prns#ClassGroupPeople</ClassGroupURI></MatchOptions><OutputOptions><Offset>0</Offset><Limit>15</Limit></OutputOptions></SearchOptions>' as XML)
 set @SessionID = '084198e4-ca15-4424-86f2-c499d00c175f'
 set @lookup = 0
 
-- exec [Search.].[GetNodes] @SearchOptions, @SessionID, @lookup

--EXEC [Search.].[LookupNodes] @SearchOptions = @SearchOptions, @SessionID = @SessionID

EXEC [Search.Cache].[Public.GetNodes] @SearchOptions = @SearchOptions, @SessionID = @SessionID
--EXEC [Search.Cache].[Private.GetNodes] @SearchOptions = @SearchOptions, @SessionID = @SessionID

--exec sp_help_fulltext_catalogs ''