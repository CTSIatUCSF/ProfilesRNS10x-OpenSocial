--CREATE Schema [ORNG] authorization [dbo];
GO
/****** Object:  Table [ORNG].[Apps]    Script Date: 08/31/2011 14:29:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORNG].[Apps](
	[appId] [int] NOT NULL,
	[name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[url] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PersonFilterID] [int] NULL,
	[enabled] [bit] NOT NULL CONSTRAINT [DF_orng_apps_enabled]  DEFAULT ((1)),
	[channels] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__app] PRIMARY KEY CLUSTERED 
(
	[appId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [ORNG].[AppViews]    Script Date: 08/31/2011 14:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ORNG].[AppViews](
	[appId] [int] NOT NULL,
	[viewer_req] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[owner_req] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[page] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[view] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[chromeId] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[display_order] [int] NULL,
	[opt_params] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [ORNG].[AppViews]  WITH CHECK ADD  CONSTRAINT [FK_orng_app_views_apps] FOREIGN KEY([appId])
REFERENCES [ORNG].[apps] ([appId])

/****** Object:  Table [ORNG].[AppRegistry]    Script Date: 08/31/2011 14:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORNG].[AppRegistry](
	[appId] [int] NOT NULL,
	[personId] [nvarchar](255) NOT NULL,
	[createdDT] [datetime] NULL CONSTRAINT [DF_orng_app_registry_createdDT]  DEFAULT (getdate())
) ON [PRIMARY]

/****** Object:  Table [ORNG].[AppData]    Script Date: 08/31/2011 14:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORNG].[AppData](
	[userId] [nvarchar](255) NOT NULL,
	[appId] [int] NOT NULL,
	[keyname] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[value] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[createdDT] [datetime] NULL CONSTRAINT [DF_orng_appdata_createdDT]  DEFAULT (getdate()),
	[updatedDT] [datetime] NULL CONSTRAINT [DF_orng_appdata_updatedDT]  DEFAULT (getdate())
) ON [PRIMARY]

/****** Object:  Table [ORNG].[Messages]    Script Date: 08/31/2011 14:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ORNG].[Messages](
	[msgId] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[senderId] [nvarchar](255) NULL,
	[recipientId] [nvarchar](255) NULL,
	[coll] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[title] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[body] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[createdDT] [datetime] NULL CONSTRAINT [DF_orng_messages_createdDT]  DEFAULT (getdate())
) ON [PRIMARY]

/****** Object:  Table [ORNG].[Activity]    Script Date: 08/31/2011 14:32:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ORNG].[Activity](
	[activityId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [nvarchar](255) NULL,
	[appId] [int] NULL,
	[createdDT] [datetime] NULL CONSTRAINT [DF_orng_activity_createdDT]  DEFAULT (getdate()),
	[activity] [xml] NULL,
 CONSTRAINT [PK__activity] PRIMARY KEY CLUSTERED 
(
	[activityId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

/****** Object:  StoredProcedure [ORNG].[RegisterAppPerson]    Script Date: 08/31/2011 14:34:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [ORNG].[RegisterAppPerson]    Script Date: 09/23/2010 09:52:53 ******/
CREATE PROCEDURE [ORNG].[RegisterAppPerson](@userid nvarchar(255),@appId INT, @value BIT = 1)
As
BEGIN
	SET NOCOUNT ON
		BEGIN TRAN		
			DECLARE @PERSON_FILTER_ID INT
			SELECT @PERSON_FILTER_ID = (SELECT PersonFilterID FROM Apps WHERE appId = @appId)

			IF (@value = 1 AND (SELECT COUNT(*) FROM AppRegistry WHERE appId = @appId AND personId = @userId) = 0)
				BEGIN
					INSERT [ORNG].[AppRegistry](appId, personId) values (@appId, @userId)
					IF (@PERSON_FILTER_ID IS NOT NULL) 
						INSERT person_filter_relationships(personID, personFilterId) values (@userId, @PERSON_FILTER_ID)
				END
			ELSE IF (@value != 1)
				BEGIN
					DELETE FROM [ORNG].[AppRegistry] where appId = @appID AND personId = @userId
					IF (@PERSON_FILTER_ID IS NOT NULL) 
						DELETE FROM person_filter_relationships WHERE personId = @userId AND personFilterId = @PERSON_FILTER_ID
				END	
		COMMIT
