create view [UCSF].[unfuddle_324] as select * from cls.dbo.unfuddle_324 u where u.personid in (select personid from [Profile.Data].Person);

select * from [UCSF].[unfuddle_324]

INSERT INTO [Ontology.].[DataMap] (DataMapID, DataMapGroup, IsAutoFeed, Graph, 
		Class, NetworkProperty, Property, 
		MapTable, 
		sInternalType, sInternalID, 
		oClass, oInternalType, oInternalID, oValue, oDataType, oLanguage, 
		oObjectType, Weight, OrderBy, ViewSecurityGroup, EditSecurityGroup)
	VALUES (1001, 1, 1, 1,
		'http://xmlns.com/foaf/0.1/Person', NULL, 'http://vivoweb.org/ontology/core#freetextKeyword',
		'[UCSF].[unfuddle_324]',
		'Person', 'personid',
		NULL, NULL, NULL, 'interests_clean', NULL, NULL,
		1, 1, NULL, -1, -40)

--EXEC [Ontology.].UpdateDerivedFields

	UPDATE o
		SET	_ClassNode = [RDF.].fnURI2NodeID(Class),
			_NetworkPropertyNode = [RDF.].fnURI2NodeID(NetworkProperty),
			_PropertyNode = [RDF.].fnURI2NodeID(property)
		FROM [Ontology.].DataMap o where o.DataMapID = 1001;
		
EXEC [RDF.Stage].[ProcessDataMap] @DataMapID = 1001, @ShowCounts = 1;

delete from  [Ontology.].[DataMap] where DataMapID = 1001;--118;

-- run CapatalizeCategories!!!!
-- in production, make a copy of [Ontology.].[ClassProperty] first, check that 


select * from [Ontology.].[DataMap] where [Property] like '%freetext%';

select * from [Profile.Data].Person where PersonID = 5543840

select * from [RDF.Stage].InternalNodeMap where InternalID = '5543840';

select * from [rdf.].Node n join [RDF.].Triple t on n.NodeID = t.[Object] where t.[Subject] = 368482;

select * from [RDF.Stage].InternalNodeMap where InternalID = '5138614';

select * from [rdf.].Node n join [RDF.].Triple t on n.NodeID = t.[Object] where t.[Subject] = 365630;


select * from [rdf.].Node n join [RDF.].Triple t on n.NodeID = t.[Object] where t.[Predicate] = 133 and n.Value like 'Implementation%'; -- 95


select * from [rdf.].Node where Value like 'Implementation Science%' and ObjectType = 0; --97
delete from [RDF.].Triple where [OBJECT] in 
(select nodeid from [rdf.].Node where Value like 'Implementation Science%' );

delete from [rdf.].Node where Value like 'Implementation Science%' ;