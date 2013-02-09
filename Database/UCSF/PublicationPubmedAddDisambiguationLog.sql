USE [profiles_prod]
GO

/****** Object:  StoredProcedure [Profile.Data].[Publication.Pubmed.AddDisambiguationLog]    Script Date: 02/05/2013 15:51:12 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON
GO

ALTER  PROCEDURE  [Profile.Data].[Publication.Pubmed.AddDisambiguationLog] (@batchID UNIQUEIDENTIFIER, 
												@personID INT,
												@actionValue VARCHAR(8000),
												@action VARCHAR(200) )
AS
BEGIN
	IF @action='StartService'
		BEGIN
			INSERT INTO [Profile.Data].[Publication.PubMed.DisambiguationAudit]  (BatchID,BatchCount,PersonID,ServiceCallStart)
			VALUES (@batchID,cast(@actionValue as int),@personID,GETDATE())
		END
	IF @action='EndService'
		BEGIN
			UPDATE [Profile.Data].[Publication.PubMed.DisambiguationAudit] 
			   SET ServiceCallEnd = GETDATE(),
				   ServiceCallPubsFound  =cast(@actionValue as int)
			 WHERE batchID=@batchID
			   AND personid=@personID
		END
	IF @action='LocalCounts'
		BEGIN
			UPDATE [Profile.Data].[Publication.PubMed.DisambiguationAudit] 
			   SET ServiceCallNewPubs = cast(@actionValue as int),
				   ServiceCallExistingPubs  =ServiceCallPubsFound-cast(@actionValue as int)
			 WHERE batchID=@batchID
			   AND personid=@personID
		END
	IF @action='AuthorComplete'
		BEGIN
			UPDATE [Profile.Data].[Publication.PubMed.DisambiguationAudit] 
			   SET ServiceCallPubsAdded = cast(@actionValue as int),
				   ProcessEnd  =GETDATE(),
				   Success= CASE WHEN cast(@actionValue as int) =ServiceCallNewPubs THEN 1 ELSE 0 END
			 WHERE batchID=@batchID
			   AND personid=@personID
		END
	IF @action='Error'
		BEGIN
			UPDATE [Profile.Data].[Publication.PubMed.DisambiguationAudit] 
			   SET ErrorText = @actionValue,
				   ProcessEnd  =GETDATE(),
				   Success=1
			 WHERE batchID=@batchID
			   AND personid=@personID
		END
END

GO


