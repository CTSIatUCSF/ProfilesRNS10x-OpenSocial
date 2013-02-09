select * from sys.fulltext_catalogs;

-- create new row for freetextKeyword property
insert [Ontology.].[ClassProperty] 
SELECT 842
      ,[Class]
      ,[NetworkProperty]
      ,'http://vivoweb.org/ontology/core#freetextKeyword'
      ,[IsDetail]
      ,[Limit]
      ,[IncludeDescription]
      ,[IncludeNetwork]
      ,[SearchWeight]
      ,[CustomDisplay]
      ,[CustomEdit]
      ,[ViewSecurityGroup]
      ,[EditSecurityGroup]
      ,[EditPermissionsSecurityGroup]
      ,[EditExistingSecurityGroup]
      ,[EditAddNewSecurityGroup]
      ,[EditAddExistingSecurityGroup]
      ,[EditDeleteSecurityGroup]
      ,[MinCardinality]
      ,1
      ,[CustomDisplayModule]
      ,[CustomEditModule]
      ,[_ClassNode]
      ,[_NetworkPropertyNode]
      ,[_PropertyNode]
      ,[_TagName]
      ,[_PropertyLabel]
      ,[_ObjectType]
      ,[_NumberOfNodes]
      ,[_NumberOfTriples]
  FROM [Ontology.].[ClassProperty] where ClassPropertyID = 821;

-- run this thing to update derived fields
exec [Ontology.].[UpdateDerivedFields];

-- check work
select * from [Ontology.].[ClassProperty] where ClassPropertyID in (821, 842);

--UPDATE [Ontology.].[ClassProperty] set MaxCardinality = 1  where ClassPropertyID in (820, 841);
--CustomDisplayModule = cast('<Module ID="HTMLBlockLineBreaks" />' as XML) where ClassPropertyID in (820, 841);

-- add HTMLBlockLineBreaks as custom display for overview and freetextKeyword
UPDATE [Ontology.].[ClassProperty] set CustomDisplay = 1, Limit = null,
CustomDisplayModule = cast(
'<Module ID="HTMLBlockLineBreaks"><ParamList><Param Name="DataURI">rdf:RDF[1]/rdf:Description[1]/vivo:freetextKeyword</Param></ParamList></Module>' as XML) where ClassPropertyID in (842);

UPDATE [Ontology.].[ClassProperty] set CustomDisplay = 1, CustomDisplayModule = cast(
'<Module ID="HTMLBlockLineBreaks"><ParamList><Param Name="DataURI">rdf:RDF[1]/rdf:Description[1]/vivo:overview</Param></ParamList></Module>' as XML) where ClassPropertyID in (821);

UPDATE [Ontology.].[ClassProperty] set MaxCardinality = null, CustomDisplayModule = null where ClassPropertyID in (821, 842);

exec [Ontology.].[UpdateDerivedFields] 

