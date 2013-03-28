/***************************************************************************
*                                                                          *
*                  ### ProcessDataMap Example Script ###                   *
*                                                                          *
*  Use this script with the ProfilesRNS_1.0.1_ArchitectureGuide.pdf file.  *
*                                                                          *
***************************************************************************/


-- ***************************************************************************
-- ***************************************************************************
-- ***  Extend the Ontology                                                ***
-- ***************************************************************************
-- ***************************************************************************

------------------------------------------------------------------------------
-- Define a namespace
------------------------------------------------------------------------------

-- Create your own namespace in the [Ontology.].[Namespace] table.
-- Let's assume the URI is 'http://myuniversity/ontology#' and the Prefix is 'myont'. 
-- Note that you can use this namespace for all future ontology extensions you make.

INSERT INTO [Ontology.].[Namespace] (URI, Prefix) 
	VALUES ('http://ucsf/ontology#', 'ucsf')


EXEC [Ontology.].[AddProperty]	@OWL = 'ucsf_1.0',
								@PropertyURI = 'http://ucsf/ontology#publishingFirstName',
								@PropertyName = 'Publishing First Name',
								@ObjectType = 1,
								@PropertyGroupURI = 'http://profiles.catalyst.harvard.edu/ontology/prns#PropertyGroupIdentifiers',
								@ClassURI = 'http://xmlns.com/foaf/0.1/Person',
								@IsDetail = 0,
								@IncludeDescription = 0
-- needs to be visible of course....
update [Ontology.].[ClassProperty] set SearchWeight = 0   
	  ,[IsDetail] = 1
      ,[ViewSecurityGroup] = -1    
	  ,[EditSecurityGroup] = -20
      ,[EditPermissionsSecurityGroup] = -20
      ,[EditExistingSecurityGroup] = -20
      ,[EditAddNewSecurityGroup] = -20
      ,[EditAddExistingSecurityGroup] = -20
      ,[EditDeleteSecurityGroup] = -20 where Property = 'http://ucsf/ontology#publishingFirstName';	
            
      
INSERT INTO [Ontology.].[DataMap] (DataMapID, DataMapGroup, IsAutoFeed, Graph, 
		Class, NetworkProperty, Property, 
		MapTable, 
		sInternalType, sInternalID, 
		oClass, oInternalType, oInternalID, oValue, oDataType, oLanguage, 
		oObjectType, Weight, OrderBy, ViewSecurityGroup, EditSecurityGroup)
	VALUES (1001, 1, 1, 1,
		'http://xmlns.com/foaf/0.1/Person', NULL, 'http://ucsf/ontology#publishingFirstName',
		'[UCSF].[vwPerson]',
		'Person', 'personid',
		NULL, NULL, NULL, 'publishingfirst', NULL, NULL,
		0, 1, NULL, -1, -40)

EXEC [Ontology.].UpdateDerivedFields
				
EXEC [RDF.Stage].[ProcessDataMap] @DataMapID = 1001, @ShowCounts = 1

EXEC [Ontology.].[CleanUp] @Action = 'UpdateIDs'
		
---------------------STOP
-- note new datamapid
EXEC [RDF.Stage].[ProcessDataMap] @DataMapID = 117, @ShowCounts = 1

-- see what predicate value is
select * from [RDF.].[Triple] t join [RDF.].Node n on n.NodeID = t.Object where t.Predicate = 2240347 


-- run the following after every weekly pub update
-- exec [UCSF].[generate.mesh.keywords];
-- make sure that processDataMap is ran!
