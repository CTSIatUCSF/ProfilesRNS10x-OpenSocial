
CREATE procedure [UCSF].[Beta.LoadExtraData] (@SourceDBName varchar(max))
AS
BEGIN
SET nocount  ON;
 
  DECLARE @sql nvarchar(max)
  
  
  SET @sql = 'INSERT [Profile.Data].[Publication.PubMed.DisambiguationAffiliation]  SELECT * FROM  [' + @SourceDBName + '].[dbo].[disambiguation_pm_affiliations]'
  EXEC sp_executesql @sql
  
  SET @sql = 'INSERT [Profile.Data].[Publication.Person.Add]  SELECT * FROM  [' + @SourceDBName + '].[dbo].[publications_add]'
  EXEC sp_executesql @sql
  
  SET @sql = 'INSERT [Profile.Data].[Publication.Person.Exclude]  SELECT * FROM  [' + @SourceDBName + '].[dbo].[publications_exclude]'
  EXEC sp_executesql @sql
  
  -- ORNG meta data 
  SET @sql = 'INSERT [ORNG].[Apps]  SELECT * FROM  [' + @SourceDBName + '].[dbo].[shindig_apps]'
  EXEC sp_executesql @sql
  
  SET @sql = 'INSERT [ORNG].[AppViews]  SELECT appid, viewer_req, owner_req, [page], [view], chromeId, display_order, opt_params FROM ' + 
				'[' + @SourceDBName + '].[dbo].[shindig_app_views]'
  EXEC sp_executesql @sql
  
  -- ORNG data NOTE THAT THIS DOES NOT DO ids correctly, fixed by next sql script
  SET @sql = 'INSERT [ORNG].[AppRegistry]  SELECT * FROM  [' + @SourceDBName + '].[dbo].[shindig_app_registry]'
  EXEC sp_executesql @sql
  
  SET @sql = 'INSERT [ORNG].[AppData]  SELECT * FROM  [' + @SourceDBName + '].[dbo].[shindig_appdata]'
  EXEC sp_executesql @sql

END  
