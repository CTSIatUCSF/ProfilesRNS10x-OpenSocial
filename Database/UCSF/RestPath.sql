insert [Framework.].[RestPath] 
	select u.URL_NAME, '[Profile.Framework].ResolveURL' 
		from cls.dbo.uniqueNames u join [Profile.Data].[Person] p on p.internalusername = u.INDIVIDUAL_ID
		where p.visible = 1;
	