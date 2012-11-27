
/****** Object:  Table [UCSF.].[ghJoin]    Script Date: 11/14/2012 11:52:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [UCSF.].[ghJoin](
	[PIID] [int] NOT NULL,
	[Email] [nvarchar](50) NULL,
	[EmployeeID] [nvarchar](50) NULL,
 CONSTRAINT [PK_ghJoin] PRIMARY KEY CLUSTERED 
(
	[PIID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [UCSF.].[ghXML]    Script Date: 11/14/2012 11:52:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [UCSF.].[ghXML](
	[ghid] [int] IDENTITY(1,1) NOT NULL,
	[x] [xml] NULL,
	[ImportDT] [datetime] NULL
) ON [PRIMARY]

GO

ALTER TABLE [UCSF.].[ghXML] ADD  CONSTRAINT [DF_globalhealth_dt]  DEFAULT (getdate()) FOR [ImportDT]
GO

/****** Object:  StoredProcedure [UCSF.].[gh_AddGlobalHealthXML]    Script Date: 11/14/2012 11:54:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [UCSF.].[gh_AddGlobalHealthXML] (@globalhealthxml XML)
AS
BEGIN
	SET NOCOUNT ON;	
	 
	-- Parse Load Publication XML
	BEGIN TRY 	 
		INSERT INTO [UCSF.].[ghXML](x) values(@globalhealthxml)	
	END TRY
	BEGIN CATCH
		DECLARE @ErrMsg nvarchar(4000), @ErrSeverity int
		--Check success
		IF @@TRANCOUNT > 0  ROLLBACK

		-- Raise an error with the details of the exception
		SELECT @ErrMsg = 'gh_AddGlobalHealthXML FAILED WITH : ' + ERROR_MESSAGE(),
					 @ErrSeverity = ERROR_SEVERITY()

		RAISERROR(@ErrMsg, @ErrSeverity, 1)
			 
	END CATCH				
END

GO

/****** Object:  StoredProcedure [UCSF.].[gh_ParseGlobalHealthXML]    Script Date: 11/14/2012 11:54:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [UCSF.].[gh_ParseGlobalHealthXML] (@ghid int)
AS
BEGIN
	SET NOCOUNT ON;	

	-- insert new people
	INSERT [UCSF.].[ghJoin] (PIID, Email)
	SELECT 	nref.value('PIID[1]','integer') PIID,
		nref.value('Email[1]','varchar(max)') EMAIL
	FROM ghXML cross apply x.nodes('//PIList/PI') as R(nref)
		WHERE ghid = @ghid and nref.value('PIID[1]','integer') not in (SELECT PIID FROM ghJoin);

	-- match people
	update j set j.EmployeeID = p.internalusername from 
		ghJoin j join [Profile.Data].[Person] p on j.Email = p.EmailAddr WHERE j.EmployeeID is null;

	-- set appdata
	declare @appId int;
	declare @baseURI nvarchar(255)
	SELECT @appId = appId FROM [ORNG.].[Apps] WHERE name = 'Global Health';
	SELECT @baseURI = [Value] from [Framework.].[Parameter] where [parameterID]= 'baseURI';
	-- clean out old data
	DELETE FROM [ORNG.].[AppData] where appId = @appId AND keyname = 'countries';
	DELETE FROM [ORNG.].[AppRegistry] where appId = @appId;
	
	-- add new data
	INSERT [ORNG.].[AppData](userId, appId, keyname, [value]) 
		SELECT @baseURI + cast(i.nodeid as varchar), @appId, 'countries', nref.value('Countries[1]','varchar(max)') Countries FROM 
			[UCSF.].[ghJoin] j join [Profile.Data].[Person] p on j.EmployeeID = p.internalusername join
			[UCSF.].[ghXML] g cross apply x.nodes('//PIList/PI') as R(nref) on nref.value('PIID[1]','integer') = j.PIID join
			[RDF.Stage].internalnodemap i on i.internalid = p.personid 
			WHERE g.ghid = @ghid and j.EmployeeID is not null and len(nref.value('Countries[1]','varchar(max)')) > 0 and
			  i.class = 'http://xmlns.com/foaf/0.1/Person';

	-- register new ones
	INSERT [ORNG.].[AppRegistry] (appId, personId)
		SELECT appId, userId FROM [ORNG.].[AppData] WHERE appId = @appId AND keyname = 'countries' AND
			userId NOT IN (SELECT personId from [ORNG.].[AppRegistry]  WHERE appId = @appId);

	-- put countries into temp table with xml type
	SELECT i.internalid userid, cast('<country>' + REPLACE([value], ';', '</country><country>') + '</country>' as xml)  x
		into #ghCountries FROM [ORNG.].[AppData] a join 
		[RDF.Stage].internalnodemap i on @baseURI + cast(i.nodeid as varchar) = a.userid
		WHERE appId = @appId and keyname = 'countries' and i.class = 'http://xmlns.com/foaf/0.1/Person';

	-- parse out xml to get individual countries
	SELECT userid, rtrim(ltrim(nref.query('.').value('/country[1]', 'varchar(max)'))) country into #ghCountry
		FROM #ghCountries cross apply x.nodes('//country') as R(nref);

	-- add new countries as new filters
	INSERT [Profile.Data].[Person.Filter] (PersonFilter, PersonFilterCategory)
		SELECT distinct country, 'Global Health' FROM #ghCountry WHERE country not in 
			(SELECT PersonFilter FROM [Profile.Data].[Person.Filter] WHERE PersonFilterCategory = 'Global Health') ;

	-- remove all filter relationships for Global Health
	DELETE FROM [Profile.Import].[PersonFilterFlag]  WHERE PersonFilter in 
		(SELECT PersonFilter FROM [Profile.Data].[Person.Filter] WHERE PersonFilterCategory = 'Global Health');

	-- rebuild all filter relationships for Global Health
	INSERT [Profile.Import].[PersonFilterFlag] 
		SELECT p.internalusername, c.country FROM #ghCountry c join
			 [Profile.Data].[Person] p on c.userid = p.personid;
END

GO



