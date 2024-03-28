--Create a Table
--Create a new table called fireIncidents for this dataset. Be sure to use options to properly parse the data.

CREATE TABLE fireIncidents 
USING csv
OPTIONS (
  header "true",
  path "/mnt/davis/fire-incidents/fire-incidents-2016.csv",
  inferSchema "true"
)

--Question 1
--Return the first 10 lines of the data. On the Coursera platform, input the result to the following question:

--What is the first value for "Incident Number"?
  16000003
  
SELECT * FROM fireIncidents Limit 10

--Question 2
--Return all incidents that occurred on Conor's birthday in 2016. For those of you who forgot his birthday, it's April 4th. On the Coursera platform, input the result to the following question:

--What is the first value for "Incident Number" on April 4th, 2016?
  16037478
SELECT *
FROM fireIncidents
WHERE `Incident Date` = CAST('2016-04-04' AS DATE)


--Question 3
--Return all incidents that occurred on Conor's or Brooke's birthday. For those of you who forgot her birthday too, it's 9/27.

--Is the first fire call in this table on Brooke or Conor's birthday?
The first fire call is 16037478, It's Conor's birthday
SELECT *
FROM fireIncidents
WHERE `Incident Date` = CAST('2016-04-04' AS DATE)
OR `Incident Date` = CAST('2016-09-27' AS DATE)

--Question 4
--Return all incidents on either Conor or Brooke's birthday where the Station Area is greater than 20.

--What is the "Station Area" for the first fire call in this table?
29
SELECT *
FROM fireIncidents
WHERE `Incident Date` = CAST('2016-04-04' AS DATE)
OR `Incident Date` = CAST('2016-09-27' AS DATE)
AND `Station Area` > 20;

--Question 5
--Count the incidents on Conor's birthday.

--How many incidents were on Conor's birthday in 2016?
80
SELECT *
FROM fireIncidents
WHERE `Incident Date` = CAST('2016-04-04' AS DATE)

--Question 6
--Return the total counts by Ignition Cause. Be sure to return the field Ignition Cause as well.
--How many fire calls had an "Ignition Cause" of "4 act of nature"?
5
SELECT `Ignition Cause`, COUNT(*)
FROM fireIncidents
GROUP BY `Ignition Cause`

--Question 7
--Return the total counts by Ignition Cause sorted in ascending order.
--What is the most common "Ignition Cause"? (Put the entire string)
2 unintentional
SELECT `Ignition Cause`, COUNT(*) AS `Cause times`
FROM fireIncidents
GROUP BY `Ignition Cause`
ORDER BY `Cause times`  DESC


--Return the total counts by Ignition Cause sorted in descending order.
SELECT `Ignition Cause`, COUNT(*) AS `Cause times`
FROM fireIncidents
GROUP BY `Ignition Cause`
ORDER BY `Ignition Cause`  DESC

--Create the table fireCalls if it doesn't already exist. The path is as follows: /mnt/davis/fire-calls/fire-calls-truncated-comma.csv
CREATE TABLE IF NOT EXISTS fireCalls
USING csv
OPTIONS (
  header "true",
  path "/mnt/davis/fire-calls/fire-calls-truncated-comma.csv",
  inferSchema "true"
)

--Join the two tables on Battalion by performing an inner join.
SELECT *
FROM fireCalls 
JOIN fireIncidents 
ON fireCalls.Battalion=fireIncidents.Battalion


--Question 8
--Count the total incidents from the two tables joined on Battalion.

--What is the total incidents from the two joined tables?
847094402
SELECT COUNT(*) AS `incidents counts`
FROM fireCalls 
JOIN fireIncidents 
ON fireCalls.Battalion=fireIncidents.Battalion

--Done in DATABRICKS
--https://databricks-prod-cloudfront.cloud.databricks.com/public/4027ec902e239c93eaaa8714f173bcfc/1587743227265763/2386683332534249/2279028002804578/latest.html
