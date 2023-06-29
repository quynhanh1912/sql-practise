/* Ex1:*/
SELECT
	ta.AuthorName ,
	sum(EpisodeNumber) as 'Number of Episodes' ,
	min(EpisodeDate) as 'Earliest Day' ,
	max(EpisodeDate) as 'Lasted Day'
From
	tblEpisode te
left join tblAuthor ta on
	te.AuthorId = ta.AuthorId
group by
	ta.AuthorName
order by
	sum(EpisodeNumber) DESC ;

/* Ex2:*/

SELECT
	tc.CategoryName ,
	Count (te.EventName) as 'Number of Event'
FROM
	tblCategory tc
left join tblEvent te on
	tc.CategoryID = te.CategoryID
Group by
	tC.CategoryName
ORDER BY
	COUNT(TE.EventName) DESC ;

/* EX 3*/

SELECT
	COUNT(te.EventName) AS 'Number of events' ,
	min(te.EventDate) as 'First Day' ,
	Max(te.EventDate) as 'Last day'
FROM
	tblEvent te ;

/*Ex 4*/
SELECT
	tc.ContinentName ,
	tc2.CountryName ,
	Count(te.EventName) as 'Number of events'
From
	tblContinent tc
left join tblCountry tc2 on
	tc.ContinentID = tc2.ContinentID
left join tblEvent te on
	tc2.CountryID = te.CountryID
Group by
	tc.ContinentName ,
	tc2.CountryName
Order by
	ContinentName asc ;

/* Ex5 */

SELECT
	ta.AuthorName ,
	td.DoctorName ,
	sum(te.EpisodeNumber) as 'Number of Episodes'
From
	tblAuthor ta
left join tblEpisode te on
	ta.AuthorId = te.AuthorId
left join tblDoctor td on
	te.DoctorId = td.DoctorId
Group by
	ta.AuthorName ,
	td.DoctorName
having
	sum(te.EpisodeNumber) > 5
order by
	sum(te.EpisodeNumber) desc


/*Ex 6*/
	Select
	datepart (year,
	te2.EpisodeDate) as 'Episode Year',
	te.EnemyName ,
	count (te2.EpisodeNumber) as 'Number of Episodes' ,
	datepart (year,
	td.BirthDate)
From
	tblEnemy te
left join tblEpisodeEnemy tee on
	te.EnemyId = tee.EnemyId
left join tblEpisode te2 on
	tee.EpisodeId = te2.EpisodeId
left join tblDoctor td on
	te2.DoctorId = td.DoctorId
group by
	datepart (year,
	te2.EpisodeDate) ,
	te.EnemyName ,
	datepart (year,
	td.BirthDate)
Having
	datepart (year,
	td.BirthDate)<1970
	AND 
count (te2.EpisodeNumber) >1
order by
	datepart (year,
	te2.EpisodeDate) ASC
	
/*EX 8*/
	
Select
	(cast(((year(EventDate)/ 100)+ 1) as varchar) + 'th century') as 'Century',
	COUNT(CAST(((YEAR(EventDate)/ 100)+ 1) AS varchar) + 'th century') as 'Number of events'
from
	tblEvent
Group by
	(cast(((year(EventDate)/ 100)+ 1) AS varchar) + 'th century')
with cube 


/*III
 * Ex 1
 */
select EventName ,
te.EventDate as 'Event Date' ,
format(EventDate, 'd', 'en-US') as 'Event date Format' ,
CONVERT (date, te.EventDate , 112) as 'Event Date convert'
from tblEvent te 
where year(EventDate) = 1984

