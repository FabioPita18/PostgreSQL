-- Database: data.db

-- DROP DATABASE "data.db";

CREATE DATABASE "data.db"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
CREATE TABLE users (first_name TEXT, surname TEXT);

INSERT INTO users VALUES ('ROLF', 'SMITH');

SELECT * 
FROM users
WHERE surname != 'Smith';

DROP TABLE IF EXISTS users;
