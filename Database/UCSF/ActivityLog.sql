SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [UCSF].[ActivityLog](
	[activityLogId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[personId] [int] NULL,
	[methodName] [nvarchar](255) NULL,
	[property] [nvarchar](255) NULL,
	[privacyCode] [int] NULL,
	[param1] [nvarchar](255) NULL,
	[param2] [nvarchar](255) NULL,
	[createdDT] [datetime] NOT NULL,
 CONSTRAINT [PK__activityLog] PRIMARY KEY CLUSTERED 
(
	[activityLogId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [UCSF].[ActivityLog] ADD  CONSTRAINT [DF_activityLog_createdDT]  DEFAULT (getdate()) FOR [createdDT]
GO

CREATE PROCEDURE [UCSF].[LogActivity]
	@userId int,
	@personId int,
	@methodName varchar(255),
	@property varchar(255),
	@privacyCode int,
	@param1 varchar(255),
	@param2 varchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [UCSF].[ActivityLog] (userId, personId, methodName, property, privacyCode, param1, param2) 
		VALUES(@userId, @personId, @methodName, @property, @privacyCode, @param1, @param2)
END

GO


