update [Framework.].[RestPath] set Resolver = '[UCSF.Profile.Framework].ResolveURL' 
	where Resolver = '[Profile.Framework].ResolveURL';
	
insert [Framework.].[RestPath] 
	select left(f.UID_USERID, len(f.UID_USERID) - 9), '[UCSF.Profile.Framework].ResolveURL' 
		from cls.dbo.vw_FNO f join [Profile.Data].[Person] p on p.internalusername = f.INDIVIDUAL_ID
		where p.visible = 1;
	