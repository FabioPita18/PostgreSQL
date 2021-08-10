--1. numeric(4,1) provides four digits total (the precision) and one digit after the decimal (the scale). 
--That would allow you to store a value as large as 999.9
numeric(4, 1)

--2. 50 characters is a resonable length for names, and varchar() ensures you will not waste space when names
--are shorter. Seperating first and last names into their own coloumns will let you later sort on each 
--independently.
varchar(50)

--3. Attempting to convert a string of text that does not conform to accepted date/time formats will result in an error. 
SELECT CAST('4//2017' AS timestamp with time zone);