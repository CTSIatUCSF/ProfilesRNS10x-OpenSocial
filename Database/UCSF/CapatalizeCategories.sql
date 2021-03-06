select * from [Ontology.].[ClassProperty] where _PropertyLabel = 'mailing address';
update [Ontology.].[ClassProperty] set _PropertyLabel = 'Mailing Address' where _PropertyLabel = 'mailing address';

select * from [Ontology.].[ClassProperty] where _PropertyLabel = 'email address';
update [Ontology.].[ClassProperty] set _PropertyLabel = 'Email Address' where _PropertyLabel = 'email address';

select * from [Ontology.].[ClassProperty] where _PropertyLabel = 'photo';
update [Ontology.].[ClassProperty] set _PropertyLabel = 'Photo' where _PropertyLabel = 'photo';

select * from [Ontology.].[ClassProperty] where _PropertyLabel = 'awards and honors';
update [Ontology.].[ClassProperty] set _PropertyLabel = 'Awards and Honors' where _PropertyLabel = 'awards and honors';

select * from [Ontology.].[ClassProperty] where _PropertyLabel = 'overview';
update [Ontology.].[ClassProperty] set _PropertyLabel = 'Overview' where _PropertyLabel = 'overview';

select * from [Ontology.].[ClassProperty] where _PropertyLabel = 'keywords' or _PropertyLabel = 'interests';
update [Ontology.].[ClassProperty] set _PropertyLabel = 'Interests' where _PropertyLabel = 'keywords';

select * from [Ontology.].[ClassProperty] where _PropertyLabel = 'selected publications';
update [Ontology.].[ClassProperty] set _PropertyLabel = 'Publications' where _PropertyLabel = 'selected publications';