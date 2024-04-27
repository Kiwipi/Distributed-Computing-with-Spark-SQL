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

Question 1
What type of table is newTable? "EXTERNAL" or "MANAGED"?
EXTERNAL 

      
Now let's populate newTable with some of the rows from the fireCallsJSON table you just loaded. We only want to include fire calls whose Final Priority is 3.
      
    INSERT INTO newtable 
    SELECT Address, City, Battalion, Box
    FROM fireCallsJSON
    WHERE `Final Priority` = 3;

    SELECT count(*) FROM newTable;
      
Question 2
How many rows are in "newTable"?
382078
