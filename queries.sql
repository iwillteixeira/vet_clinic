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

/*Queries using JOIN*/

SELECT animals.name, full_name FROM animals INNER JOIN owners ON owners.id = animals.owner_id AND owners.full_name = 'Melody Pond';
SELECT animals.name, species.name FROM animals INNER JOIN species ON species.id = animals.species_id AND species.name = 'Pokemon';
SELECT owners.full_name, animals.name FROM animals RIGHT JOIN owners ON owners.id = animals.owner_id;
SELECT species.id, species.name, COUNT(animals.name) FROM animals INNER JOIN species ON species.id = animals.species_id GROUP BY species.id;
SELECT animals.name, full_name, species.name FROM animals INNER JOIN owners ON owners.id = animals.owner_id AND owners.full_name = 'Jennifer Orwell'
INNER JOIN species ON species.id = animals.species_id AND species.name = 'Digimon';
SELECT animals.name, owners.full_name FROM animals INNER JOIN owners ON owners.id = animals.owner_id AND owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT owners.full_name, COUNT(animals.name) FROM animals INNER JOIN owners ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(animals.name) DESC;

/*Queries with visits and specializations table*/
/*Who was the last animal seen by William Tatcher?*/
SELECT animals.name, vets.name, visits.date_of_visit FROM animals INNER JOIN visits ON visits.animals_id = animals.id
    INNER JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visit DESC;
/*How many different animals did Stephanie Mendez see?*/
SELECT vets.name, COUNT(animals.name) FROM animals INNER JOIN visits ON visits.animals_id = animals.id
    INNER JOIN vets  ON vets.id = visits.vets_id WHERE vets.name = 'Stephanie Mendez' GROUP BY vets.name;
/*List all vets and their specialties, including vets with no specialties.*/
SELECT vets.name, species.name FROM specializations RIGHT JOIN vets ON specializations.vets_id = vets.id
    LEFT JOIN species ON species.id = specializations.species_id;
/*List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.*/
SELECT animals.name, vets.name, visits.date_of_visit FROM animals INNER JOIN visits ON visits.animals_id = animals.id
    INNER JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
/*What animal has the most visits to vets?*/
SELECT animals.name, COUNT(visits.date_of_visit) FROM animals INNER JOIN visits ON visits.animals_id = animals.id GROUP BY animals.name ORDER BY COUNT(*) DESC;
/*Who was Maisy Smith's first visit?*/
SELECT animals.name, vets.name, visits.date_of_visit FROM animals INNER JOIN visits ON visits.animals_id = animals.id
    INNER JOIN vets  ON vets.id = visits.vets_id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit ASC;
/*Details for most recent visit: animal information, vet information, and date of visit.*/
SELECT visits.date_of_visit, animals.name, animals.escape_attempts,animals.neutered, animals.weight_kg, vets.name, vets.age, vets.date_of_graduation
    FROM animals INNER JOIN visits ON visits.animals_id = animals.id INNER JOIN vets  ON vets.id = visits.vets_id ORDER BY visits.date_of_visit DESC;
/*How many visits were with a vet that did not specialize in that animal's species?*/
SELECT vets.name, species.name, COUNT(visits.date_of_visit) AS total_visits FROM specializations RIGHT JOIN vets ON specializations.vets_id = vets.id
    LEFT JOIN species ON species.id = specializations.species_id INNER JOIN visits ON visits.vets_id = vets.id WHERE species.name IS NULL GROUP BY vets.name, species.name;
/*What specialty should Maisy Smith consider getting? Look for the species she gets the most.*/
SELECT COUNT(visits.animals_id), species.name, vets.name FROM visits INNER JOIN animals ON visits.animals_id = animals.id
    INNER JOIN species ON species.id = animals.species_id
    INNER JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name, vets.name ;


SELECT COUNT(*) FROM visits where animals_id = 4;

SELECT * FROM visits where vets_id = 2;

SELECT * FROM owners where email = 'owner_18327@mail.com';


