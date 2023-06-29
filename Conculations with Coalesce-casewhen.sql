/*Ex 1:
Create a query listing out each event with the length of its name, with the "shortest event" first. To calculate number of characters, use function LEN()

*/

SELECT 
EventName ,
len(EventName)
FROM tblEvent te 
order by len(EventName) asc ;

/*Ex2:
 * Create a query to list out for each event the category number that it belongs to. Use concat function.*/

Select
	concat (te.EventName ,
	' ',
	tc.CategoryName)
from
	tblEvent te
left join tblCategory tc on
	te.CategoryID = tc.CategoryID ;
	
	/* Ex 3: Use these 3 functions to show 3 ways of changing the Null value in Summary column to be ‘No summary’: ISNULL(), COALESCE(), CASE WHEN */

SELECT 
	tc.ContinentID ,
	tc.ContinentName , 
	isnull (tc.Summary ,
	'No_summary')
from
	tblContinent tc ;
	
	
Select
	tc. ContinentID ,
	tc.ContinentName ,
	COALESCE (tc.Summary,
	'No Summary')
From
	tblContinent tc ;

SELECT
	tc. ContinentID ,
	tc.ContinentName ,
	case when tc.Summary is null then 'No summary'
	when tc.Summary is not null then tc.Summary 
	end as Summary 
From
	tblContinent tc ;

/*Ex 4:
Write a query to divide countries into these groups:
*/

Select
	DISTINCT 
Case
		when tc.ContinentID = 1
		or tc.ContinentID = 3 then '1 or 3'
		when tc.ContinentID = 5
		or tc.ContinentID = 6 then '5 or 6'
		when tc.ContinentID = 2
		or tc.ContinentID = 4 then '2 or 4'
		when tc.ContinentID = 7 then '7'
		else 'Otherwise'
	end as 'Continent ID',
	Case
		when tc.ContinentID = 1
		or tc.ContinentID = 3 then 'Eurasia'
		when tc.ContinentID = 5
		or tc.ContinentID = 6 then 'Americas'
		when tc.ContinentID = 2
		or tc.ContinentID = 4 then 'Somewhere hot'
		when tc.ContinentID = 7 then 'Somewhere cold'
		else 'Somewhere else'
	end as 'Belongs to',
	Case
		when tc2.ContinentID = 1
		or tc2.ContinentID = 3 then 'Europe or Asia'
		when tc2.ContinentID = 5
		or tc2.ContinentID = 6 then 'North ans South America'
		when tc2.ContinentID = 2
		or tc2.ContinentID = 4 then 'Africa and Australia'
		when tc2.ContinentID = 7 then 'Antarctica'
		else 'International'
	end as 'Actual continent (for interest)'
from
	tblContinent tc
Left Join tblContinent tc2 on
	tc2.ContinentID = tc.ContinentID;

/*ex5 */ 

SELECT
	Country ,
	KmSquared ,
	ROUND(KmSquared / 20761, 0) as 'WalesUnits' ,
	(Kmsquared % 20761) as 'AreaLeftOver' ,
	CASE 
            WHEN 
                      CAST(ROUND((KmSquared / 20761), 0) as varchar(10)) < 1  
            THEN 
                      'Smaller than Wales'
            ELSE 
                      CAST(ROUND((KmSquared / 20761), 0) as VARCHAR(10)) + ' x ' + ' Wales plus ' +  
                      CAST( (KmSquared % 20761) as VARCHAR(10)) + ' sq. km.'  
END as 'Wales Comparison'
FROM
CountriesByArea
Order By
ABS(KmSquared - 20761)

 /*EX 6*/

SELECT
te.EventName 
FROM tblEvent te 
where EventName LIKE '[aeiou]%' AND EventName LIKE '%[aeiou]'


/*Ex7*/
SELECT
te.EventName 
FROM tblEvent te 
where left (te.EventName,1) = right (te.EventName,1)



