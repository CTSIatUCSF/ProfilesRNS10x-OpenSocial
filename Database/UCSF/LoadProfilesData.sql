/****** Object:  StoredProcedure [Profile.Import].[LoadProfilesData]    Script Date: 10/19/2012 12:24:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*

Copyright (c) 2008-2010 by the President and Fellows of Harvard College. All rights reserved.  Profiles Research Networking Software was developed under the supervision of Griffin M Weber, MD, PhD., and Harvard Catalyst: The Harvard Clinical and Translational Science Center, with support from the National Center for Research Resources and Harvard University.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    * Neither the name "Harvard" nor the names of its contributors nor the name "Harvard Catalyst" may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER (PRESIDENT AND FELLOWS OF HARVARD COLLEGE) AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.




*/
ALTER procedure [Profile.Import].[LoadProfilesData]	(
												@use_internalusername_as_pkey BIT=0)
AS
BEGIN
	SET NOCOUNT ON;	

												
	-- Start Transaction. Log load failures, roll back transaction on error.
	BEGIN TRY
				BEGIN TRAN				 

					  DECLARE @ErrMsg nvarchar(4000), @ErrSeverity int
						 

						-- Department
						INSERT INTO [Profile.Data].[Organization.Department](departmentname,visible)
						SELECT DISTINCT
									 departmentname, 
									 1
							FROM [Profile.Import].PersonAffiliation a
						 WHERE departmentname IS NOT NULL 
							 and departmentname NOT IN (SELECT departmentname FROM [Profile.Data].[Organization.Department])


						-- institution
						INSERT INTO [Profile.Data].[Organization.Institution]
										( InstitutionName ,
											InstitutionAbbreviation
										)					 
						SELECT	INSTITUTIONNAME,
										INSTITUTIONABBREVIATION
							FROM (
										SELECT	INSTITUTIONNAME,
														INSTITUTIONABBREVIATION, 
														COUNT(*)CNT,		
														ROW_NUMBER() OVER(PARTITION BY institutionname order by SUM(CASE WHEN INSTITUTIONABBREVIATION='' THEN 0 ELSE 1 END) desc)rank
											FROM  [Profile.Import].PersonAffiliation
									GROUP BY  INSTITUTIONNAME,
														INSTITUTIONABBREVIATION
										)A
							WHERE rank=1
								AND institutionname <>''
								AND NOT EXISTS(SELECT b.institutionname 
																FROM [Profile.Data].[Organization.Institution] b
															 WHERE b.institutionname=a.institutionname)
 
					
						-- division
						INSERT INTO [Profile.Data].[Organization.Division]
										( DivisionName  
										)
						SELECT DISTINCT 
									 divisionname 
							FROM [Profile.Import].PersonAffiliation a
						 WHERE divisionname IS NOT NULL
							 AND NOT EXISTS(SELECT b.divisionname 
																FROM [Profile.Data].[Organization.Division] b
															 WHERE b.divisionname=a.divisionname)
 
						-- Flag deleted people
						UPDATE [Profile.Data].Person
							 SET ISactive=0
						 WHERE internalusername NOT IN(SELECT internalusername FROM [Profile.Import].Person)
				
					-- Update person/user records where data has changed. 
						UPDATE p
						   SET p.firstname=lp.firstname,
									 p.lastname=lp.lastname,
									 p.middlename=lp.middlename,
									 p.displayname=lp.displayname, 
									 p.suffix=lp.suffix,
									 p.addressline1=lp.addressline1,
									 p.addressline2=lp.addressline2,
									 p.addressline3=lp.addressline3,
									 p.addressline4=lp.addressline4, 
									 p.city=lp.city,
									 p.state=lp.state,
									 p.zip=lp.zip, 
									 p.building=lp.building,
									 p.room=lp.room,
									 p.phone=lp.phone,
									 p.fax=lp.fax, 
									 p.EmailAddr=lp.EmailAddr,
									 p.AddressString=lp.AddressString,    
									 p.isactive=lp.isactive,
									 p.visible=lp.isvisible
					  FROM [Profile.Data].Person p
	          JOIN [Profile.Import].Person lp on lp.internalusername = p.internalusername
																				  and (ISNULL(lp.firstname,'')<>ISNULL(p.firstname,'')
																					 or ISNULL(lp.lastname,'')<>ISNULL(p.lastname,'')
																					 or ISNULL(lp.middlename,'')<>ISNULL(p.middlename,'')
																					 or ISNULL(lp.displayname,'')<>ISNULL(p.displayname,'') 
																					 or ISNULL(lp.suffix,'')<>ISNULL(p.suffix,'')
																					 or ISNULL(lp.addressline1,'')<>ISNULL(p.addressline1,'')
																					 or ISNULL(lp.addressline2,'')<>ISNULL(p.addressline2,'')
																					 or ISNULL(lp.addressline3,'')<>ISNULL(p.addressline3,'')
																					 or ISNULL(lp.addressline4,'')<>ISNULL(p.addressline4,'') 
																					 or ISNULL(lp.city,'')<>ISNULL(p.city,'') 
																					 or ISNULL(lp.state,'')<>ISNULL(p.state,'') 
																					 or ISNULL(lp.zip,'')<>ISNULL(p.zip,'') 
																					 or ISNULL(lp.building,'')<>ISNULL(p.building,'')
																					 or ISNULL(lp.room,'')<>ISNULL(p.room,'')
																					 or ISNULL(lp.phone,'')<>ISNULL(p.phone,'')
																					 or ISNULL(lp.fax,'')<>ISNULL(p.fax,'') 
																					 or ISNULL(lp.EmailAddr,'')<>ISNULL(p.EmailAddr,'')
																					 or ISNULL(lp.AddressString,'')<>ISNULL(p.AddressString,'')  
																					 or ISNULL(lp.Isactive,'')<>ISNULL(p.Isactive,'')
																					 or ISNULL(lp.isvisible,'')<>ISNULL(p.visible,'')) 
						-- Update changed user info
						UPDATE	 u
						   SET	 u.firstname=up.firstname,
								 u.lastname=up.lastname,
								 u.displayname=up.displayname,   
								 u.institution=up.institution,
								 u.department=up.department ,
								 u.emailaddr = up.emailaddr
					  FROM [User.Account].[User] u
	          JOIN [Profile.Import].[User] up on up.internalusername = u.internalusername
													 and (ISNULL(up.firstname,'')<>ISNULL(u.firstname,'')
														 or ISNULL(up.lastname,'')<>ISNULL(u.lastname,'')
														 or ISNULL(up.displayname,'')<>ISNULL(u.displayname,'')  
														 or ISNULL(up.institution,'')<>ISNULL(u.institution,'')
														 or ISNULL(up.department,'')<>ISNULL(u.department,'') 
														 or ISNULL(up.emailaddr,'')<>ISNULL(u.emailaddr,'') )
				  
					-- Remove Affiliations that have changed, so they'll be re-added
				 SELECT DISTINCT COALESCE(  p.internalusername,p.internalusername )internalusername
					 INTO #affiliations
					 FROM [Profile.Cache].[Person.Affiliation] cpa 
			     JOIN [Profile.Data].Person p ON p.personid = cpa.personid
			FULL join [Profile.Import].PersonAffiliation pa on pa.internalusername = p.internalusername
													and ISNULL(pa.affiliationorder,'')=ISNULL(cpa.sortorder,'')
													and ISNULL(pa.primaryaffiliation,'') = ISNULL(cpa.isprimary,'')
													and ISNULL(pa.title,'') = ISNULL(cpa.title,'') 
													and ISNULL(pa.institutionabbreviation,'') = ISNULL(cpa.institutionabbreviation,'')
													and ISNULL(pa.departmentname,'') = ISNULL(cpa.departmentname,'')
													and ISNULL(pa.divisionname,'') = ISNULL(cpa.divisionname,'')
													and ISNULL(pa.facultyrank,'') = ISNULL(cpa.facultyrank,'')
					WHERE  pa.internalusername IS NULL OR cpa.personid IS NULL
					
					DELETE FROM [Profile.Data].[Person.Affiliation] where personid in (SELECT personid FROM [Profile.Data].Person WHERE internalusername IN ( SELECT internalusername FROM #affiliations	))
					
					-- Remove Filters that have changed, so they'll be re-added
					DELETE 
					  FROM [Profile.Data].[Person.FilterRelationship] 
					 WHERE personid IN (SELECT personid 
														    FROM [Profile.Data].Person  
														   WHERE InternalUsername IN 
																					(
																							SELECT  coalesce( a.internalusername, p.internalusername )
																								FROM [Profile.Import].PersonFilterFlag pf
																								JOIN [Profile.Import].Person p on p.internalusername = pf.internalusername
																					 FULL JOIN (select internalusername,personfilter 
																												from [Profile.Data].[Person.FilterRelationship] pfr
																												JOIN [Profile.Data].Person  p ON p.personid = pfr.personid 
																												join [Profile.Data].[Person.Filter] pf on pf.personfilterid = pfr.personfilterid)a ON a.internalusername = p.internalusername 
																																																													AND a.personfilter = pf.personfilter
																						WHERE a.internalusername is null or p.internalusername is null
																						))
 
				  			 
								 
						 
								 
									 
					-- user
					IF @use_internalusername_as_pkey=0
					BEGIN
						INSERT INTO [User.Account].[User]
						        ( IsActive ,
						          CanBeProxy ,
						          FirstName ,
						          LastName ,
						          DisplayName ,
						          Institution ,
						          Department ,
						          InternalUserName ,
						          emailaddr 
						        ) 
							SELECT 1,
										 canbeproxy,
										 ISNULL(firstname,''),
										 ISNULL(lastname,''),
										 ISNULL(displayname,''),  
										 institution, 
										 department,
						         InternalUserName 	,
						         emailaddr								 
								FROM [Profile.Import].[User] u 
							 WHERE NOT EXISTS (SELECT * 
															 FROM [User.Account].[User] b
															WHERE b.internalusername=u.internalusername)
					 UNION
						 SELECT  1,
										 1,
										 ISNULL(firstname,''),
										 ISNULL(lastname,''),
										 ISNULL(displayname,''), 
										 institutionname, 
										 departmentname,
						         u.InternalUserName,
						         u.emailaddr 
								FROM [Profile.Import].Person u 
					 LEFT JOIN [Profile.Import].PersonAffiliation pa on pa.internalusername = u.internalusername 
																						and pa.primaryaffiliation=1
							 WHERE NOT EXISTS (SELECT * 
															 FROM [User.Account].[User] b
															WHERE b.internalusername=u.internalusername)
						END
					ELSE
						BEGIN
							SET IDENTITY_INSERT [User.Account].[User] ON 

							INSERT INTO [User.Account].[User]
						        ( userid,
											IsActive ,
						          CanBeProxy ,
						          FirstName ,
						          LastName ,
						          DisplayName ,
						          Institution ,
						          Department  ,
						          InternalUserName  ,
						          emailaddr 
						        ) 
							SELECT [UCSF].[fnGeneratePersonID](u.internalusername),
											1,
										 canbeproxy,
										 ISNULL(firstname,''),
										 ISNULL(lastname,''),
										 ISNULL(displayname,''),  
										 institution, 
										 department,
						          InternalUserName 	,
						          emailaddr 								 
								FROM [Profile.Import].[User] u 
							 WHERE NOT EXISTS (SELECT * 
															 FROM [User.Account].[User] b
															WHERE b.internalusername=u.internalusername)
					 UNION ALL
						 SELECT  [UCSF].[fnGeneratePersonID](u.internalusername),
											1,
										 1,
										 ISNULL(firstname,''),
										 ISNULL(lastname,''),
										 ISNULL(displayname,''), 
										 institutionname, 
										 departmentname,
						          u.InternalUserName ,
						          u.emailaddr 
								FROM [Profile.Import].Person u 
					 LEFT JOIN [Profile.Import].PersonAffiliation pa on pa.internalusername = u.internalusername 
																						and pa.primaryaffiliation=1
							 WHERE NOT EXISTS (SELECT * 
															 FROM [User.Account].[User] b
															WHERE b.internalusername=u.internalusername)
						   AND NOT EXISTS (SELECT * FROM [Profile.Import].[User] b WHERE b.internalusername =u.internalusername)
						   
							SET IDENTITY_INSERT [User.Account].[User] OFF
						END

					-- faculty ranks
					INSERT INTO [Profile.Data].[Person.FacultyRank]
					        ( FacultyRank ,
					          FacultyRankSort ,
					          Visible
					        ) 
					SELECT DISTINCT 
								 facultyrank,
								 facultyrankorder,
								 1 
						FROM [Profile.Import].PersonAffiliation p
					 WHERE   NOT EXISTS (SELECT * 
										 FROM [Profile.Data].[Person.FacultyRank] a
										WHERE a.facultyrank=p.facultyrank)

					-- person
					IF @use_internalusername_as_pkey=0
					BEGIN				
						INSERT INTO [Profile.Data].Person
						        ( UserID ,
						          FirstName ,
						          LastName ,
						          MiddleName ,
						          DisplayName ,
						          Suffix ,
						          IsActive ,
						          EmailAddr ,
						          Phone ,
						          Fax ,
						          AddressLine1 ,
						          AddressLine2 ,
						          AddressLine3 ,
						          AddressLine4 ,
						          city ,
						          state ,
						          zip ,
						          Building ,
						          Floor ,
						          Room ,
						          AddressString ,
						          Latitude ,
						          Longitude ,
						          FacultyRankID ,
						          InternalUsername ,
						          Visible
						        )
					  SELECT  UserID,
										ISNULL(p.FirstName,''),
										ISNULL(p.LastName,''),
										ISNULL(p.MiddleName,''),
										ISNULL(p.DisplayName,''), 
										ISNULL(Suffix,''),
										p.IsActive,
										p.EmailAddr,
										Phone,
										Fax,
										AddressLine1,
										AddressLine2,
										AddressLine3,
										AddressLine4,
					          city ,
					          state ,
					          zip ,
										Building,
										Floor,
										Room,
										AddressString,
										Latitude,
										Longitude,
										FacultyRankID ,
										p.InternalUsername,
										p.isvisible
						 FROM  [Profile.Import].Person p
				LEFT JOIN  [Profile.Import].PersonAffiliation pa on pa.internalusername = p.internalusername 
																					and pa.primaryaffiliation=1
				LEFT JOIN  [Profile.Data].[Person.FacultyRank] fr on fr.facultyrank=pa.facultyrank
						 JOIN  [User.Account].[User] u ON u.internalusername = p.internalusername 
						WHERE  NOT EXISTS (SELECT * 
										 FROM [Profile.Data].Person b
								 		WHERE b.internalusername=p.internalusername)  
						END
					ELSE
						BEGIN
							SET IDENTITY_INSERT [Profile.Data].Person ON
							INSERT INTO [Profile.Data].Person
						        ( personid,
											UserID ,
						          FirstName ,
						          LastName ,
						          MiddleName ,
						          DisplayName ,
						          Suffix ,
						          IsActive ,
						          EmailAddr ,
						          Phone ,
						          Fax ,
						          AddressLine1 ,
						          AddressLine2 ,
						          AddressLine3 ,
						          AddressLine4 ,
						          Building ,
						          Floor ,
						          Room ,
						          AddressString ,
						          Latitude ,
						          Longitude ,
						          FacultyRankID ,
						          InternalUsername ,
						          Visible
						        )
					  SELECT  [UCSF].[fnGeneratePersonID](p.internalusername),
										userid,
										ISNULL(p.FirstName,''),
										ISNULL(p.LastName,''),
										ISNULL(p.MiddleName,''),
										ISNULL(p.DisplayName,''), 
										ISNULL(Suffix,''),
										p.IsActive,
										p.EmailAddr,
										Phone,
										Fax,
										AddressLine1,
										AddressLine2,
										AddressLine3,
										AddressLine4,
										Building,
										Floor,
										Room,
										AddressString,
										Latitude,
										Longitude,
										FacultyRankID ,
										p.InternalUsername,
										p.isvisible
						 FROM  [Profile.Import].Person p
				LEFT JOIN  [Profile.Import].PersonAffiliation pa on pa.internalusername = p.internalusername 
																					and pa.primaryaffiliation=1
				LEFT JOIN  [Profile.Data].[Person.FacultyRank] fr on fr.facultyrank=pa.facultyrank
						 JOIN  [User.Account].[User] u ON u.internalusername = p.internalusername 
						WHERE  NOT EXISTS (SELECT * 
										 FROM [Profile.Data].Person b
								 		WHERE b.internalusername=p.internalusername)  
							SET IDENTITY_INSERT [Profile.Data].Person OFF

						END
 
						-- add personid to user
						UPDATE u
							 SET u.personid = p.personid
							FROM [Profile.Data].Person p
						  JOIN [User.Account].[User] u  ON u.userid = p.userid
						 
				 
					-- person affiliation
					INSERT INTO [Profile.Data].[Person.Affiliation]
					        ( PersonID ,
					          SortOrder ,
					          IsActive ,
					          IsPrimary ,
					          InstitutionID ,
					          DepartmentID ,
					          DivisionID ,
					          Title ,
					          EmailAddress ,
					          FacultyRankID
					        ) 
					SELECT p.personid,
								 affiliationorder,
								 1,
								 primaryaffiliation ,
								 InstitutionID,
								 DepartmentID,
								 DivisionID,
								 c.title,
								 c.emailaddr,
								 fr.facultyrankid
						from [Profile.Import].PersonAffiliation c 
						JOIN [Profile.Data].Person p on c.internalusername=p.internalusername
			 LEFT JOIN [Profile.Data].[Organization.Institution] i ON i.institutionname = c.institutionname 
			 LEFT JOIN [Profile.Data].[Organization.Department] d  ON d.departmentname = c.departmentname
			 LEFT JOIN [Profile.Data].[Organization.Division] di ON di.divisionname = c.divisionname
			 LEFT JOIN [Profile.Data].[Person.FacultyRank] fr on fr.facultyrank = c.facultyrank 
					 WHERE NOT EXISTS (SELECT *
															 FROM [Profile.Data].[Person.Affiliation] a
															WHERE a.personid=p.personid
														    AND ISNULL(a.InstitutionID,'')=ISNULL(i.InstitutionID,'')
																AND ISNULL(a.DepartmentID,'') = ISNULL(d.DepartmentID,'')
																AND ISNULL(a.DivisionID,'')=ISNULL(di.DivisionID,''))
				 

					-- person_filters
					INSERT INTO [Profile.Data].[Person.Filter]
					        ( PersonFilter 
					        ) 
					 
					SELECT DISTINCT 
								 personfilter
						FROM [Profile.Import].PersonFilterFlag b
				   WHERE NOT EXISTS (SELECT * 
															 FROM [Profile.Data].[Person.Filter] a
															WHERE a.personfilter = b.personfilter)


				-- person_filter_relationships
					INSERT INTO [Profile.Data].[Person.FilterRelationship]
					        ( PersonID ,
					          PersonFilterid
					        ) 
						  SELECT DISTINCT
								 p.personid,
								 personfilterid 
						FROM [Profile.Import].PersonFilterFlag ptf
			 			JOIN [Profile.Data].[Person.Filter] pt on pt.personfilter=ptf.personfilter
				 		JOIN [Profile.Data].Person p on p.internalusername = ptf.internalusername 
				   WHERE NOT EXISTS (SELECT * 
										 FROM [Profile.Data].[Person.FilterRelationship] ptf
										 JOIN [Profile.Data].[Person.Filter] pt2 on pt2.personfilterid=ptf.personfilterid
										 JOIN [Profile.Data].Person p2 on p2.personid=ptf.personid 
									  WHERE (p2.personid=p.personid 
										 and pt.personfilterid=pt2.personfilterid  
										 )
										 )												     										     
 
				 
			-- Hide/Show Departments
			update d
			set d.visible = isnull(t.v,0)
			from [Profile.Data].[Organization.Department] d left outer join (
				select a.departmentname, max(cast(a.departmentvisible as int)) v
				from [Profile.Import].PersonAffiliation a, [Profile.Import].Person p
				where a.internalusername = p.internalusername and p.isactive = 1
				group by a.departmentname
			) t on d.departmentname = t.departmentname

 
		COMMIT
	END TRY
	BEGIN CATCH
			--Check success
			IF @@TRANCOUNT > 0  ROLLBACK

			-- Raise an error with the details of the exception
			SELECT @ErrMsg =  ERROR_MESSAGE(),
						 @ErrSeverity = ERROR_SEVERITY()

			RAISERROR(@ErrMsg, @ErrSeverity, 1)
	END CATCH	
				
	END

GO


