USE [profiles_prod]
GO

/****** Object:  StoredProcedure [ORNG].[RegisterAppPerson]    Script Date: 03/18/2013 15:52:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/****** Object:  StoredProcedure [ORNG].[RegisterAppPerson]    Script Date: 09/23/2010 09:52:53 ******/
ALTER PROCEDURE [ORNG].[RegisterAppPerson](@userid nvarchar(255),@appId INT, @value BIT = 1)
As
BEGIN
	SET NOCOUNT ON
		BEGIN TRAN		
			DECLARE @PERSON_FILTER_ID INT
			DECLARE @PROFILE_ID INT
			SELECT @PERSON_FILTER_ID = (SELECT PersonFilterID FROM Apps WHERE appId = @appId)
			SELECT @PROFILE_ID = cast(InternalID as INT) from [RDF.Stage].InternalNodeMap where
				NodeID = cast(RIGHT(@userid, CHARINDEX('/', REVERSE(@userId))-1) as INT)

			IF (@value = 1 AND (SELECT COUNT(*) FROM AppRegistry WHERE appId = @appId AND personId = @userId) = 0)
				BEGIN
					INSERT [ORNG].[AppRegistry](appId, personId) values (@appId, @userId)
					IF (@PERSON_FILTER_ID IS NOT NULL) 
						INSERT [Profile.Data].[Person.FilterRelationship](personID, personFilterId) values (@PROFILE_ID, @PERSON_FILTER_ID)
				END
			ELSE IF (@value != 1)
				BEGIN
					DELETE FROM [ORNG].[AppRegistry] where appId = @appID AND personId = @userId
					IF (@PERSON_FILTER_ID IS NOT NULL) 
						DELETE FROM [Profile.Data].[Person.FilterRelationship] WHERE personId = @PROFILE_ID AND personFilterId = @PERSON_FILTER_ID
				END	
		COMMIT
END

/****** Object:  StoredProcedure [ORNG].[UpsertAppData]    Script Date: 08/31/2011 14:35:13 ******/
SET ANSI_NULLS ON

GO


