USE [profiles_102]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_ProperCase]    Script Date: 10/30/2012 11:22:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [UCSF].[fn_ProperCase]
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
			IF @x = 1
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


