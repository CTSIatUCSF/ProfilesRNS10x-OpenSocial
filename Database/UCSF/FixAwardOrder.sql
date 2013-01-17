  declare @ndx  int
  declare @value nvarchar(max)
  declare @subject bigint
  declare @tripleid bigint
  declare @oldsubject bigint
  declare @newndx int
   
  declare awards cursor for select t.tripleid, sn.value, t.[subject], t.sortorder  from [RDF.].Triple t  join
  [RDF.].Triple st on st.[Subject] = t.[Object] join [RDF.].Node sn on sn.NodeID = st.[Object]
   where --t.[Subject] = 365630 and 
   t.[Predicate] =  205 and st.Predicate = 468 order by t.Subject, sn.Value desc;   

  set @oldsubject = 0
  set @newndx = 1 
  open awards
  fetch next from awards into @tripleid, @value, @subject, @ndx   
  
  while @@fetch_status = 0 begin
	if (@subject = @oldsubject)
	begin
		set @newndx = @newndx + 1
	end
	else
	begin
		set @oldsubject = @subject
		set @newndx = 1	
	end
	if (@newndx != @ndx)
	begin
		print cast(@subject as varchar) + ',' + @value + ',' + cast(@ndx as varchar) + ',' + cast(@newndx as varchar)
		update [RDF.].Triple set SortOrder = @newndx where TripleID = @tripleid
	end		
	
  fetch next from awards into @tripleid, @value, @subject, @ndx   
  end
  close awards
  deallocate awards