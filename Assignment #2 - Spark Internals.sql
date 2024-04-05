--Question 1
--How many fire calls are in our fireCalls table?
  
240613
  
SELECT count(`call number`)
FROM fireCalls

--Question 2
--How large is our fireCalls dataset in memory? Input just the numeric value (e.g. 51.2) to Coursera.
--Cache the table, then navigate the Spark UI.


Question 3
Which "Unit Type" is the most common?
  ENGINE 92828
SELECT `Unit Type`, count(*)
FROM firecalls
GROUP BY `Unit Type`
ORDER BY count(*) DESC

Question 4
**What type of transformation, wide or narrow, did the GROUP BY and ORDER BY queries result in? **
GRPU BY, ORDER BY are Wide transformation


Question 5
Looking at the query below, how many tasks are in the last stage of the last job?
Check the Spark UI and see how many tasks were launched. Did it use the shuffle partitions value defined?
1 tasks had been launcged, it didn't user shuffle partitions as 8.
