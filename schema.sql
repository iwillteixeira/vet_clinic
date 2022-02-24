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