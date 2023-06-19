/*
	Tabla de Qualifiers WCS 23 con su limpieza
*/
-- Crear tabla
SET CLIENT_ENCODING TO 'UTF8';

DROP TABLE IF EXISTS qualifier_wcs_23;

CREATE TABLE qualifier_wcs_23 (
	usuario VARCHAR(4) NOT NULL UNIQUE,
	deck VARCHAR(100) NOT NULL,
	skill VARCHAR(255) NOT NULL,
	ndmax DATE NOT NULL,
	zerotg BOOLEAN,
	zephra BOOLEAN,
	bryan BOOLEAN,
	xenoblur BOOLEAN,
	yamiglen BOOLEAN,
	rax BOOLEAN
);

SET datestyle TO 'European';

SELECT * FROM qualifier_wcs_23;
-- Agregar id a los registros
ALTER TABLE qualifier_wcs_23 ADD COLUMN id SERIAL;
-- Agregar la columnas deck_id y skill_id
ALTER TABLE qualifier_wcs_23 ADD COLUMN deck_id INTEGER, ADD COLUMN skill_id INTEGER;
/*
	Establecer los valores de deck_id y skill_id 
	además ver si hay nuevos mazos y habilidades
*/
BEGIN;
UPDATE qualifier_wcs_23
SET deck_id = decks.deck_id
FROM decks
WHERE qualifier_wcs_23.deck = decks.deck;
SELECT DISTINCT deck FROM qualifier_wcs_23 WHERE deck_id IS NULL;
COMMIT;
--ROLLBACK; y agregar decks faltantes
BEGIN;
INSERT INTO decks (deck) 
VALUES 
	('Orcust'),
	('S-Force'),
	('Speedroid');
SELECT * FROM decks ORDER BY deck_id DESC LIMIT 3;
COMMIT;
--ROLLBACK;
BEGIN;
UPDATE qualifier_wcs_23
SET skill_id = skills.skill_id
FROM skills
WHERE qualifier_wcs_23.skill = skills.skill;
SELECT DISTINCT skill FROM qualifier_wcs_23 WHERE skill_id IS NULL;
COMMIT;
--ROLLBACK;
-- Agregar skills faltantes
BEGIN;
INSERT INTO skills (skill) 
VALUES 
	('Eliminación Revestida'),
	('Todo Listo'),
	('Péndulo Rabioso'),
	('Robar sentido Máquina'),
	('Barrera Protectora Sagrada'),
	('Marioneta Trucada Sustitución'),
	('Aceleración ala Transparente'),
	('Luz Majestuosa'),
	('Alzamiento de los Ráptors'),
	('Llamada del Guardían'),
	('Robar sentido Tierra'),
	('Regeneración Revestida');
SELECT * FROM skills ORDER BY skill_id DESC LIMIT 12;
COMMIT;
--ROLLBACK;
/*
Ahora automatizar :P y que solo se quede los ids de skills y decks
*/
BEGIN;
ALTER TABLE qualifier_wcs_23 DROP COLUMN deck, DROP COLUMN skill;
SELECT * FROM qualifier_wcs_23;
COMMIT;
/*
Crear llaves foráneas
*/
BEGIN;
ALTER TABLE qualifier_wcs_23
ADD CONSTRAINT fk_qualifier_wcs_23_deck_id
FOREIGN KEY (deck_id)
REFERENCES decks (deck_id);
COMMIT;
--
BEGIN;
ALTER TABLE qualifier_wcs_23
ADD CONSTRAINT fk_qualifier_wcs_23_skill_id
FOREIGN KEY (skill_id)
REFERENCES skills (skill_id);
COMMIT;