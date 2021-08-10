CREATE TABLE animals (
	id bigserial,
	animal_type varchar(25)	
);

CREATE TABLE animal_specifics (
	id bigserial,
	age integer, 
	diet varchar(100),
	color varchar(20)
);

INSERT INTO animals (animal_type)
VALUES ('Zebra'),
       ('Lion'),
	   ('Giraffe'),
	   ('Python'),
	   ('Macow');
	   
INSERT INTO animal_specifics (age, diet, color)
VALUES ('5', 'Grass', 'Black and White'),
       ('13', 'Beef', 'Ginger and Brown'),
	   ('53', 'Tree Leaves', 'Yellow'),
	   ('8', 'Mice', 'Yellow'),
	   ('3', 'Insects', 'Red');
	   
SELECT * FROM animals;
SELECT * FROM animal_specifics;