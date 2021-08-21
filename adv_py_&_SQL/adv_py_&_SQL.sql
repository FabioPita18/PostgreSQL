-- Database: Python and advanced postgreSQL with psycopg2

-- DROP DATABASE "Python and advanced postgreSQL with psycopg2";

CREATE DATABASE "Python and advanced postgreSQL with psycopg2"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
CREATE TABLE users (name TEXT, email TEXT, last_opend INTEGER);

INSERT INTO users VALUES ('Bob Smith', 'bobsmith@example.com', 65615),
('Rolf Smith', 'rolf@gmail.com', 8586854),
('Susan williams', 'Susan@gmail.com', 56),
('Anne pun', 'ana@gmail.com', 2456789);

DELETE FROM users

CREATE FUNCTION delete_inactive(seconds NUMERIC) RETURNS void AS $$
	DELETE FROM users WHERE last_opend > seconds;
$$ LANGUAGE SQL;

SELECT * FROM users

SELECT delete_inactive(50000);

DROP FUNCTION delete_inactive(NUMERIC);

-----------------------------------------------------------------------------------

DROP TABLE users
DROP TABLE emails
DROP TABLE email_opens

CREATE TABLE users (id int PRIMARY KEY, name TEXT, email TEXT);
CREATE TABLE emails (id int PRIMARY KEY, name TEXT, content TEXT);
CREATE TABLE email_opens (
	email_id int,
	user_id int,
	opend_time int,
	PRIMARY KEY(email_id, user_id),
	FOREIGN KEY (email_id) REFERENCES emails(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users VALUES (1, 'Bob Smith', 'bobsmith@example.com'),
(2, 'Rolf Smith', 'rolf@gmail.com'),
(3, 'Susan williams', 'Susan@gmail.com'),
(4, 'Anne pun', 'ana@gmail.com');

INSERT INTO emails VALUES (1, 'This is a test email'),
(2, 'Another test email'),
(3, 'we should wright longer emails');

INSERT INTO email_opens VALUES (3, 2, 1572393600),
(2, 2, 1572393600),
(3, 3, 1572393600),
(2, 3, 1572393600),
(1, 4, 1572393600),
(3, 1, 1572393600);

SELECT * FROM email_opens JOIN users on email_opens.user_id = users.id;

CREATE OR REPLACE FUNCTION opened_ago(email_open_row email_opens) RETURNS INTEGER AS $$
    SELECT cast(extract(epoch FROM CURRENT_TIMESTAMP) AS INTEGER) - email_open_row.opend_time AS email_opened_ago;
$$ LANGUAGE SQL;

SELECT *, opened_ago(email_opens) FROM users
JOIN email_opens ON users.id = email_opens.user_id
WHERE opened_ago(email_opens) < 70000000;
SELECT * FROM users;
SELECT * FROM emails;
SELECT * FROM email_opens;

DROP FUNCTION opened_ago;
-----------------------------------------------------------------------------------------------------------------------
--Not recomended, it can become dangerous in  larger databases.

--Manual table-level locking

--LOCK TABLE users IN SHARE UPDATE EXCLUSIVE MODE;

--Row-level locking

--SELECT * FROM users WHERE email = 'rolf@example.com' FOR UPDATE;

---------------------------------------------------------------------------------------------------------------------------
-- Passing arguments
SELECT * FROM users WHERE name = %s;
-----------------------------------------------------------------------------------------------------------------------------
-- Using SQL String Composition

from psycopg2 import sql

table_name = input('Enter table you want to search in: ')
column_name = input('Enter column you want to search by: ')
search_value = input('Enter what value youre looking for: ')

query = sql.SQL("SELECT * FROM {table} WHERE {column} = %s;")
query = query.format(
	table=sql.Identifier(table_name),
	column=sql.Identifier(column_name)
)

--Pass variable fields to a query
fields_csv = input("Enter fields you wish to retrieve, seperated by commas: ")
fields = fields_csv.strip().split(",")
sql_fields = [sql.Identifier(field) for field in fields]

query = sql.SQL("SELECT {fields} FROM users;")
query = query.format(
	fields=sql.SQL(",").join(sql_fields)
)

--Other modules classes
--sql.Identifier used for tables and columns
--sql.Literal used for values hardcoded in query 
--sql.Placeholder for values to be passed later (or %s can be used instead)


