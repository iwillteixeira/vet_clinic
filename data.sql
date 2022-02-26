/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Gabumon', '2021-01-07', 1, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Pikachu', '2021-11-15', 2, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Devimon', '2017-05-12', 5, true, 12);

/* New data added*/

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Charmander', '2020-02-08', 0, false, -11);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon','2022-11-15', 2, true, -5.7);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', '2005-06-12', 1, true, -45);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', '1998-10-13', 3, true, 17);

INSERT INTO owners(full_name, age)
VALUES ('Sam Smith',34);

INSERT INTO owners(full_name, age)
VALUES ('Jennifer Orwell',19);

INSERT INTO owners(full_name,age)
VALUES ('Bob', 45);

INSERT INTO owners(full_name,age)
VALUES ('Melody Pond', 77);

INSERT INTO owners(full_name,age)
VALUES ('Dean Winchester', 14);

INSERT INTO owners(full_name,age)
VALUES ('Jodie Wittaker', 38);

INSERT INTO species(name) VALUES('Pokemon');
INSERT into species(name) VALUES('Digimon');


UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

UPDATE animals SET owner_id = owners.id FROM owners WHERE name='Agumon' AND owners.full_name = 'Sam Smith';
UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Gabumon', 'Pikachu') AND owners.full_name ='Jennifer Orwell';
UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Devimon','Plantmon') AND owners.full_name = 'Bob';
UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Charmander', 'Squirtle','Blossom') AND owners.full_name = 'Melody Pond';
UPDATE animals SET owner_id = owners.id from owners WHERE name IN ('Angemon','Boarmon') AND owners.full_name = 'Dean Winchester';


/*Add new data to vets table*/
INSERT INTO vets (name, age, date_of_graduation)
	VALUES('William Tatcher', 45, '2000-04-23');

INSERT INTO vets (name, age, date_of_graduation)
	VALUES('Maisy Smith', 26, '2019-01-17');

INSERT INTO vets (name, age, date_of_graduation)
	VALUES('Stephanie Mendez', 64, '1981-05-4');
	
INSERT INTO vets (name, age, date_of_graduation)
	VALUES('Jack Harkness', 38, '2008-06-8');

/*Add specialities vets-species*/
INSERT INTO specializations (vets_id, species_id)
	VALUES(1,1);

INSERT INTO specializations (vets_id, species_id)
	VALUES(3,1);

INSERT INTO specializations (vets_id, species_id)
	VALUES(4,2);

/*Add visits data*/
/*Agumon visited William Tatcher on May 24th, 2020.
Agumon visited Stephanie Mendez on Jul 22th, 2020.*/
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(1,1,'2020-05-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(1,3,'2020-07-22');
/*Gabumon visited Jack Harkness on Feb 2nd, 2021.*/
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(2,4,'2021-02-2');
/*Pikachu visited Maisy Smith on Jan 5th, 2020.
Pikachu visited Maisy Smith on Mar 8th, 2020.
Pikachu visited Maisy Smith on May 14th, 2020.*/
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(3,2,'2020-01-5');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(3,2,'2020-03-8');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(3,2,'2020-05-14');
/*Devimon visited Stephanie Mendez on May 4th, 2021.*/
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(4,3,'2021-05-4');
/*Charmander visited Jack Harkness on Feb 24th, 2021.*/	
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(5,4,'2021-02-24');
/*Plantmon visited Maisy Smith on Dec 21st, 2019.
Plantmon visited William Tatcher on Aug 10th, 2020.
Plantmon visited Maisy Smith on Apr 7th, 2021.*/	
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(6,2,'2019-12-21');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(6,1,'2020-08-10');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(6,2,'2021-04-7');
/*Squirtle visited Stephanie Mendez on Sep 29th, 2019.*/	
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(7,3,'2019-09-29');
/*Angemon visited Jack Harkness on Oct 3rd, 2020.
Angemon visited Jack Harkness on Nov 4th, 2020.*/	
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(8,4,'2020-10-3');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(8,4,'2020-11-4');
/*Boarmon visited Maisy Smith on Jan 24th, 2019.
Boarmon visited Maisy Smith on May 15th, 2019.
Boarmon visited Maisy Smith on Feb 27th, 2020.
Boarmon visited Maisy Smith on Aug 3rd, 2020.*/
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(9,2,'2019-01-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(9,2,'2019-05-15');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(9,2,'2020-02-27');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(9,2,'2020-08-3');
/*Blossom visited Stephanie Mendez on May 24th, 2020.
Blossom visited William Tatcher on Jan 11th, 2021.*/	
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(10,3,'2020-05-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit)
	VALUES(10,1,'2021-01-11');
