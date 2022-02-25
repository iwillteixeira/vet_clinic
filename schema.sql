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


