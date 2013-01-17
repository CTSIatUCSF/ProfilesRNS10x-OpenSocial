USE [profiles_102]
GO

/****** Object:  StoredProcedure [Profile.Module].[NetworkAuthorshipTimeline.Person.GetData]    Script Date: 01/03/2013 11:10:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [Profile.Module].[NetworkAuthorshipTimeline.Person.GetData]
	@NodeID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @PersonID INT
 	SELECT @PersonID = CAST(m.InternalID AS INT)
		FROM [RDF.Stage].[InternalNodeMap] m, [RDF.].Node n
		WHERE m.Status = 3 AND m.ValueHash = n.ValueHash AND n.NodeID = @NodeID
 
    -- Insert statements for procedure here
	declare @gc varchar(max)

	declare @y table (
		y int,
		A int,
		B int,
		C int
	)

	insert into @y (y,A,B,C)
		select n.n y, coalesce(t.A,0) A, coalesce(t.B,0) B, coalesce(t.C,0) C 
		from [Utility.Math].[N] left outer join (
			select (case when y < 1970 then 1970 else y end) y,
				sum(case when r in ('F','S') then 1 else 0 end) A,
				sum(case when r not in ('F','S','L') then 1 else 0 end) B,
				sum(case when r in ('L') then 1 else 0 end) C
			from (
				select coalesce(p.AuthorPosition,'U') r, year(coalesce(p.pubdate,m.publicationdt,'1/1/1970')) y
				from [Profile.Data].[Publication.Person.Include] a
					left outer join [Profile.Cache].[Publication.PubMed.AuthorPosition] p on a.pmid = p.pmid and p.personid = a.personid
					left outer join [Profile.Data].[Publication.MyPub.General] m on a.mpid = m.mpid
				where a.personid = @PersonID
			) t
			group by y
		) t on n.n = t.y
		where n.n between 1980 and year(getdate())

	declare @x int

	select @x = max(A+B+C)
		from @y

	if coalesce(@x,0) > 0
	begin
		declare @v varchar(1000)
		declare @z int
		declare @k int
		declare @i int

		set @z = power(10,floor(log(@x)/log(10)))
		set @k = floor(@x/@z)
		if @x > @z*@k
			select @k = @k + 1
		if @k > 5
			select @k = floor(@k/2.0+0.5), @z = @z*2

		set @v = ''
		set @i = 0
		while @i <= @k
		begin
			set @v = @v + '|' + cast(@z*@i as varchar(50))
			set @i = @i + 1
		end
		set @v = '|0|'+cast(@x as varchar(50))
		--set @v = '|0|50|100'

		declare @h varchar(1000)
		set @h = ''
		select @h = @h + '|' + (case when y % 2 = 1 then '' else ''''+right(cast(y as varchar(50)),2) end)
			from @y
			order by y 

		declare @w float
		--set @w = @k*@z
		set @w = @x

		declare @d varchar(max)
		set @d = ''
		select @d = @d + cast(floor(0.5 + 100*A/@w) as varchar(50)) + ','
			from @y
			order by y
		set @d = left(@d,len(@d)-1) + '|'
		select @d = @d + cast(floor(0.5 + 100*B/@w) as varchar(50)) + ','
			from @y
			order by y
		set @d = left(@d,len(@d)-1) + '|'
		select @d = @d + cast(floor(0.5 + 100*C/@w) as varchar(50)) + ','
			from @y
			order by y
		set @d = left(@d,len(@d)-1)

		declare @c varchar(50)
		-- set @c = 'FB8072,B3DE69,80B1D3' UCSF
		set @c = '88bbbb,666666,CC6600'
		--set @c = 'F96452,a8dc4f,68a4cc'
		--set @c = 'fea643,76cbbd,b56cb5'

		--select @v, @h, @d

		--set @gc = 'http://chart.apis.google.com/chart?chs=605x150&amp;chf=bg,s,ffffff|c,s,ffffff&amp;chxt=x,y&amp;chxl=0:|99|00|01|02|03|1:|0|10|20|30|40|50&amp;cht=bvs&amp;chd=t:70.00,42.00,34.00,38.00,82.00|30.00,18.00,8.00,6.00,4.00&amp;chdl=First+Author|Middle+Author&amp;chco=0000ff,cc3300&amp;chbh=50'
		--set @gc = 'http://chart.apis.google.com/chart?chxs=0,333333,10&amp;chs=605x80&amp;chf=bg,s,ffffff|c,s,ffffff&amp;chxt=x,y&amp;chxl=0:' + @h + '|1:' + @v + '&amp;cht=bvs&amp;chd=t:' + @d + '&amp;chdl=First+Author|Middle or Unkown|Last+Author&amp;chco=0000ff,009900,cc3300&amp;chbh=10'
		--set @gc = 'http://chart.apis.google.com/chart?chs=595x100&amp;chf=bg,s,ffffff|c,s,ffffff&amp;chxt=x,y&amp;chxl=0:' + @h + '|1:' + @v + '&amp;cht=bvs&amp;chd=t:' + @d + '&amp;chdl=First+Author|Middle or Unkown|Last+Author&amp;chco='+@c+'&amp;chbh=10'
		set @gc = 'http://chart.apis.google.com/chart?chs=625x100&chf=bg,s,ffffff|c,s,ffffff&chxt=x,y&chxl=0:' + @h + '|1:' + @v + '&cht=bvs&chd=t:' + @d + '&chdl=First+Author|Middle or Unkown|Last+Author&chco='+@c+'&chbh=10'

		select @gc gc --, @w w

		--select * from @y order by y

	end

END



GO


