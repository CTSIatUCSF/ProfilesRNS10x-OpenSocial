/****** Object:  UserDefinedFunction [Profile.Data].[fnPublication.Pubmed.GetPubDate]    Script Date: 10/19/2012 12:26:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create function [UCSF].[fnGeneratePersonID]
(
	@EmployeeID varchar(10)
)
RETURNS int
AS
BEGIN
	-- Return the result of the function
	RETURN 2569307 + cast(SUBSTRING(@EmployeeID, 2, 7) as numeric) 

END

GO