END

/****** Object:  StoredProcedure [ORNG].[UpsertAppData]    Script Date: 08/31/2011 14:35:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [ORNG].[UpsertAppData]    Script Date: 09/23/2010 09:53:03 ******/
CREATE PROCEDURE [ORNG].[UpsertAppData](@userid nvarchar(255),@appId INT, @keyname nvarchar(255),@value nvarchar(4000))
As
BEGIN
	SET NOCOUNT ON
		BEGIN TRAN				 
			IF (SELECT COUNT(*) FROM AppData WHERE userId = @userId AND appId = @appId and keyname = @keyName) > 0
				UPDATE [ORNG].[AppData] set [value] = @value, updatedDT = GETDATE() WHERE userId = @userId AND appId = @appId and keyname = @keyName
			ELSE
				INSERT [ORNG].[AppData] (userId, appId, keyname, [value]) values (@userId, @appId, @keyname, @value)

			-- if keyname is VISIBLE, do more
			IF (@keyname = 'VISIBLE' AND @value = 'Y') 
				EXEC [ORNG].[RegisterAppPerson] @userid, @appId, 1
			ELSE IF (@keyname = 'VISIBLE' ) 
				EXEC [ORNG].[RegisterAppPerson] @userid, @appId, 0
		COMMIT
END								

/****** Object:  StoredProcedure [ORNG].[DeleteAppData]    Script Date: 08/31/2011 14:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [ORNG].[DeleteAppData]    Script Date: 09/23/2010 09:53:12 ******/
CREATE PROCEDURE [ORNG].[DeleteAppData](@userid nvarchar(255),@appId INT, @keyname nvarchar(255))
As
BEGIN
	SET NOCOUNT ON
		BEGIN TRAN				 
			DELETE [ORNG].[AppData] WHERE userId = @userId AND appId = @appId and keyname = @keyName
			-- if keyname is VISIBLE, do more
			IF (@keyname = 'VISIBLE' ) 
				EXEC [ORNG].[RegisterAppPerson] @userid, @appId, 0
		COMMIT
END		


/********** Add some gadgets to play with ********************/

--delete from [ORNG].[Apps];
--insert [ORNG].[Apps] values (100, 'Google Search', 'http://dev-profiles.ucsf.edu/orng/GoogleSearch.xml', NULL, 'True', NULL);
--insert [ORNG].[Apps] values (101, 'Featured Presentations', 'http://dev-profiles.ucsf.edu/orng/SlideShare.xml', NULL, 'True', NULL);
--insert [ORNG].[Apps] values (102, 'Faculty Mentor', 'http://dev-profiles.ucsf.edu/orng/Mentor.xml', NULL, 'True', NULL);
--insert [ORNG].[Apps] values (103, 'Websites', 'http://dev-profiles.ucsf.edu/orng/Links.xml', NULL, 'True', NULL);
--insert [ORNG].[Apps] values (104, 'Profile List', 'http://dev-profiles.ucsf.edu/orng/ProfileListTool.xml', NULL, 'True', 'JSONPersonIds');
--insert [ORNG].[Apps] values (105, 'Publication Export', 'http://dev-profiles.ucsf.edu/orng/PubExportTool.xml', NULL, 'True', 'JSONPubMedIds');
--insert [ORNG].[Apps] values (106, 'RDF Test Gadget', 'http://dev-profiles.ucsf.edu/orng/RDFTest.xml', NULL, 'True', null);

