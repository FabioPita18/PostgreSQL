CREATE TABLE teacher_list (
	id bigserial,
	school_names varchar(100),
	teacher_last_names varchar(100)
);

INSERT INTO teacher_list (school_names)
VALUES ('Jeppe'),
       ('Bennies'),
       ('KES'),
       ('St Johns'),
       ('North Cliff'),
       ('Assumption');
	   
INSERT INTO teacher_list (teacher_last_names)
VALUES ('Adams'),
       ('Nargel'),
       ('Jones'),
       ('Williams'),
       ('Murphy'),
       ('Jordaan');
	   
SELECT school_names, teacher_last_names
FROM teacher_list
ORDER BY school_names , teacher_last_names;


CREATE TABLE teacher_names (
	id bigserial,
	teacher_name varchar(100),
	salary integer
);

INSERT INTO teacher_names (teacher_name)
VALUES ('Adams'),
       ('Nargel'),
       ('Jones'),
       ('Williams'),
       ('Murphy'),
       ('Sam');
	   
SELECT * FROM teacher_names
WHERE teacher_name = 
AND (salary < 38000 OR salary > 40000);