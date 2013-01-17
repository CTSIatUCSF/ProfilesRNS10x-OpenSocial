/****** Object:  UserDefinedFunction [dbo].[fn_ProperCase]    Script Date: 12/14/2012 10:36:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [dbo].[fn_ProperCase]
(
	@s varchar(255)
)
RETURNS varchar(255)
AS
BEGIN

	SET @s = lower(@s)

	DECLARE @str varchar(255)
	SET @str = ''
	DECLARE @i int
	DECLARE @x int
	DECLARE @c char(1)

	SET @x = 1
	SET @i = 1

	WHILE @i <= len(@s)
	BEGIN
		SET @c = substring(@s,@i,1)
		IF (ascii(@c) between 65 and 90 or ascii(@c) between 97 and 122 or ascii(@c) between 48 and 57)
		BEGIN
			IF @x = 1 OR @str = 'Mc'
				SET @str = @str + upper(@c)
			ELSE
				SET @str = @str + @c
			SET @x = 0	
		END
		ELSE
		BEGIN
			SET @str = @str + @c
			SET @x = 1	
		END
		SET @i = @i + 1
	END

	SET @str = replace(@str,'ucsf','UCSF')
	SET @str = replace(@str,'vamc','VAMC')
	SET @str = replace(@str,'ahec','AHEC')
	SET @str = replace(@str,'sfgh','SFGH')
	SET @str = replace(@str,'aids','AIDS')
	SET @str = replace(@str,'hiv','HIV')
	SET @str = replace(@str,' of ',' of ')
	SET @str = replace(@str,' to ',' to ')
	SET @str = replace(@str,' in ',' in ')
	SET @str = replace(@str,' at ',' at ')
	SET @str = replace(@str,' for ',' for ')

	RETURN @str

END


GO

/****** Object:  UserDefinedFunction [dbo].[fn_ProperCaseName]    Script Date: 12/14/2012 10:36:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER FUNCTION [dbo].[fn_ProperCaseName]
(
	@s varchar(255)
)
RETURNS varchar(255)
AS
BEGIN

	SET @s = lower(@s)

	DECLARE @str varchar(255)
	SET @str = ''
	DECLARE @i int
	DECLARE @x int
	DECLARE @c char(1)

	SET @x = 1
	SET @i = 1

	WHILE @i <= len(@s)
	BEGIN
		SET @c = substring(@s,@i,1)
		IF (ascii(@c) between 65 and 90 or ascii(@c) between 97 and 122 or ascii(@c) between 48 and 57)
		BEGIN
			IF @x = 1 OR @str = 'Mc'
				SET @str = @str + upper(@c)
			ELSE
				SET @str = @str + @c
			SET @x = 0	
		END
		ELSE
		BEGIN
			SET @str = @str + @c
			SET @x = 1	
		END
		SET @i = @i + 1
	END

	RETURN @str

END

GO


/****** Object:  UserDefinedFunction [dbo].[fn_UrlCleanName]    Script Date: 12/14/2012 10:36:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_UrlCleanName]
(
	@s varchar(255)
)
RETURNS varchar(255)
AS
BEGIN

	SET @s = lower(ltrim(rtrim(@s)))

	DECLARE @str varchar(255)
	SET @str = ''
	DECLARE @i int
	DECLARE @c char(1)

	SET @i = 1

	WHILE @i <= len(@s)
	BEGIN
		SET @c = substring(@s,@i,1)											------------------------------------------- ' . - _ all are valid for URL's
		IF (ascii(@c) between 65 and 90 or ascii(@c) between 97 and 122 or ascii(@c) between 48 and 57 or ascii(@c) in (45, 46, 95))
			SET @str = @str + @c
		SET @i = @i + 1
	END

	IF len(@str) < 1
		SET @str = null
			
	RETURN @str

END

GO


/****** Object:  Table [dbo].[uniqueNames]    Script Date: 12/14/2012 10:37:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[uniqueNames](
	[INDIVIDUAL_ID] [varchar](9) NOT NULL,
	[CLEAN_FIRST] [nvarchar](50) NULL,
	[CLEAN_MIDDLE] [nvarchar](50) NULL,
	[CLEAN_LAST] [nvarchar](50) NULL,
	[CLEAN_SUFFIX] [nvarchar](50) NULL,
	[CLEAN_FIRST_ALT] [nvarchar](50) NULL,
	[URL_NAME] [nvarchar](255) NULL,
	[STRATEGY] [nvarchar](50) NULL,
 CONSTRAINT [PK_uniqueNames] PRIMARY KEY CLUSTERED 
(
	[INDIVIDUAL_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  StoredProcedure [dbo].[usp_createUniqueNames]    Script Date: 12/14/2012 10:37:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_createUniqueNames] 
AS
BEGIN

	-- Seed the uniqueNames table
	INSERT uniqueNames SELECT
		INDIVIDUAL_ID,
		ISNULL(ISNULL(dbo.fn_UrlCleanName(PREF_FRST_NAME), dbo.fn_UrlCleanName(GIVEN_NAME)),''),
		ISNULL(dbo.fn_UrlCleanName(MIDDLE_NAME), ''),
		ISNULL(dbo.fn_UrlCleanName(SURNAME), ''),
		ISNULL(dbo.fn_UrlCleanName(NAME_SUFFIX), ''),
		ISNULL(dbo.fn_UrlCleanName(GIVEN_NAME), ''),
		null, null
		FROM vw_UCSFPRO1 where INDIVIDUAL_ID NOT IN (SELECT INDIVIDUAL_ID FROM uniqueNames) 
		
	DECLARE @id varchar(9)
	DECLARE @CleanFirst nvarchar(255)
	DECLARE @CleanMiddle nvarchar(255)
	DECLARE @CleanLast nvarchar(255)
	DECLARE @CleanSuffix nvarchar(255)
	DECLARE @CleanFirstAlt nvarchar(255)
	DECLARE @UrlName nvarchar(255)
	DECLARE @strategy nvarchar(50)
	DECLARE @i int
		
	WHILE exists (SELECT *
		FROM uniqueNames WHERE URL_NAME is null)
	BEGIN
		SELECT TOP 1 @id=INDIVIDUAL_ID,
					 @CleanFirst=CLEAN_FIRST, 
					 @CleanMiddle=CLEAN_MIDDLE,
					 @CleanLast=CLEAN_LAST,
					 @CleanSuffix=CLEAN_SUFFIX,
					 @CleanFirstAlt=CLEAN_FIRST_ALT
		FROM uniqueNames WHERE URL_NAME is null ORDER BY len(CLEAN_MIDDLE) + len(CLEAN_SUFFIX)					 

		-- try different strategies
		-- P = preferred first name
		-- I = middle initial
		-- M = middle name
		-- L = last name
		-- S = suffix
		-- G = given first name
		-- N = number
		
		-- for folks who go by their middle name as their preferred name, remove middle name from the strategy.
		-- also do this if it we only have middle initial and it looks like that's what they did
		IF (@CleanFirst = @CleanMiddle) OR 
			(
				(len(@CleanMiddle) = 1 OR (len(@CleanMiddle) = 2 AND charindex('.', @CleanMiddle) = 2)) 
				AND (@CleanFirst <> @CleanFirstAlt) 
				AND (substring(@CleanMiddle, 1, 1) = substring(@CleanFirst, 1, 1))
			)
			SET @CleanMiddle = ''

		SET @strategy = 'P.L'
		SET @UrlName = @CleanFirst + '.' + @CleanLast -- first and last
		
		IF exists (SELECT * from uniqueNames WHERE URL_NAME = @UrlName) AND len(@CleanMiddle) > 0
		BEGIN
			SET @strategy = 'P.I.L'
			SET @UrlName = @CleanFirst + '.' + substring(@CleanMiddle,1,1) + '.' + @CleanLast -- middle initial
		END
		ELSE IF exists (SELECT * from uniqueNames WHERE URL_NAME = @UrlName) AND len(@CleanMiddle) > 0
		BEGIN
			SET @strategy = 'P.M.L'
			SET @UrlName = @CleanFirst + '.' + @CleanMiddle + '.' + @CleanLast -- middle name
		END
		ELSE IF exists (SELECT * from uniqueNames WHERE URL_NAME = @UrlName) AND len(@CleanSuffix) > 0
		BEGIN
			SET @strategy = 'P.L.S'
			SET @UrlName = @CleanFirst + '.' + @CleanLast + '.' + @CleanSuffix -- suffix
		END
		ELSE IF exists (SELECT * from uniqueNames WHERE URL_NAME = @UrlName) AND len(@CleanMiddle) > 0 AND len(@CleanSuffix) > 0
		BEGIN
			SET @strategy = 'P.I.L.S'
			SET @UrlName = @CleanFirst + '.' + substring(@CleanMiddle,1,1) + '.' + @CleanLast + '.' + @CleanSuffix-- middle initial and suffix
		END
		ELSE IF exists (SELECT * from uniqueNames WHERE URL_NAME = @UrlName) AND len(@CleanMiddle) > 0 AND len(@CleanSuffix) > 0
		BEGIN
			SET @strategy = 'P.M.L.S'
			SET @UrlName = @CleanFirst + '.' + @CleanMiddle + '.' + @CleanLast + '.' + @CleanSuffix -- middle name and suffix
		END
		--ELSE IF exists (SELECT * from uniqueNames WHERE URL_NAME = @UrlName) AND len(@CleanFirstAlt) > 0 AND @CleanFirstAlt != @CleanFirst
		--BEGIN
		--	SET @strategy = 'G.L'
		--	SET @UrlName = @CleanFirstAlt + '.' + @CleanLast -- REDO ALL with other first name
		--END
		--ELSE IF exists (SELECT * from uniqueNames WHERE URL_NAME = @UrlName) AND len(@CleanMiddle) > 0
		--BEGIN
		--	SET @strategy = 'G.I.L'
		--	SET @UrlName = @CleanFirstAlt + '.' + substring(@CleanMiddle,1,1) + '.' + @CleanLast -- middle initial
		--END
		--ELSE IF exists (SELECT * from uniqueNames WHERE URL_NAME = @UrlName) AND len(@CleanMiddle) > 0
		--BEGIN
		--	SET @strategy = 'G.M.L'
		--	SET @UrlName = @CleanFirstAlt + '.' + @CleanMiddle + '.' + @CleanLast -- middle name
		--END
		--ELSE IF exists (SELECT * from uniqueNames WHERE URL_NAME = @UrlName) AND len(@CleanSuffix) > 0
		--BEGIN
		--	SET @strategy = 'G.L.S'
		--	SET @UrlName = @CleanFirstAlt + '.' + @CleanLast + '.' + @CleanSuffix -- suffix
		--END
		--ELSE IF exists (SELECT * from uniqueNames WHERE URL_NAME = @UrlName) AND len(@CleanMiddle) > 0 AND len(@CleanSuffix) > 0
		--BEGIN
		--	SET @strategy = 'G.I.L.S'
		--	SET @UrlName = @CleanFirstAlt + '.' + substring(@CleanMiddle,1,1) + '.' + @CleanLast + '.' + @CleanSuffix-- middle initial and suffix
		--END
		--ELSE IF exists (SELECT * from uniqueNames WHERE URL_NAME = @UrlName) AND len(@CleanMiddle) > 0 AND len(@CleanSuffix) > 0
		--BEGIN
		--	SET @strategy = 'G.M.L.S'
		--	SET @UrlName = @CleanFirstAlt + '.' + @CleanMiddle + '.' + @CleanLast + '.' + @CleanSuffix -- middle name and suffix							
		--END
		ELSE 
		BEGIN
			SET @i = 2
			WHILE exists (SELECT * from uniqueNames WHERE URL_NAME = @UrlName)
			BEGIN
				SET @strategy = 'P.L.N'
				SET @UrlName = @CleanFirst + '.' + @CleanLast + '.' + CAST(@i as varchar)			
				SET @i = @i + 1
			END				
		END				
		-- it should be unique at this point
		UPDATE uniqueNames SET URL_NAME = @UrlName, [STRATEGY] = @strategy WHERE INDIVIDUAL_ID = @id
	END

END

-- FUN QUERY
--select u.individual_id, isnull(v.pref_frst_name, ''), isnull(v.given_name, ''), isnull(v.middle_name, ''), 
--isnull(v.surname, ''), isnull(v.name_suffix, ''), u.url_name, u.strategy from uniqueNames u 
--join vw_UCSFPRO1 v on v.individual_id = u.individual_id where CLEAN_FIRST + CLEAN_LAST in (select CLEAN_FIRST + CLEAN_LAST FROM uniqueNames 
--where url_name like '%2') order by url_name

GO





