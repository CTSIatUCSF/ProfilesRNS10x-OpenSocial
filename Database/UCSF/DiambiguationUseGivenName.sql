/****** Object:  View [UCSF].[Person]    Script Date: 12/13/2012 13:50:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE view [UCSF].[Person]
as
SELECT p.[PersonID]
      ,p.[UserID]
      ,p.[FirstName]
      ,isnull(un.[PUBLISHING_FIRST], isnull(u.[GIVEN_NAME], p.[FirstName])) [PublishingFirst]
      ,p.[LastName]
      ,p.[MiddleName]
      ,p.[DisplayName]
      ,p.[Suffix]
      ,p.[IsActive]
      ,p.[EmailAddr]
      ,p.[Phone]
      ,p.[Fax]
      ,p.[AddressLine1]
      ,p.[AddressLine2]
      ,p.[AddressLine3]
      ,p.[AddressLine4]
      ,p.[City]
      ,p.[State]
      ,p.[Zip]
      ,p.[Building]
      ,p.[Floor]
      ,p.[Room]
      ,p.[AddressString]
      ,p.[Latitude]
      ,p.[Longitude]
      ,p.[GeoScore]
      ,p.[FacultyRankID]
      ,p.[InternalUsername]
      ,p.[Visible]
  FROM [Profile.Data].[Person] p LEFT JOIN [cls].[dbo].[vw_UCSFPRO1] u on p.internalusername = u.INDIVIDUAL_ID
	LEFT JOIN [cls].[dbo].[uniqueNames] un on un.INDIVIDUAL_ID = u.INDIVIDUAL_ID

GO

ALTER view [UCSF].[vwPerson]
as
		SELECT p.personid,
					 p.userid,
					 p.internalusername,
					 p.firstname,
					 p.publishingfirst,
					 p.lastname,
					 p.displayname, 
					 CASE WHEN ISNULL(dp.ShowAddress,'Y')='Y' THEN p.addressline1 END addressline1,
					 CASE WHEN ISNULL(dp.ShowAddress,'Y')='Y' THEN p.addressline2 END addressline2,
					 CASE WHEN ISNULL(dp.ShowAddress,'Y')='Y' THEN p.addressline3 END addressline3,
					 CASE WHEN ISNULL(dp.ShowAddress,'Y')='Y' THEN p.addressline4 END addressline4,
					 CASE WHEN ISNULL(dp.ShowAddress,'Y')='Y' THEN p.addressstring END addressstring, 
					 CASE WHEN ISNULL(dp.ShowAddress,'Y')='Y' THEN  p.building END building,
					 CASE WHEN ISNULL(dp.ShowAddress,'Y')='Y' THEN  p.room END room,
					 CASE WHEN ISNULL(dp.ShowAddress,'Y')='Y' THEN  p.floor END floor, 
					 CASE WHEN ISNULL(dp.ShowAddress,'Y')='Y' THEN  p.latitude END latitude, 
					 CASE WHEN ISNULL(dp.ShowAddress,'Y')='Y' THEN  p.longitude END longitude,
					 CASE WHEN ISNULL(dp.ShowAddress,'Y')='Y' THEN p.phone END phone,
					 CASE WHEN ISNULL(dp.ShowAddress,'Y')='Y' THEN p.fax END fax,  
					 CASE WHEN ISNULL(dp.ShowEmail,'Y') = 'Y' THEN p.emailaddr END emailaddr,
					 i2.institutionname,
					 i2.institutionabbreviation, 
					 de.departmentname,
					 dv.divisionname,  
					 A.facultyrank, 
					 A.facultyranksort, 
					 p.isactive,
					 ISNULL(dp.ShowAddress,'Y')ShowAddress,
					 ISNULL(dp.ShowPhone,'Y')ShowPhone,
					 ISNULL(dp.Showfax,'Y')Showfax,
					 ISNULL(dp.ShowEmail,'Y')ShowEmail,
					 ISNULL(dp.ShowPhoto,'N')ShowPhoto,
					 ISNULL(dp.ShowAwards,'N')ShowAwards,
					 ISNULL(dp.ShowNarrative,'N')ShowNarrative,
					 ISNULL(dp.ShowPublications,'Y')ShowPublications, 
					 ISNULL(p.visible,1)visible,
					 0 numpublications
			FROM [UCSF].Person p
 LEFT JOIN [Profile.Cache].Person ps				 ON ps.personid = p.personid
 LEFT JOIN [Profile.Data].[Person.Affiliation] pa				 ON pa.personid = p.personid
																				AND pa.isprimary=1 
 LEFT JOIN [Profile.Data].[Organization.Institution] i2				 ON pa.institutionid = i2.institutionid 
 LEFT JOIN [Profile.Data].[Organization.Department] de				 ON de.departmentid = pa.departmentid
 LEFT JOIN [Profile.Data].[Organization.Division] dv				 ON dv.divisionid = pa.divisionid
 LEFT JOIN [Profile.Import].[Beta.DisplayPreference] dp on dp.PersonID=p.PersonID 
 OUTER APPLY(SELECT TOP 1 facultyrank ,facultyranksort from [Profile.Data].[Person.Affiliation] pa JOIN [Profile.Data].[Person.FacultyRank] fr on fr.facultyrankid = pa.facultyrankid  where personid = p.personid order by facultyranksort asc)a
 WHERE p.isactive = 1

GO

/****** Object:  StoredProcedure [Profile.Data].[Publication.PubMed.GetPersonInfoForDisambiguation]    Script Date: 12/13/2012 11:25:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [Profile.Data].[Publication.PubMed.GetPersonInfoForDisambiguation] 
AS
BEGIN
SET nocount  ON;
 
 
DECLARE  @search XML,
		 @batchID UNIQUEIDENTIFIER,
		 @batchcount INT,
		 @threshold FLOAT
 
--SET Custom Threshold based on internal Institutional Logic, default is .98
SELECT @threshold = .98
 
SELECT @batchID=NEWID()
 
SELECT personid, 
			 (SELECT ISNULL(RTRIM(publishingfirst),'')  "Name/First",
							 ISNULL(RTRIM(middlename),'') "Name/Middle",
							 ISNULL(RTRIM(p.lastname),'') "Name/Last",
							 ISNULL(RTRIM(suffix),'')     "Name/Suffix",
							 CASE 
								 WHEN a.n is not null or b.n is not null 
									    /*  Below is example of a custom piece of logic to alter the disambiguation by telling the disambiguation service
										to Require First Name usage in the algorithm for faculty who are lower in rank */
									or facultyranksort > 4 
									THEN 'true'
								 ELSE 'false'
							 END "RequireFirstName",
							 d.cnt													"LocalDuplicateNames",
							 @threshold												"MatchThreshold",
							 (SELECT DISTINCT ISNULL(LTRIM(ISNULL(emailaddress,p.emailaddr)),'') Email
									FROM [Profile.Data].[Person.Affiliation] pa
								 WHERE pa.personid = p.personid
								FOR XML PATH(''),TYPE) AS "EmailList",
							 (SELECT Affiliation
									FROM [Profile.Data].[Publication.PubMed.DisambiguationAffiliation]
								FOR XML PATH(''),TYPE) AS "AffiliationList",
							(SELECT PMID
							   FROM [Profile.Data].[Publication.Person.Add]
							  WHERE personid =p2.personid
						    FOR XML PATH(''),ROOT('PMIDAddList'),TYPE),
							(SELECT PMID
							   FROM [Profile.Data].[Publication.Person.Exclude]
							  WHERE personid =p2.personid
						    FOR XML PATH(''),ROOT('PMIDExcludeList'),TYPE)
					FROM [UCSF].[Person] p 
						   LEFT JOIN ( 
								
									   --case 1
										SELECT LEFT(publishingfirst,1)  f,
													 LEFT(middlename,1) m,
													 lastname,
													 COUNT(* )          n
										  FROM [UCSF].[Person]
										 GROUP BY LEFT(publishingfirst,1),
													 LEFT(middlename,1),
													 lastname
										HAVING COUNT(* ) > 1
									)A ON a.lastname = p.lastname
									  and a.f=left(publishingfirst,1)
									  and a.m = left(middlename,1)
					LEFT JOIN (			  
 
									--case 2
									SELECT LEFT(publishingfirst,1) f,
												 lastname,
												 COUNT(* )         n
									  FROM [UCSF].[Person]
									 GROUP BY LEFT(publishingfirst,1),
												 lastname
									HAVING COUNT(* ) > 1
												 AND SUM(CASE 
																	 WHEN middlename = '' THEN 1
																	 ELSE 0
																 END) > 0
																
								)B on b.f = left(publishingfirst,1)
								  and b.lastname = p.lastname
					 LEFT JOIN ( SELECT [Utility.NLP].[fnNamePart1](publishingfirst)F,
															lastname,
															COUNT(*)cnt
													 from [UCSF].[Person]
												 GROUP BY [Utility.NLP].[fnNamePart1](publishingfirst), 
															lastname
											)d on d.f = [Utility.NLP].[fnNamePart1](p2.publishingfirst)
												and d.lastname = p2.lastname
 
										 
				 WHERE p.personid = p2.personid
				 
				FOR XML PATH(''),ROOT('FindPMIDs')) XML--as xml)
  INTO #batch
  FROM [UCSF].vwperson  p2 
  
   
SELECT @batchcount=@@ROWCOUNT
 
SELECT @BatchID,@batchcount,*
  FROM #batch 
END

GO


