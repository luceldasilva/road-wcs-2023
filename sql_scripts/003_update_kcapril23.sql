/*
Trabajar con kcapril23
*/
-- Establecer los valores de deck_id
BEGIN;
UPDATE kcapril23
SET deck_id = decks.deck_id
FROM decks
WHERE kcapril23.deck = decks.deck;
SELECT id, deck FROM kcapril23 WHERE deck_id IS NULL;
COMMIT;
-- ROLLBACK;
ALTER TABLE kcapril23 DROP COLUMN deck_id;
-- Cambiar Wounded Hero a Heros porque la skill ya está su nombre
select * from decks where deck like '%ero%';
BEGIN;
UPDATE decks SET deck = 'Heros' WHERE deck_id = 40;
COMMIT;
-- Agregar decks faltantes
INSERT INTO decks (deck) 
VALUES 
	('Invoked'),
	('Amazoness'),
	('Timerlod');
-- Establecer los valores de skill_id
BEGIN;
UPDATE kcapril23
SET skill_id = skills.skill_id
FROM skills
WHERE kcapril23.skill = skills.skill;
SELECT id, skill FROM kcapril23 WHERE skill_id IS NULL;
COMMIT;
--ROLLBACK;
-- Agregar skills faltantes
INSERT INTO skills (skill) 
VALUES 
	('Robar sentido Bestia Alada'),
	('Campos de Guerrero'),
	('Carga de Ataque');
/*
Renombrar porque están mal escrito
*/
SELECT * FROM skills WHERE skill LIKE '%onju%';
SELECT id, deck_id, skill FROM kcapril23 WHERE skill LIKE '%onjuros de%';
BEGIN;
UPDATE kcapril23
SET skill = 'Conjuro de Rosas'
WHERE deck_id = 53;
SELECT id, deck_id, skill FROM kcapril23 WHERE deck_id = 53;
COMMIT;
--
SELECT * FROM skills WHERE skill LIKE '%ekl%';
SELECT id, deck_id, skill FROM kcapril23 WHERE skill LIKE '%do Me%';
BEGIN;
UPDATE kcapril23
SET skill = 'Refinamiento Meklord'
WHERE id = 107;
SELECT id, deck_id, skill FROM kcapril23 WHERE id = 107;
COMMIT;
--
SELECT * FROM skills WHERE skill LIKE '%utur%';
SELECT id, deck_id, skill FROM kcapril23 WHERE skill LIKE '%Futuro ft%';
BEGIN;
UPDATE kcapril23
SET skill = 'Un Vínculo Ilumina el Futuro'
WHERE id = 220;
SELECT id, deck_id, skill FROM kcapril23 WHERE id = 220;
COMMIT;
--ROLLBACK;
SELECT * FROM skills WHERE skill LIKE '%lian%';
SELECT id, deck_id, skill FROM kcapril23 WHERE skill LIKE '%eros';
BEGIN;
UPDATE kcapril23
SET skill = 'Alianza de Héroes'
WHERE id = 277;
SELECT id, deck_id, skill FROM kcapril23 WHERE id = 277;
COMMIT;
/*
Ahora automatizar :P y que solo se quede los ids de skills y decks
*/
BEGIN;
ALTER TABLE kcapril23 DROP COLUMN deck, DROP COLUMN skill;
SELECT * FROM kcapril23;
COMMIT;
/*
Crear llaves foráneas
*/
BEGIN;
ALTER TABLE decks
ADD CONSTRAINT uk_decks_id UNIQUE (deck_id);
COMMIT;
BEGIN;
ALTER TABLE kcapril23
ADD CONSTRAINT fk_kcapril23_deck_id
FOREIGN KEY (deck_id)
REFERENCES decks (deck_id);
COMMIT;
--
BEGIN;
ALTER TABLE skills
ADD CONSTRAINT uk_skills_id UNIQUE (skill_id);
COMMIT;
BEGIN;
ALTER TABLE kcapril23
ADD CONSTRAINT fk_kcapril23_skill_id
FOREIGN KEY (skill_id)
REFERENCES skills (skill_id);
COMMIT;