--insert [ORNG].[AppViews] values (100, NULL, NULL, 'search/default.aspx', NULL, 600, 600, 1, 'gadgets-search', NULL);
--insert [ORNG].[AppViews] values (101, NULL, 'R', 'profile/display.aspx', 'profile', 291, 590, 1, 'gadgets-view', 3);
--insert [ORNG].[AppViews] values (101, NULL, NULL, 'edit/default.aspx', 'home', 700,700, 1, 'gadgets-edit', NULL);
--insert [ORNG].[AppViews] values (102, NULL, 'R', 'profile/display.aspx', 'profile', 291, 590, 1, 'gadgets-view', 2);
--insert [ORNG].[AppViews] values (102, NULL, NULL, 'edit/default.aspx', 'home', 700, 700, 1, 'gadgets-edit', NULL);
--insert [ORNG].[AppViews] values (103, NULL, NULL, 'edit/default.aspx', 'home', 700, 700, 1, 'gadgets-edit', NULL);
--insert [ORNG].[AppViews] values (103, NULL, 'R', 'profile/display.aspx', 'profile', 291, 590, 0, 'gadgets-view', 1);
--insert [ORNG].[AppViews] values (104, 'U', NULL, 'search/default.aspx', 'small', 160, 160, 0, 'gadgets-tools', NULL);
--insert [ORNG].[AppViews] values (104, 'U', NULL, 'orng/gadgetdetails.aspx', 'canvas', 700, 700, 0, 'gadgets-detail', NULL);
--insert [ORNG].[AppViews] values (104, 'U', NULL, 'SimilarPeople.aspx', 'small', 160, 160, 0, 'gadgets-tools', NULL);
--insert [ORNG].[AppViews] values (104, 'U', NULL, 'ProfileDetails.aspx', 'small', 160, 160, 0, 'gadgets-tools', NULL);
--insert [ORNG].[AppViews] values (104, 'U', NULL, 'CoAuthors.aspx', 'small', 160, 160, 0, 'gadgets-tools', NULL);
--insert [ORNG].[AppViews] values (105, 'U', NULL, 'ProfileDetails.aspx', 'small', 160, 160, 0, 'gadgets-tools', NULL);
--insert [ORNG].[AppViews] values (105, 'U', NULL, 'orng/gadgetdetails.aspx', 'canvas', 700, 700, 0, 'gadgets-detail', NULL);



