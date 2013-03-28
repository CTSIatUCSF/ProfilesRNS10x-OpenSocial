****** Script for SelectTopNRows command from SSMS  ******/
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
  FROM [profiles_102].[Framework.].[Log.Job] order by LogID desc;
  
  
  USE profiles_prod
GO

Print 'Selecting Index Fragmentation in the database.'

SELECT 
  DB_NAME(DPS.DATABASE_ID) AS [DatabaseName]
 ,OBJECT_NAME(DPS.OBJECT_ID) AS TableName
 ,SI.NAME AS IndexName
 ,DPS.INDEX_TYPE_DESC AS IndexType
 ,DPS.AVG_FRAGMENTATION_IN_PERCENT AS AvgPageFragmentation
 ,DPS.PAGE_COUNT AS PageCounts
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL , NULL, NULL) DPS --N'LIMITED') DPS
INNER JOIN sysindexes SI 
    ON DPS.OBJECT_ID = SI.ID 
    AND DPS.INDEX_ID = SI.INDID
ORDER BY DPS.avg_fragmentation_in_percent DESC
GO

--Rebuild all indexes offline with keeping the default fill factor for each index
ALTER DATABASE profiles_prod set SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
USE [profiles_prod]
EXEC sp_MSforeachtable @command1="print '?'", @command2="ALTER INDEX ALL ON ? REBUILD WITH (ONLINE=OFF)"

ALTER DATABASE profiles_prod set MULTI_USER;
GO
