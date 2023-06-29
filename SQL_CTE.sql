/*Ex1 a*/
with If_this_that as (
SELECT
	te.EventName ,
	te.EventDetails ,
	case
		when te.EventDetails like '%this%' then 1
		else 0
	end as If_this ,
	case
		when te.EventDetails like '%that%' then 1
		else 0
	end as If_that
from
	tblEvent te)
Select
	If_this_that.If_this ,
	If_this_that.If_that ,
	count (DISTINCT If_this_that.EventName)
From
	If_this_that
Group by
	If_this_that.If_this ,
	If_this_that.If_that ;
	
/*Ex1 b*/
with If_this_that as (
SELECT
	te.EventName ,
	te.EventDetails ,
	case
		when te.EventDetails like '%this%' then 1
		else 0
	end as If_this ,
	case
		when te.EventDetails like '%that%' then 1
		else 0
	end as If_that
from
	tblEvent te)
Select
If_this_that.EventName ,
If_this_that.EventDetails
from If_this_that
where If_this_that.If_this = 1 and
	If_this_that.If_that = 1
	
	
/*Ex2*/
	select
	tc.CountryName ,
	Second_half_Derived.EventName
from
	(
	Select
		te.EventName ,
		te.CountryID
	From
		tblEvent te
	where
		te.EventName like '%[N-Z]') as Second_half_Derived
left join tblCountry tc on
	tc.CountryID = Second_half_Derived.CountryID
	
	
/*Ex3*/
	With MP as (
Select 
	te.EpisodeId ,
	te.Title
from
	tblEpisode te
left join tblAuthor ta on
	te.AuthorId = ta.AuthorId
Where
	ta.AuthorName like '%MP%')
	SELECT 
	DISTINCT tc.CompanionName
From 
	MP
inner join tblEpisodeCompanion tec on
	MP.EpisodeId = tec.EpisodeId
inner join tblCompanion tc on
	tec.CompanionId = tc.CompanionId 

/*Ex4*/ HAVENOT DONE 

	With CTE as (
	SELECT
	te.EventName ,
	te.EventDetails ,
	te.EventDate  ,
	tc.CategoryID ,
	tc2.CountryID ,
	tc.CategoryName ,
	tc2.CountryName 
from
	tblEvent te
left join tblCategory tc on
	te.CategoryID = tc.CategoryID
left join tblCountry tc2 on
	tc2.CountryID = te.CountryID
where te.EventDetails  not like '%[o,w,l]%')
SELECT 
te2.EventName ,
te2.CategoryID ,
CTE.CountryName ,
CTE.CategoryName ,
CTE.CountryID
From tblEvent te2 inner join CTE on te2.CountryID = CTE.CountryID)

/*EX5*/
With CTR as (
SELECT 
te.EventID ,
case when
year (te.EventDate) <1900 then '19th century and earlier' 
when year(te.EventDate) <2000 then '20th century and earlier'
else '21st century'
end as era
From tblEvent te )
Select
CTR.era ,
count(EventID)
from CTR 
Group by CTR.era


