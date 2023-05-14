/*
Trabajar con kcfeb23
*/
-- Establecer los valores de deck_id
BEGIN;
UPDATE kcfeb23
SET deck_id = decks.deck_id
FROM decks
WHERE kcfeb23.deck = decks.deck;
SELECT id, deck FROM kcfeb23 WHERE deck_id IS NULL;
COMMIT;
--ROLLBACK;
/*
borrar los ft :P
*/
-- Code Talker ft Salamangreat
BEGIN;
UPDATE kcfeb23 
SET deck = 'Code Talker Salamangreat' 
WHERE deck = 'Code Talker ft Salamangreat';
SELECT id, deck, skill FROM kcfeb23 WHERE deck = 'Code Talker Salamangreat';
COMMIT;
ROLLBACK;
--SELECT * FROM decks WHERE deck LIKE '%irl%'
SELECT id, deck, skill FROM kcfeb23 WHERE deck LIKE '%irl%'
UPDATE kcfeb23 SET deck = 'Magical Girls' WHERE deck = 'Invoked Magical Girls';
--
UPDATE kcfeb23 SET deck = 'Elemental Heros' WHERE deck = 'Elemental Heros ft Magical Musket';
--
SELECT * FROM decks WHERE deck LIKE '%alam%'
UPDATE kcfeb23 SET deck = 'Salamangreat' WHERE deck = 'Salamangreat Mekk-Knights';
--
UPDATE kcfeb23 SET deck = 'Burning Abyss' WHERE deck = 'Burning Abyss ft Dark Worlds';
--
UPDATE kcfeb23 SET deck = 'Evil Eye' WHERE deck = 'Evil Eye ft Burning Abyss';
--
UPDATE kcfeb23 SET deck = 'Block Dragon' WHERE deck = 'Block Dragon ft Burning Abyss';
--
UPDATE kcfeb23 SET deck = 'Resonators' WHERE deck = 'Resonators fi Infernoid';
--
UPDATE kcfeb23 SET deck = 'Burning Abyss' WHERE deck = 'Burning Abyss ft Infernoid';
-- Agregar decks faltantes
INSERT INTO decks (deck) 
VALUES 
	('Infinitrack'),
	('Kozmo'),
	('Dinos'),
	('Magical Girls');
*/
-- Establecer los valores de skill_id
BEGIN;
UPDATE kcfeb23
SET skill_id = skills.skill_id
FROM skills
WHERE kcfeb23.skill = skills.skill;
SELECT DISTINCT skill FROM kcfeb23 WHERE skill_id IS NULL;
COMMIT;
--ROLLBACK;
-- Agregar skills faltantes
INSERT INTO skills (skill) 
VALUES 
	('Profundidades Míticas'),
	('Poder de la Oscuridad'),
	('Las chicas Magas'),
	('Atacante Poderoso'),
	('Donde Habitan los Héroes'),
	('Refuerzos'),
	('Revelación del Castillo del Rey Supremo'),
	('Tres Efectos'),
	('Agarre Espiritual'),
	('Fantasma Huevo'),
	('Adelante'),
	('Lectura Mental');
/*
Ahora automatizar :P y que solo se quede los ids de skills y decks
*/
SELECT * FROM kcfeb23;
BEGIN;
ALTER TABLE kcfeb23 DROP COLUMN deck, DROP COLUMN skill;
SELECT * FROM kcfeb23;
COMMIT;
/*
Crear llaves foráneas
*/
BEGIN;
ALTER TABLE kcfeb23
ADD CONSTRAINT fk_kcfeb23_deck_id
FOREIGN KEY (deck_id)
REFERENCES decks (deck_id);
COMMIT;
--
BEGIN;
ALTER TABLE kcfeb23
ADD CONSTRAINT fk_kcfeb23_skill_id
FOREIGN KEY (skill_id)
REFERENCES skills (skill_id);
COMMIT;
-- Cambiar de nombre de columna duelist a usuario
BEGIN;
ALTER TABLE kcfeb23 RENAME COLUMN duelist TO usuario;
SELECT usuario FROM kcfeb23;
COMMIT;