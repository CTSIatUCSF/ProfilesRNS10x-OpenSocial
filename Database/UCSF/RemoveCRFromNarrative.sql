-- find dupes
select [UCSF].[fnReportOddChacters]('adfadsf');

select n.* from [RDF.].Node n join [RDF.].Triple t on 
n.NodeID = t.[Object] where t.Predicate = (select _PropertyNode from [Ontology.].[ClassProperty] where ClassPropertyID = 820) 
and n.NodeID in (1096675, 2160724)
order by n.NodeID ; --1096675 2160724

select CHARINDEX(char(13), n.value), n.* from [RDF.].Node n join [RDF.].Triple t on 
n.NodeID = t.[Object] where t.Predicate = (select _PropertyNode from [Ontology.].[ClassProperty] where ClassPropertyID = 820) 
and  CHARINDEX(char(13), n.value) > 0
order by n.NodeID ; --1096675 2160724

-- when to do this?
-- do this once
update n set [Value] = REPLACE(n.Value, CHAR(13), '') from [RDF.].Node n join [RDF.].Triple t on 
n.NodeID = t.[Object] where t.Predicate = (select _PropertyNode from [Ontology.].[ClassProperty] where ClassPropertyID = 820);

-- do this many times, until no results are left
update n set [Value] = rtrim(left(n.Value, LEN(n.Value)-1)) from [RDF.].Node n join [RDF.].Triple t on 
n.NodeID = t.[Object] where t.Predicate = (select _PropertyNode from [Ontology.].[ClassProperty] where ClassPropertyID = 820)
AND ASCII(right(n.Value, 1)) = 10;

-- then do this to update value hash
update n set n.[ValueHash] = [RDF.].[fnValueHash](null, null, Value) from [RDF.].Node n join [RDF.].Triple t on 
n.NodeID = t.[Object] where t.Predicate = (select _PropertyNode from [Ontology.].[ClassProperty] where ClassPropertyID = 820)
--and n.NodeID in (2132751, 2160720);
--0x34CFCD90CBCB8F47D89A06A3AF919A3EE7C74EAC
select n.* from [RDF.].Node n where n.ValueHash = 0x34CFCD90CBCB8F47D89A06A3AF919A3EE7C74EAC

-- then check where hash is off
select [RDF.].[fnValueHash](null, null, Value), n.* from [RDF.].Node n join [RDF.].Triple t on 
n.NodeID = t.[Object] where t.Predicate = (select _PropertyNode from [Ontology.].[ClassProperty] where ClassPropertyID = 820)
AND [RDF.].[fnValueHash](null, null, Value) <> n.ValueHash;
--and Subject = 365336; --0x206D2BCF9D46DB61524998BF1B6BF3A11FCA87E2

--select * from [RDF.].Node where ValueHash = 0xc95a21e3b133334309fff026a7e877372a8f46db;
--delete from [RDF.].Node where ValueHash = 0xc95a21e3b133334309fff026a7e877372a8f46db;
--select * from [RDF.].Triple where [OBJECT] = 2120303 or [Subject] = 2120303
--select * from [RDF.].Triple where [SUBJECT] = 365147 and [Predicate] = 1667
--select * from [RDF.].[Node] where NodeId = 2120303 or ValueHash = 0x34CFCD90CBCB8F47D89A06A3AF919A3EE7C74EAC
--
-- if you find bad ones, get the nodeid and remove from node and triple (object = nodeid) tables
--select * from [RDF.].Triple where [OBJECT] = 1097218 or [Subject] = 1097218
--select * from [RDF.].[Node] where ValueHash = 0x3856a5f338e1d60ffb79514696c94a04f59315cb
--delete from [RDF.].[Node] where NodeId = 1097218
