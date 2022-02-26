/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
   id              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
   name            VARCHAR(30) NOT NULL,
   date_of_birth   DATE NOT NULL,
   escape_attempts INT NOT NULL,
   neutered        BOOL NOT NULL,
   weight_kg       FLOAT NOT NULL
);

ALTER TABLE animals ADD COLUMN species VARCHAR(30);

CREATE TABLE owners (
   id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
   full_name VARCHAR(60) NOT NULL,
   age INT NOT NULL
);

CREATE TABLE species(
   id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
   name VARCHAR(30) NOT NULL
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT species_fk FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD CONSTRAINT owner_fk FOREIGN KEY (owner_id) REFERENCES owners;

CREATE TABLE vets (
   id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
   name VARCHAR(50) NOT NULL,
   age INT NOT NULL,
   date_of_graduation DATE NOT NULL
);

CREATE TABLE specializations (
   vets_id INT NOT NULL,
   species_id INT NOT NULL,
   FOREIGN KEY (vets_id) REFERENCES vets(id),
   FOREIGN KEY (species_id) REFERENCES species(id),
   PRIMARY KEY(vets_id,species_id)
);

CREATE TABLE visits (
   animals_id INT NOT NULL,
   vets_id INT NOT NULL,
   date_of_visit DATE NOT NULL,
   FOREIGN KEY (animals_id) REFERENCES animals(id),
   FOREIGN KEY (vets_id) REFERENCES vets(id),
   PRIMARY KEY (animals_id,vets_id, date_of_visit)
);