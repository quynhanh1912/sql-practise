/*Part 1
 * Ex1: Create a query which lists out all of the events in the tblEvent table which happened after the last one for country 21 (International) took place.
*/

Select
	*
from
	tblEvent te2
where
	EventDate > (
	SELECT
		max(EventDate)
	From
		tblEvent te
	Where
		CountryID = 21 );

/*Ex2: Write a sub query to filter events to show only those which have an event name of longer than average length. You will need the AVG and LEN functions to do this.
Hint: You can run your subquery separately by highlighting it to show that the average EventName length is 26 characters*/

SELECT 
	te.EventName ,
	LEN(EventName) as Len_Event_Name
from 
	tblEvent te
WHERE
	LEN(EventName) > 
(
	SELECT
		AVG(LEN(te.EventName)) as Average_Event_len
	From
		tblEvent te ) ;
	
/*Ex3: Write a SELECT statement to return events from the 3 continents with the fewest events. 
Hint: To do this first write a SELECT query which returns all the continents and events.
Now underneath write another SELECT statemnt which lists  events for the 3 continents with the lowest COUNT of events. Put the COUNT in the ORDER BY clause, not the SELECT.
Finally use the second SELECT as a filter in the first SELECT's WHERE clause. To do this use ContinentName IN (Sub Query).
*/
SELECT 
tc2.ContinentName ,
te.EventName 
from
tblEvent te
	left join tblCountry tc on
		te.CountryID = tc.CountryID
	left join tblContinent tc2 on
		tc.ContinentID = tc2.ContinentID 
WHERE 
tc2.ContinentName in (
SELECT top (3)
		tc2.ContinentName 
FROM
		tblEvent te
	left join tblCountry tc on
		te.CountryID = tc.CountryID
	left join tblContinent tc2 on
		tc.ContinentID = tc2.ContinentID 
GROUP BY
	tc2.ContinentName 
Order by count(te.EventName))


/*Ex4: Write a query which lists out countries which have more than 8 events, using a correlated subquery rather than HAVING. 
*/

SELECT 
    tc.CountryName
FROM
    tblCountry tc
WHERE
    (
        SELECT
            COUNT(te.EventID)
        FROM
            tblEvent te
        WHERE
            te.CountryID = tc.CountryID
    ) >8 
Order By
    tc.CountryName;
/*Ex5: Create a subquery to list out all of those events whose:
Country id is not in the list of the last 30 country ids from tblCountry in alphabetical order; and
Category id is not in the list of the last 15 category ids from tblCategory in alphabetical order.
*/
   select
   EventName ,
   EventDetails
   from tblEvent te inner join tblCategory tc1
on te.CategoryID = tc1.CategoryID inner join tblCountry tc ON te.CountryID = tc.CountryID  where tc.CountryID 
not in 
(Select top 30
   tc.CountryID
   From tblCountry tc 
   order by tc.CountryName desc)
 AND  tc1.CategoryID  not in
  (Select top 15
  tc1.CategoryID
  From tblCategory tc1 
  order by tc1.CategoryName desc);
 
 