-- Add to PresentationXML in DB
-- NOTE THAT THIS IS NOT DONE IN InstallData.xml
--EXEC(N'UPDATE [Ontology.Presentation].[XML] SET [PresentationXML]=CONVERT(xml,N''<Presentation PresentationClass="profile"><PageOptions Columns="3"/><WindowName>{{{rdf:RDF[1]/rdf:Description[1]/foaf:firstName[1]}}} {{{rdf:RDF[1]/rdf:Description[1]/foaf:lastName[1]}}}</WindowName><PageColumns>3</PageColumns><PageTitle>{{{rdf:RDF[1]/rdf:Description[1]/foaf:firstName[1]}}} {{{rdf:RDF[1]/rdf:Description[1]/foaf:lastName[1]}}}</PageTitle><PageBackLinkName/><PageBackLinkURL/><PageSubTitle/><PageDescription/><PanelTabType>Fixed</PanelTabType><PanelList><Panel Type="active"><Module ID="MiniSearch"/><Module ID="MainMenu"/></Panel><Panel Type="main" TabType="Fixed"><Module ID="CustomViewPersonGeneralInfo"/><Module ID="ApplyXSLT"><ParamList><Param Name="DataURI">rdf:RDF/rdf:Description/@rdf:about</Param><Param Name="XSLTPath">~/profile/XSLT/OtherPositions.xslt</Param></ParamList></Module><Module ID="PropertyList"><ParamList/></Module><Module ID="Gadgets"><ParamList><Param Name="HTML"><div id="gadgets-view" class="gadgets-gadget-parent"></div></Param></ParamList></Module></Panel><Panel Type="passive"><Module ID="PassiveHeader"/><Module ID="PassiveList"><ParamList><Param Name="DataURI">rdf:RDF/rdf:Description/@rdf:about</Param><Param Name="InfoCaption">Concepts</Param><Param Name="Description">Derived automatically from this person''''s publications.</Param><Param Name="MaxDisplay">5</Param><Param Name="ListNode">rdf:RDF/rdf:Description[@rdf:about= /rdf:RDF[1]/rdf:Description[1]/vivo:hasResearchArea/@rdf:resource]</Param><Param Name="ItemURLText">{{{rdf:Description/rdfs:label}}}</Param><Param Name="ItemText"/><Param Name="ItemURL">{{{rdf:Description/@rdf:about}}}</Param><Param Name="MoreURL">{{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://vivoweb.org/ontology/core#hasResearchArea"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/@rdf:about}}}</Param><Param Name="MoreText">See all ({{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://vivoweb.org/ontology/core#hasResearchArea"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/prns:numberOfConnections}}}) concept(s)</Param></ParamList></Module><Module ID="PassiveList"><ParamList><Param Name="DataURI">rdf:RDF/rdf:Description/@rdf:about</Param><Param Name="InfoCaption">Co-Authors</Param><Param Name="MaxDisplay">5</Param><Param Name="Description">People in Profiles who have published with this person.</Param><Param Name="ListNode">rdf:RDF/rdf:Description[@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:coAuthorOf/@rdf:resource]</Param><Param Name="ItemURLText">{{{rdf:Description/rdfs:label}}}</Param><Param Name="ItemURL">{{{rdf:Description/@rdf:about}}}</Param><Param Name="MoreURL">{{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://profiles.catalyst.harvard.edu/ontology/prns#coAuthorOf"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/@rdf:about}}}</Param><Param Name="MoreText">See all ({{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://profiles.catalyst.harvard.edu/ontology/prns#coAuthorOf"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/prns:numberOfConnections}}}) people</Param></ParamList></Module><Module ID="PassiveList"><ParamList><Param Name="DataURI">rdf:RDF/rdf:Description/@rdf:about</Param><Param Name="InfoCaption">Similar People</Param><Param Name="Description">People who share similar concepts with this person.</Param><Param Name="MaxDisplay">11</Param><Param Name="ListNode">rdf:RDF/rdf:Description[@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:similarTo/@rdf:resource]</Param><Param Name="ItemURLText">{{{rdf:Description/rdfs:label}}}</Param><Param Name="ItemText"/><Param Name="ItemURL">{{{rdf:Description/@rdf:about}}}</Param><Param Name="MoreURL">{{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://profiles.catalyst.harvard.edu/ontology/prns#similarTo"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/@rdf:about}}}</Param><Param Name="MoreText">See all ({{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://profiles.catalyst.harvard.edu/ontology/prns#similarTo"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/prns:numberOfConnections}}}) people</Param></ParamList></Module><Module ID="CustomViewPersonSameDepartment"/><Module ID="PassiveList"><ParamList><Param Name="DataURI">rdf:RDF/rdf:Description/@rdf:about</Param><Param Name="InfoCaption">Physical Neighbors</Param><Param Name="Description">People whose addresses are nearby this person.</Param><Param Name="MaxDisplay">11</Param><Param Name="ListNode">rdf:RDF/rdf:Description[@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:physicalNeighborOf/@rdf:resource]</Param><Param Name="ItemURLText">{{{rdf:Description/rdfs:label}}}</Param><Param Name="ItemText"/><Param Name="ItemURL">{{{rdf:Description/@rdf:about}}}</Param></ParamList></Module></Panel></PanelList><ExpandRDFList><ExpandRDF Class="http://xmlns.com/foaf/0.1/Person" Property="http://vivoweb.org/ontology/core#authorInAuthorship" Limit="1"/></ExpandRDFList></Presentation>'',1) WHERE [PresentationID]=5')
-- 5
-- no gadgets
--EXEC(N'UPDATE [Ontology.Presentation].[XML] SET [PresentationXML]=CONVERT(xml,N''<Presentation PresentationClass="profile"><PageOptions Columns="3"/><WindowName>{{{rdf:RDF[1]/rdf:Description[1]/foaf:firstName[1]}}} {{{rdf:RDF[1]/rdf:Description[1]/foaf:lastName[1]}}}</WindowName><PageColumns>3</PageColumns><PageTitle>{{{rdf:RDF[1]/rdf:Description[1]/foaf:firstName[1]}}} {{{rdf:RDF[1]/rdf:Description[1]/foaf:lastName[1]}}}</PageTitle><PageBackLinkName/><PageBackLinkURL/><PageSubTitle/><PageDescription/><PanelTabType>Fixed</PanelTabType><PanelList><Panel Type="active"><Module ID="MiniSearch"/><Module ID="MainMenu"/></Panel><Panel Type="main" TabType="Fixed"><Module ID="CustomViewPersonGeneralInfo"/><Module ID="ApplyXSLT"><ParamList><Param Name="DataURI">rdf:RDF/rdf:Description/@rdf:about</Param><Param Name="XSLTPath">~/profile/XSLT/OtherPositions.xslt</Param></ParamList></Module><Module ID="PropertyList"><ParamList/></Module></Panel><Panel Type="passive"><Module ID="PassiveHeader"/><Module ID="PassiveList"><ParamList><Param Name="DataURI">rdf:RDF/rdf:Description/@rdf:about</Param><Param Name="InfoCaption">Concepts</Param><Param Name="Description">Derived automatically from this person''''s publications.</Param><Param Name="MaxDisplay">5</Param><Param Name="ListNode">rdf:RDF/rdf:Description[@rdf:about= /rdf:RDF[1]/rdf:Description[1]/vivo:hasResearchArea/@rdf:resource]</Param><Param Name="ItemURLText">{{{rdf:Description/rdfs:label}}}</Param><Param Name="ItemText"/><Param Name="ItemURL">{{{rdf:Description/@rdf:about}}}</Param><Param Name="MoreURL">{{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://vivoweb.org/ontology/core#hasResearchArea"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/@rdf:about}}}</Param><Param Name="MoreText">See all ({{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://vivoweb.org/ontology/core#hasResearchArea"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/prns:numberOfConnections}}}) concept(s)</Param></ParamList></Module><Module ID="PassiveList"><ParamList><Param Name="DataURI">rdf:RDF/rdf:Description/@rdf:about</Param><Param Name="InfoCaption">Co-Authors</Param><Param Name="MaxDisplay">5</Param><Param Name="Description">People in Profiles who have published with this person.</Param><Param Name="ListNode">rdf:RDF/rdf:Description[@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:coAuthorOf/@rdf:resource]</Param><Param Name="ItemURLText">{{{rdf:Description/rdfs:label}}}</Param><Param Name="ItemURL">{{{rdf:Description/@rdf:about}}}</Param><Param Name="MoreURL">{{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://profiles.catalyst.harvard.edu/ontology/prns#coAuthorOf"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/@rdf:about}}}</Param><Param Name="MoreText">See all ({{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://profiles.catalyst.harvard.edu/ontology/prns#coAuthorOf"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/prns:numberOfConnections}}}) people</Param></ParamList></Module><Module ID="PassiveList"><ParamList><Param Name="DataURI">rdf:RDF/rdf:Description/@rdf:about</Param><Param Name="InfoCaption">Similar People</Param><Param Name="Description">People who share similar concepts with this person.</Param><Param Name="MaxDisplay">11</Param><Param Name="ListNode">rdf:RDF/rdf:Description[@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:similarTo/@rdf:resource]</Param><Param Name="ItemURLText">{{{rdf:Description/rdfs:label}}}</Param><Param Name="ItemText"/><Param Name="ItemURL">{{{rdf:Description/@rdf:about}}}</Param><Param Name="MoreURL">{{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://profiles.catalyst.harvard.edu/ontology/prns#similarTo"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/@rdf:about}}}</Param><Param Name="MoreText">See all ({{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://profiles.catalyst.harvard.edu/ontology/prns#similarTo"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/prns:numberOfConnections}}}) people</Param></ParamList></Module><Module ID="CustomViewPersonSameDepartment"/><Module ID="PassiveList"><ParamList><Param Name="DataURI">rdf:RDF/rdf:Description/@rdf:about</Param><Param Name="InfoCaption">Physical Neighbors</Param><Param Name="Description">People whose addresses are nearby this person.</Param><Param Name="MaxDisplay">11</Param><Param Name="ListNode">rdf:RDF/rdf:Description[@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:physicalNeighborOf/@rdf:resource]</Param><Param Name="ItemURLText">{{{rdf:Description/rdfs:label}}}</Param><Param Name="ItemText"/><Param Name="ItemURL">{{{rdf:Description/@rdf:about}}}</Param></ParamList></Module></Panel></PanelList><ExpandRDFList><ExpandRDF Class="http://xmlns.com/foaf/0.1/Person" Property="http://vivoweb.org/ontology/core#authorInAuthorship" Limit="1"/></ExpandRDFList></Presentation>'',1) WHERE [PresentationID]=5')

