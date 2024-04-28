In this assignment you:
Create a table with persistent data and a specified schema
Populate table with specific entries
Change partition number to compare query speeds

Create a table whose data will remain after you drop the table and after the cluster shuts down. Name this table newTable and specify the location to be at /tmp/newTableLoc
Set up the table to have the following schema:
`Address` STRING,
`City` STRING,
`Battalion` STRING,
`Box` STRING,
Run the following cell first to remove any files stored at /tmp/newTableLoc before creating our table. Be sure to first re-run that cell each time you create newTable.

    DROP TABLE IF EXISTS newtable ;
    CREATE EXTERNAL TABLE newtable  
    (
    `Address` STRING,
    `City` STRING,
    `Battalion` STRING,
    `Box` STRING
    )
    STORED AS parquet
    LOCATION '/tmp/newTableLoc'


      
Now let's populate newTable with some of the rows from the fireCallsJSON table you just loaded. We only want to include fire calls whose Final Priority is 3.
      
    INSERT INTO newtable 
    SELECT Address, City, Battalion, Box
    FROM fireCallsJSON
    WHERE `Final Priority` = 3;

    SELECT * FROM newTable;

Question 2
**How many rows are in newTable? **
    SELECT count(*) FROM newTable;
191039

Question 3
What is the "Battalion" of the first entry in the sorted table?
    SELECT * FROM newTable
    ORDER BY Battalion ASC
B01


Let's try increasing the number of partitions to 256. Create this as a new table and call it newTablePartitioned
    CREATE OR REPLACE TEMPORARY VIEW newTablePartitioned
    AS 
    SELECT /** REPARTITION(256) */*
    FROM newTable

Now let's take a look at how this new table is stored.
    DESCRIBE EXTENDED newTablePartitioned

Question 4
Was this query faster or slower on the table with increased partitions?
Slower


Question 5
Does the data stored within the table still exist at the original location (dbfs:/tmp/newTableLoc) after you dropped the table? (Answer "yes" or "no")
YES


----------------------------------------------------
Question 1
What type of table is "newTable"?
EXTERNAL 
        
Question 2
How many rows are in "newTable"?
191039

Question 3
What is the "Battalion" of the first entry in the sorted table?
B01

Question 4
Was this query faster or slower on the table with increased partitions?
SLOWER

Question 5
Does the data stored within the table still exist at the original location ('dbfs:/tmp/newTableLoc') after you dropped the table?
YES
