
select * from [Profile.Data].Person where lastname = '';

select * from [rdf.stage].InternalNodeMap where InternalID = '';

select * from [rdf.].Triple t join [rdf.].Node n on t.Object = n.NodeID where t.Subject =  
and t.predicate = 1667;

select * from [rdf.].Triple where object = ; -- predicate should be 1667
select * from [rdf.].node where nodeid =  ;