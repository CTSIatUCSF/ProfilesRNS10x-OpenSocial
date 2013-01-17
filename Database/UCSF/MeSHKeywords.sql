USE [profiles_102]
GO

/****** Object:  Table [dbo].[UCSF]].[MeSH.Keywords]    Script Date: 01/16/2013 11:14:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [UCSF].[MeSH.Keywords](
	[PersonID] [int] NOT NULL,
	[PMID] [int] NOT NULL,
	[MeSHKeywords] [nvarchar](max) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER PROCEDURE [UCSF].[Generate.MeSH.Keywords] AS
BEGIN
  truncate table [UCSF].[MeSH.Keywords]

  declare @personid  int
  declare @pmid int
  declare @descriptor nvarchar(max)
  declare @descriptors nvarchar(max)
  declare @oldpersonid int
  declare @oldpmid int
   
  declare keywords cursor FAST_FORWARD for select p.PersonID, p.PMID, m.DescriptorName 
  from [Profile.Data].[Publication.Person.Include] p join [Profile.Data].[Publication.PubMed.Mesh] m on p.PMID = m.PMID
  order by PersonID, PMID
  
  set @oldpersonid = 0
  set @oldpmid = 0
  set @descriptors = ''
  open keywords
  fetch next from keywords into @personid, @pmid, @descriptor   
  
  while @@fetch_status = 0 begin
	if (@personid = @oldpersonid AND @pmid = @oldpmid)
	begin
		set @descriptors = @descriptors + ', ' + @descriptor
	end
	else
	begin
	    if (@oldpersonid > 0) 	    
			insert [UCSF].[MeSH.Keywords] values (@oldpersonid, @oldpmid, RIGHT(@descriptors, len(@descriptors) - 1))
		set @oldpersonid = @personid
		set @oldpmid = @pmid
		set @descriptors = ''
	end
	
  fetch next from keywords into @personid, @pmid, @descriptor   
  end
  -- get the last one in 
  insert [UCSF].[MeSH.Keywords] values (@oldpersonid, @oldpmid, RIGHT(@descriptors, len(@descriptors) - 1))
  close keywords
  deallocate keywords
END