--EXEC(N'UPDATE [Ontology.Presentation].[XML] SET [PresentationXML]=CONVERT(xml,N''<Presentation PresentationClass="profile"><PageOptions Columns="3"/><WindowName>{{{rdf:RDF[1]/rdf:Description[1]/foaf:firstName[1]}}} {{{rdf:RDF[1]/rdf:Description[1]/foaf:lastName[1]}}}</WindowName><PageColumns>3</PageColumns><PageTitle>{{{rdf:RDF[1]/rdf:Description[1]/foaf:firstName[1]}}} {{{rdf:RDF[1]/rdf:Description[1]/foaf:lastName[1]}}}</PageTitle><PageBackLinkName/><PageBackLinkURL/><PageSubTitle/><PageDescription/><PanelTabType>Fixed</PanelTabType><PanelList><Panel Type="active"><Module ID="MiniSearch"/><Module ID="MainMenu"/></Panel><Panel Type="main" TabType="Fixed"><Module ID="CustomViewPersonGeneralInfo"/><Module ID="ApplyXSLT"><ParamList><Param Name="DataURI">rdf:RDF/rdf:Description/@rdf:about</Param><Param Name="XSLTPath">~/profile/XSLT/OtherPositions.xslt</Param></ParamList></Module><Module ID="PropertyList"><ParamList/></Module><Module ID="Gadgets"><ParamList><Param Name="HTML"><div id="gadgets-view" class="gadgets-gadget-parent"></div></Param></ParamList></Module></Panel><Panel Type="passive"><Module ID="PassiveHeader"/><Module ID="PassiveList"><ParamList><Param Name="DataURI">rdf:RDF/rdf:Description/@rdf:about</Param><Param Name="InfoCaption">Related Concepts</Param><Param Name="Description">Derived automatically from this person''''s publications.</Param><Param Name="MaxDisplay">5</Param><Param Name="ListNode">rdf:RDF/rdf:Description[@rdf:about= /rdf:RDF[1]/rdf:Description[1]/vivo:hasResearchArea/@rdf:resource]</Param><Param Name="ItemURLText">{{{rdf:Description/rdfs:label}}}</Param><Param Name="ItemText"/><Param Name="ItemURL">{{{rdf:Description/@rdf:about}}}</Param><Param Name="MoreURL">{{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://vivoweb.org/ontology/core#hasResearchArea"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/@rdf:about}}}</Param><Param Name="MoreText">See all ({{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://vivoweb.org/ontology/core#hasResearchArea"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/prns:numberOfConnections}}}) concept(s)</Param></ParamList></Module><Module ID="PassiveList"><ParamList><Param Name="DataURI">rdf:RDF/rdf:Description/@rdf:about</Param><Param Name="InfoCaption">Co-Authors</Param><Param Name="MaxDisplay">5</Param><Param Name="Description">People in Profiles who have published with this person.</Param><Param Name="ListNode">rdf:RDF/rdf:Description[@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:coAuthorOf/@rdf:resource]</Param><Param Name="ItemURLText">{{{rdf:Description/rdfs:label}}}</Param><Param Name="ItemURL">{{{rdf:Description/@rdf:about}}}</Param><Param Name="MoreURL">{{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://profiles.catalyst.harvard.edu/ontology/prns#coAuthorOf"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/@rdf:about}}}</Param><Param Name="MoreText">See all ({{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://profiles.catalyst.harvard.edu/ontology/prns#coAuthorOf"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/prns:numberOfConnections}}}) people</Param></ParamList></Module><Module ID="PassiveList"><ParamList><Param Name="DataURI">rdf:RDF/rdf:Description/@rdf:about</Param><Param Name="InfoCaption">Similar People</Param><Param Name="Description">People who share similar concepts with this person.</Param><Param Name="MaxDisplay">11</Param><Param Name="ListNode">rdf:RDF/rdf:Description[@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:similarTo/@rdf:resource]</Param><Param Name="ItemURLText">{{{rdf:Description/rdfs:label}}}</Param><Param Name="ItemText"/><Param Name="ItemURL">{{{rdf:Description/@rdf:about}}}</Param><Param Name="MoreURL">{{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://profiles.catalyst.harvard.edu/ontology/prns#similarTo"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/@rdf:about}}}</Param><Param Name="MoreText">See all ({{{rdf:RDF/rdf:Description[rdf:predicate/@rdf:resource="http://profiles.catalyst.harvard.edu/ontology/prns#similarTo"][@rdf:about= /rdf:RDF[1]/rdf:Description[1]/prns:hasNetwork/@rdf:resource]/prns:numberOfConnections}}}) people</Param></ParamList></Module><Module ID="CustomViewPersonSameDepartment"/></Panel></PanelList><ExpandRDFList><ExpandRDF Class="http://xmlns.com/foaf/0.1/Person" Property="http://vivoweb.org/ontology/core#authorInAuthorship" Limit="1"/></ExpandRDFList></Presentation>'',1) WHERE [PresentationID]=5')

