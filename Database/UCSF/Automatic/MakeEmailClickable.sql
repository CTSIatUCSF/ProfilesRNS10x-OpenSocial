update [Ontology.].[ClassProperty] set ViewSecurityGroup = -10 where
Property in ('http://vivoweb.org/ontology/core#email', 'http://vivoweb.org/ontology/core#primaryEmail');

-- fix existing data.  Check predicate values!!!
-- thing about this.  The node one is certainly OK
update [RDF.].[Triple] set ViewSecurityGroup = -10 where Predicate in (272, 168);

select * from [RDF.].[Node] where NodeID in (select [Object] from [RDF.].[Triple] where Predicate in (272, 168));

update [RDF.].[Node] set ViewSecurityGroup = -10 where NodeID in (select [Object] from [RDF.].[Triple] where Predicate in (272, 168));