-- &amp; issue
update [Profile.Import].[Beta.Award] set AwardNM = REPLACE(AwardNM, '&amp;', '&') ,
	AwardingInst = REPLACE(AwardingInst, '&amp;', '&') ;
		
update [Profile.Import].[Beta.Narrative] set NarrativeMain = REPLACE(NarrativeMain, '&amp;', '&') ;

-- CR issue
update [Profile.Import].[Beta.Narrative] set NarrativeMain = REPLACE(NarrativeMain, CHAR(13), '') ;