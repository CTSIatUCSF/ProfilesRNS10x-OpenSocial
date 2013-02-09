USE [profiles_prod]
GO

/****** Object:  StoredProcedure [Profile.Import].[Beta.LoadData]    Script Date: 01/03/2013 10:45:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [Profile.Import].[Beta.LoadData] (@SourceDBName varchar(max))
AS BEGIN
	 
	SET NOCOUNT ON;
 
	   /* 
 
	This stored procedure imports a subset of data from a Profiles RNS Beta
	instance into the Profiles RNS 1.0 Extended Schema tables. 
 
	Input parameters:
		@SourceDBName				source db to pull beta data from.		  
 
	Test Call:
		[Utility.Application].[uspImportBetaData] resnav_people_hmsopen
		
	*/
	DECLARE @sql NVARCHAR(MAX) 
	
	-- Toggle off fkey constraints
	ALTER TABLE [Profile.Data].[Person.FilterRelationship]  NOCHECK CONSTRAINT FK_person_type_relationships_person
	ALTER TABLE [Profile.Data].[Person.FilterRelationship]  NOCHECK CONSTRAINT FK_person_type_relationships_person_types	
	ALTER TABLE [Profile.Data].[Publication.Person.Include]  NOCHECK CONSTRAINT FK_publications_include_pm_pubs_general
	ALTER TABLE [Profile.Data].[Publication.MyPub.General]  NOCHECK CONSTRAINT FK_my_pubs_general_person
	ALTER TABLE [Profile.Data].[Publication.Person.Include]  NOCHECK CONSTRAINT FK_publications_include_person
	ALTER TABLE [Profile.Data].[Publication.Person.Include]  NOCHECK CONSTRAINT FK_publications_include_my_pubs_general 
	 
	-- [profile.data].[Organization.Department] 
	TRUNCATE TABLE [profile.data].[Organization.Department]
	SET IDENTITY_INSERT [profile.data].[Organization.Department] ON 
	SELECT @sql = 'SELECT DepartmentID,DepartmentName,Visible FROM '+ @SourceDBName + '.dbo.department'
	INSERT INTO [profile.data].[Organization.Department](DepartmentID,DepartmentName,Visible)
	EXEC sp_executesql @sql
	SET IDENTITY_INSERT [profile.data].[Organization.Department] OFF	
	
	--[profile.data].[Organization.Division]dbo.division
	TRUNCATE TABLE [profile.data].[Organization.division]
	SET IDENTITY_INSERT [profile.data].[Organization.Division] ON 
	SELECT @sql = 'SELECT DivisionID,DivisionName FROM '+ @SourceDBName + '.dbo.Division'
	INSERT INTO [profile.data].[Organization.Division](DivisionID,DivisionName)
	EXEC sp_executesql @sql	
	SET IDENTITY_INSERT [profile.data].[Organization.Division] OFF	
	
	--[profile.data].[Organization.Institution]dbo.institution
	TRUNCATE TABLE [profile.data].[Organization.institution]
	SET IDENTITY_INSERT [profile.data].[Organization.institution] ON 
	SELECT @sql = 'SELECT institutionID,institutionName,InstitutionAbbreviation FROM '+ @SourceDBName + '.dbo.institution'
	INSERT INTO [profile.data].[Organization.institution](institutionID,institutionName,InstitutionAbbreviation)
	EXEC sp_executesql @sql	
	SET IDENTITY_INSERT [profile.data].[Organization.institution] OFF	
	
	--	[profile.data].[concept.mesh.descriptor]dbo.mesh_descriptors institution
	TRUNCATE TABLE [profile.data].[concept.mesh.descriptor]
	SELECT @sql = 'SELECT DescriptorUI,DescriptorName FROM '+ @SourceDBName + '.dbo.mesh_descriptors'
	INSERT INTO [profile.data].[concept.mesh.descriptor](DescriptorUI,DescriptorName )
	EXEC sp_executesql @sql	 	
	
	--	[profile.data].[concept.mesh.tree]dbo.mesh_tree
	TRUNCATE TABLE [profile.data].[concept.mesh.tree]
	SELECT @sql = 'SELECT DescriptorUI,TreeNumber FROM '+ @SourceDBName + '.dbo.mesh_tree'
	INSERT INTO [profile.data].[concept.mesh.tree](DescriptorUI,TreeNumber )
	EXEC sp_executesql @sql	 
	
	--	[profile.data].[concept.mesh.SemanticGroup]dbo.mesh_semantic_groups
	TRUNCATE TABLE [profile.data].[concept.mesh.SemanticGroup]
	SELECT @sql = 'SELECT DescriptorUI,SemanticGroupUI,SemanticGroupName FROM '+ @SourceDBName + '.dbo.mesh_semantic_groups'
	INSERT INTO [profile.data].[concept.mesh.SemanticGroup](DescriptorUI,SemanticGroupUI,SemanticGroupName  )
	EXEC sp_executesql @sql	 	
	
	--  [profile.cache].[Publication.PubMed.AuthorPosition], dbo.cache_pm_author_position
	TRUNCATE TABLE [profile.cache].[Publication.PubMed.AuthorPosition]
	SELECT @sql =  'SELECT [PersonID],[PMID],[AuthorPosition],[AuthorWeight],[PubDate],[PubYear],[YearWeight] FROM '+ @SourceDBName + '.dbo.cache_pm_author_position'
	INSERT INTO [profile.cache].[Publication.PubMed.AuthorPosition]([PersonID],[PMID],[AuthorPosition],[AuthorWeight],[PubDate],[PubYear],[YearWeight]  )
	EXEC sp_executesql @sql	 
	 
	--	[Profile.Data].[Person]dbo.person
	DELETE FROM [profile.Data].[Person]
	SET IDENTITY_INSERT [profile.data].[Person] ON 
	SELECT @sql = 'SELECT [PersonID],[UserID],[FirstName],[LastName],[MiddleName],[DisplayName],[Suffix],[IsActive],[EmailAddr],[Phone],[Fax],[AddressLine1],[AddressLine2],[AddressLine3],[AddressLine4],[City],[State],[Zip],[Building],[Floor],[Room],[AddressString],[Latitude],[Longitude],[GeoScore],[FacultyRankID],[InternalUsername],[Visible] FROM '+ @SourceDBName + '.dbo.person'
	INSERT INTO [profile.data].[Person]([PersonID],[UserID],[FirstName],[LastName],[MiddleName],[DisplayName],[Suffix],[IsActive],[EmailAddr],[Phone],[Fax],[AddressLine1],[AddressLine2],[AddressLine3],[AddressLine4],[City],[State],[Zip],[Building],[Floor],[Room],[AddressString],[Latitude],[Longitude],[GeoScore],[FacultyRankID],[InternalUsername],[Visible]  )
	EXEC sp_executesql @sql	 
	SET IDENTITY_INSERT [profile.data].[Person] OFF 	
	
	--	[Profile.Data].[Person.FilterRelationship]dbo.person_filter_relationships
	TRUNCATE TABLE [profile.Data].[Person.FilterRelationship] 
	SELECT @sql = 'SELECT [PersonID],[PersonFilterid] FROM '+ @SourceDBName + '.dbo.person_filter_relationships'
	INSERT INTO [profile.data].[Person.FilterRelationship]([PersonID],[PersonFilterid] )
	EXEC sp_executesql @sql	   
	
	--	[Profile.Data].[Person.Filter]dbo.person_filters
	SET IDENTITY_INSERT [profile.data].[Person.Filter] ON 
	DELETE FROM [profile.Data].[Person.Filter] 
	SELECT @sql = 'SELECT [PersonFilterID],[PersonFilter],[PersonFilterCategory],[PersonFilterSort] FROM '+ @SourceDBName + '.dbo.person_filters'
	INSERT INTO [profile.data].[Person.Filter]([PersonFilterID],[PersonFilter],[PersonFilterCategory],[PersonFilterSort] )
	EXEC sp_executesql @sql	   
	SET IDENTITY_INSERT [profile.data].[Person.Filter] OFF 
		
	--	[profile.data].[Person.Affiliation]dbo.person_affiliations
	SET IDENTITY_INSERT [profile.data].[Person.Affiliation] ON 
	TRUNCATE TABLE [profile.Data].[Person.Affiliation] 
	SELECT @sql = 'SELECT [PersonAffiliationID],[PersonID],[SortOrder],[IsActive],[IsPrimary],[InstitutionID],[DepartmentID],[DivisionID],[Title],[EmailAddress],[FacultyRankID] 
					FROM '+ @SourceDBName + '.dbo.person_affiliations a
						LEFT OUTER JOIN '+ @SourceDBName + '.dbo.institution_fullname i ON a.[InstitutionFullnameID] = i.[InstitutionFullnameID] 
						LEFT OUTER JOIN '+ @SourceDBName + '.dbo.department_fullname d ON a.[DepartmentFullNameID] = d.[DepartmentFullNameID]
						LEFT OUTER JOIN '+ @SourceDBName + '.dbo.division_fullname v ON a.[DivisionFullnameID] = v.[DivisionFullnameID]'
	INSERT INTO [profile.data].[Person.Affiliation]([PersonAffiliationID],[PersonID],[SortOrder],[IsActive],[IsPrimary],[InstitutionID],[DepartmentID],[DivisionID],[Title],[EmailAddress],[FacultyRankID] )
	EXEC sp_executesql @sql	   
	SET IDENTITY_INSERT [profile.data].[Person.Affiliation] OFF 	
	
	--	[Profile.Data].[Person.Award]dbo.awards 
	TRUNCATE TABLE [profile.Import].[Beta.Award] 
	SELECT @sql = 'SELECT [AwardID],[PersonID],[Yr],[Yr2],REPLACE([AwardNM],''&amp;'', ''&''),REPLACE([AwardingInst],''&amp;'', ''&'') FROM '+ @SourceDBName + '.dbo.awards ORDER BY PersonID, Yr DESC'
	INSERT INTO [profile.Import].[Beta.Award]([AwardID],[PersonID],[Yr],[Yr2],[AwardNM],[AwardingInst] )
	EXEC sp_executesql @sql	    
	
	--	[Profile.Data].[Person.FacultyRank]dbo.faculty_rank
	SET IDENTITY_INSERT [profile.data].[Person.FacultyRank] ON 
	TRUNCATE TABLE [profile.Data].[Person.FacultyRank] 
	SELECT @sql = 'SELECT [FacultyRankID],[FacultyRank],[FacultyRankSort],[Visible] FROM '+ @SourceDBName + '.dbo. faculty_rank'
	INSERT INTO [profile.data].[Person.FacultyRank]([FacultyRankID],[FacultyRank],[FacultyRankSort],[Visible] )
	EXEC sp_executesql @sql	   
	SET IDENTITY_INSERT [profile.data].[Person.FacultyRank] OFF 
	
	--	[profile.data].[person.narrative]dbo.narratives  
	TRUNCATE TABLE [profile.Import].[Beta.Narrative] 
	SELECT @sql = 'SELECT [PersonID],REPLACE(REPLACE(cast([NarrativeMain] as varchar(max)),''&amp;'', ''&''),CHAR(13),'') FROM '+ @SourceDBName + '.dbo.narratives'
	INSERT INTO [profile.Import].[Beta.Narrative]([PersonID],[NarrativeMain] )
	EXEC sp_executesql @sql	    	
	
	--	[Profile.Cache].[SNA.Coauthor]dbo.sna_coauthors 
	TRUNCATE TABLE [Profile.Cache].[SNA.Coauthor]
	SELECT @sql = 'SELECT [PersonID1],[PersonID2],[i],[j],[w],[FirstPubDate],[LastPubDate],[n] FROM '+ @SourceDBName + '.dbo.sna_coauthors'
	INSERT INTO [Profile.Cache].[SNA.Coauthor]([PersonID1],[PersonID2],[i],[j],[w],[FirstPubDate],[LastPubDate],[n] )
	EXEC sp_executesql @sql	    
	
	--	[profile.cache].[Concept.Mesh.Count]dbo.cache_mesh_count
	TRUNCATE TABLE [Profile.Cache].[Concept.Mesh.Count]
	SELECT @sql = 'SELECT[MeshHeader],[NumPublications],[NumFaculty],[Weight],[RawWeight] FROM '+ @SourceDBName + '.dbo.cache_mesh_count'
	INSERT INTO [Profile.Cache].[Concept.Mesh.Count]([MeshHeader],[NumPublications],[NumFaculty],[Weight],[RawWeight] )
	EXEC sp_executesql @sql	    
	 
	--	[Profile.Cache].[Person.PhysicalNeighbor]dbo.cache_physical_neighbors
	TRUNCATE TABLE [Profile.Cache].[Person.PhysicalNeighbor]
	SELECT @sql = 'SELECT[PersonID],[NeighborID],[Distance],[DisplayName],[MyNeighbors] FROM '+ @SourceDBName + '.dbo.cache_physical_neighbors'
	INSERT INTO [Profile.Cache].[Person.PhysicalNeighbor]([PersonID],[NeighborID],[Distance],[DisplayName],[MyNeighbors])
	EXEC sp_executesql @sql	    
	
	--	[Profile.Cache].[Person.SimilarPerson]dbo.cache_similar_people
	TRUNCATE TABLE [Profile.Cache].[Person.SimilarPerson]
	SELECT @sql = 'SELECT[PersonID],[SimilarPersonID],[Weight],[CoAuthor] FROM '+ @SourceDBName + '.dbo.cache_similar_people'
	INSERT INTO [Profile.Cache].[Person.SimilarPerson]([PersonID],[SimilarPersonID],[Weight],[CoAuthor])
	EXEC sp_executesql @sql	    
	
	--	[Profile.Cache].[Concept.Mesh.Person]dbo.cache_user_mesh
	TRUNCATE TABLE [Profile.Cache].[Concept.Mesh.Person]
	SELECT @sql = 'SELECT[PersonID],[MeshHeader],[NumPubsAll],[NumPubsThis],[Weight],[FirstPublicationYear],[LastPublicationYear],[MaxAuthorWeight],[WeightCategory]FROM '+ @SourceDBName + '.dbo.cache_user_mesh'
	INSERT INTO [Profile.Cache].[Concept.Mesh.Person]([PersonID],[MeshHeader],[NumPubsAll],[NumPubsThis],[Weight],[FirstPublicationYear],[LastPublicationYear],[MaxAuthorWeight],[WeightCategory])
	EXEC sp_executesql @sql	    
	
	--	[Profile.Data].[Publication.PubMed.General]dbo.pm_pubs_general
	DELETE FROM [Profile.Data].[Publication.PubMed.General]
	SELECT @sql = 'SELECT[PMID],[Owner],[Status],[PubModel],[Volume],[Issue],[MedlineDate],[JournalYear],[JournalMonth],[JournalDay],[JournalTitle],[ISOAbbreviation],[MedlineTA],[ArticleTitle],[MedlinePgn],[AbstractText],[ArticleDateType],[ArticleYear],[ArticleMonth],[ArticleDay],[Affiliation],[AuthorListCompleteYN],[GrantListCompleteYN],[PubDate],[Authors]FROM '+ @SourceDBName + '.dbo.pm_pubs_general'
	INSERT INTO [Profile.Data].[Publication.PubMed.General]([PMID],[Owner],[Status],[PubModel],[Volume],[Issue],[MedlineDate],[JournalYear],[JournalMonth],[JournalDay],[JournalTitle],[ISOAbbreviation],[MedlineTA],[ArticleTitle],[MedlinePgn],[AbstractText],[ArticleDateType],[ArticleYear],[ArticleMonth],[ArticleDay],[Affiliation],[AuthorListCompleteYN],[GrantListCompleteYN],[PubDate],[Authors])
	EXEC sp_executesql @sql	    
	
	--	[Profile.Data].[Publication.MyPub.General]dbo.my_pubs_general
	DELETE FROM [Profile.Data].[Publication.MyPub.General]
	SELECT @sql = 'SELECT[MPID],[PersonID],[PMID],[HmsPubCategory],[NlmPubCategory],[PubTitle],[ArticleTitle],[ArticleType],[ConfEditors],[ConfLoc],[EDITION],[PlaceOfPub],[VolNum],[PartVolPub],[IssuePub],[PaginationPub],[AdditionalInfo],[Publisher],[SecondaryAuthors],[ConfNm],[ConfDTs],[ReptNumber],[ContractNum],[DissUnivNm],[NewspaperCol],[NewspaperSect],[PublicationDT],[Abstract],[Authors],[URL],[CreatedDT],[CreatedBy],[UpdatedDT],[UpdatedBy] FROM '+ @SourceDBName + '.dbo.my_pubs_general'
	INSERT INTO [Profile.Data].[Publication.MyPub.General]([MPID],[PersonID],[PMID],[HmsPubCategory],[NlmPubCategory],[PubTitle],[ArticleTitle],[ArticleType],[ConfEditors],[ConfLoc],[EDITION],[PlaceOfPub],[VolNum],[PartVolPub],[IssuePub],[PaginationPub],[AdditionalInfo],[Publisher],[SecondaryAuthors],[ConfNm],[ConfDTs],[ReptNumber],[ContractNum],[DissUnivNm],[NewspaperCol],[NewspaperSect],[PublicationDT],[Abstract],[Authors],[URL],[CreatedDT],[CreatedBy],[UpdatedDT],[UpdatedBy] )
	EXEC sp_executesql @sql	    
	
	--	[Profile.Data].[Publication.PubMed.Mesh]
	DELETE FROM [Profile.Data].[Publication.PubMed.Mesh]
	SELECT @sql = 'SELECT [PMID],[descriptorname],[QualifierName],[MajorTopicYN] FROM '+ @SourceDBName + '.dbo.pm_pubs_mesh'
	INSERT INTO [Profile.Data].[Publication.PubMed.Mesh]( [PMID],[descriptorname],[QualifierName],[MajorTopicYN])
	EXEC sp_executesql @sql	 
	
	--	[Profile.Data].[Publication.Person.Include]dbo.publications_include
	TRUNCATE TABLE [Profile.Data].[Publication.Person.Include]
	SELECT @sql = 'SELECT[PubID],[PersonID],[PMID],[MPID] FROM '+ @SourceDBName + '.dbo.publications_include'
	INSERT INTO [Profile.Data].[Publication.Person.Include]([PubID],[PersonID],[PMID],[MPID])
	EXEC sp_executesql @sql	    
	 
	--	[User.Account].[User]dbo.[user]
	SET IDENTITY_INSERT [User.Account].[User] ON 
	DELETE FROM [User.Account].[User]
	SELECT @sql = 'SELECT[UserID],EmailAddr,[PersonID],[IsActive],[CanBeProxy],[FirstName],[LastName],[DisplayName],[InstitutionFullName],[DepartmentFullName],[DivisionFullName],[UserName],[Password],[CreateDate],[ApplicationName],[Comment],[IsApproved],[IsOnline],[InternalUserName] FROM '+ @SourceDBName + '.dbo.[user] '
	INSERT INTO [User.Account].[User]([UserID],EmailAddr,[PersonID],[IsActive],[CanBeProxy],[FirstName],[LastName],[DisplayName],[Institution],[Department],[Division],[UserName],[Password],[CreateDate],[ApplicationName],[Comment],[IsApproved],[IsOnline],[InternalUserName])
	EXEC sp_executesql @sql	    
	SET IDENTITY_INSERT [User.Account].[User] OFF  
 
	--  [User.Account].DefaultProxy
	DELETE FROM [User.Account].DefaultProxy
	SELECT @sql = 'SELECT proxy, institution,department,NULL, case when ishidden=''Y'' then 0 else 1 end	FROM  '+ @SourceDBName + '.dbo.[proxies_default]  '
	INSERT INTO [User.Account].DefaultProxy
	        ( UserID ,
	          ProxyForInstitution ,
	          ProxyForDepartment ,
	          ProxyForDivision ,
	          IsVisible
	        )
	EXEC sp_executesql @sql	 
	
	-- [User.Account].DesignatedProxy 
	DELETE FROM [User.Account].DesignatedProxy 
	SELECT @sql = 'select  Proxy, PersonID FROM  '+ @SourceDBName + '.dbo.[proxies_designated]  '
	INSERT INTO [User.Account].DesignatedProxy ( UserID, ProxyForUserID )
	EXEC sp_executesql @sql 
	
	-- [User.Account].Relationship 
	DELETE FROM [User.Account].Relationship
	SELECT @sql = 'select UserID, personid,RelationshipType FROM  '+ @SourceDBName + '.dbo.[user_relationships]  '
	INSERT INTO [User.Account].Relationship ( UserID, personid,RelationshipType )
	EXEC sp_executesql @sql 
	 
	-- [Profile.Import].[Beta.DisplayPreference]
	TRUNCATE TABLE [Profile.Import].[Beta.DisplayPreference]
	SELECT @sql = 'select PersonID,ShowPhoto,ShowPublications,ShowAwards,ShowNarrative,ShowAddress,ShowEmail,ShowPhone,ShowFax,PhotoPreference FROM  '+ @SourceDBName + '.dbo.[display_prefs]  '
	INSERT INTO [Profile.Import].[Beta.DisplayPreference] (PersonID,ShowPhoto,ShowPublications,ShowAwards,ShowNarrative,ShowAddress,ShowEmail,ShowPhone,ShowFax,PhotoPreference )
	EXEC sp_executesql @sql 			
	
	-- [Profile.Data].[Person.Photo]
	TRUNCATE TABLE [Profile.Data].[Person.Photo]
	SELECT @sql = 'select PersonID,Photo,PhotoLink  FROM  '+ @SourceDBName + '.dbo.[photo]  '
	INSERT INTO [Profile.Data].[Person.Photo] (PersonID,Photo,PhotoLink )
	EXEC sp_executesql @sql 	
	
	  
	 
	-- Toggle off fkey constraints
	ALTER TABLE [Profile.Data].[Person.FilterRelationship]  CHECK CONSTRAINT FK_person_type_relationships_person
	ALTER TABLE [Profile.Data].[Person.FilterRelationship]  CHECK CONSTRAINT FK_person_type_relationships_person_types	
	ALTER TABLE [Profile.Data].[Publication.Person.Include]  CHECK CONSTRAINT FK_publications_include_pm_pubs_general
	ALTER TABLE [Profile.Data].[Publication.MyPub.General]  CHECK CONSTRAINT FK_my_pubs_general_person
	ALTER TABLE [Profile.Data].[Publication.Person.Include]  CHECK CONSTRAINT FK_publications_include_person
	ALTER TABLE [Profile.Data].[Publication.Person.Include]  CHECK CONSTRAINT FK_publications_include_my_pubs_general 
 
	
	-- Popluate [Publication.Entity.Authorship] and [Publication.Entity.InformationResource] tables
	EXEC [Profile.Data].[Publication.Entity.UpdateEntity]
 
END

GO


