/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ClassPropertyID]
      ,[Class]
      ,[NetworkProperty]
      ,[Property]
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
      ,[MaxCardinality]
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
  FROM [profiles_102].[Ontology.].[ClassProperty] where property like '%suffix%'
  
  update [Ontology.].[ClassProperty] set CustomDisplay = 1, 
  CustomDisplayModule = CAST('<Module ID="HTMLBlock">
  <ParamList>
    <Param Name="HTML"></Param>
  </ParamList>
</Module>' as XML) where ClassPropertyID = 799;
  