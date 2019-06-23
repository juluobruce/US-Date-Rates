-- Create a new table
DROP TABLE Deathrates;

CREATE TABLE Deathrates (
  "Year" INT,
  "113_Cause_Name" VARCHAR(250),
  "Cause_Name" VARCHAR(250),
  "State" VARCHAR(250),
  "Deaths" INT,
  "Age_adjusted_Death_Rate" FLOAT
);

-- view the query 

SELECT * FROM Deathrates;


-- seperate by State (CA) -- descending order by year 
-- to see the diff diseases in CA

SELECT 
"Cause_Name",
"State",
"Year"
FROM Deathrates
WHERE "State" = 'California'
ORDER BY "Year" DESC
;

-- Specify by Cause_Name (Suicide) by state (California) per year
SELECT
"Cause_Name",
"State",
"Deaths",
"Year"
FROM Deathrates
WHERE "Cause_Name" = 'Suicide' AND "State" = 'California'
ORDER BY "Year" DESC
;

-- Exporting as CSV file 
-- There's an option of doing it via postgres

\copy (SELECT * FROM persons) to 'C:\tmp\persons_client.csv' with csv

COPY (SELECT
"Cause_Name",
"State",
"Deaths",
"Year"
FROM Deathrates
WHERE "Cause_Name" = 'Suicide' AND "State" = 'California'
ORDER BY "Year" DESC)
TO 'C:\tmp\suicide_rate_CA.csv' WITH CSV
;


