/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN DATE '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN('Agumon','Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


/* Transaction unspecified species*/
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* Transaction update animals species */
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT species FROM animals;

/* Transaction delete everything then ROLLBACK*/

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* Transaction UPDATE,DELETE AND SAVE */
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg*-1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, sum(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, min(weight_kg), max(weight_kg) FROM animals GROUP by species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;














