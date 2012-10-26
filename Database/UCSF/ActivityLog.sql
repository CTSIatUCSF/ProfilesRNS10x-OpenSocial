USE [profiles_102]
GO

/****** Object:  Table [ORNG.].[Activity]    Script Date: 10/25/2012 15:13:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [UCSF.].[ActivityLog](
	[activityLogId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[cmd] [nvarchar](255) NULL,
	[params] [xml] NULL,
	[createdDT] [datetime] NOT NULL,
 CONSTRAINT [PK__activityLog] PRIMARY KEY CLUSTERED 
(
	[activityLogId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [UCSF.].[ActivityLog] ADD  CONSTRAINT [DF_activityLog_createdDT]  DEFAULT (getdate()) FOR [createdDT]
GO

CREATE PROCEDURE [UCSF.].[LogActivity]
	@userId int,
	@cmd varchar(255),
	@params xml
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [UCSF.].[ActivityLog] (userId, cmd, params) 
		VALUES(@userId, @cmd, @params)
END

GO

