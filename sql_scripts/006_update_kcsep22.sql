/*
Trabajar con kcsep22
*/
-- Establecer los valores de deck_id
BEGIN;
UPDATE kcsep22
SET deck_id = decks.deck_id
FROM decks
WHERE kcsep22.deck = decks.deck;
SELECT DISTINCT deck FROM kcsep22 WHERE deck_id IS NULL;
COMMIT;
--ROLLBACK;
--
UPDATE kcsep22 SET deck = 'Magical Girls' WHERE deck = 'Magician Girls';
--
UPDATE kcsep22 SET deck = 'Heros' WHERE deck = 'Hero';
--
--SELECT * FROM decks WHERE deck LIKE '%urni%';
UPDATE kcsep22 SET deck = 'Burning Abyss Phantom Knights' WHERE deck = 'PhantomKnight - BurningAbyss';
--
UPDATE kcsep22 SET deck = 'Metalfoes' WHERE deck = 'Metalfeos';
-- Agregar decks faltantes
INSERT INTO decks (deck) 
VALUES 
	('Altergeist'),
	('Ancient Gears'),
	('Aromages'),
	('Black Luster Soldier'),
	('Chronomaly'),
	('Crystons'),
	('Evil Heros'),
	('Fortune Ladys'),
	('Gaia'),
	('Lightsworn'),
	('Shiranui'),
	('Super Quant'),
	('Sylvans');
*/
-- Establecer los valores de skill_id
BEGIN;
UPDATE kcsep22
SET skill_id = skills.skill_id
FROM skills
WHERE kcsep22.skill = skills.skill;
SELECT DISTINCT skill FROM kcsep22 WHERE skill_id IS NULL;
COMMIT;
--ROLLBACK;
--SELECT * FROM skills WHERE skill LIKE '%amp%';
UPDATE skills SET skill = 'Campos de Guerreros' WHERE skill = 'Campos de Guerrero';
--SELECT * FROM skills WHERE skill LIKE '%hica%';
UPDATE skills SET skill = 'Las Chicas Magas' WHERE skill = 'Las chicas Magas';
--SELECT * FROM kcsep22 WHERE skill LIKE '%taqu%';
UPDATE kcsep22 SET skill = 'Carga de Ataque' WHERE id = 77;
--SELECT * FROM skills WHERE skill LIKE '%lic%';
UPDATE kcsep22 SET skill = 'Mundo Repleto de Malicia' WHERE skill = 'Mundo repleto de Malicia'
-- Agregar skills faltantes
INSERT INTO skills (skill) 
VALUES 
	('A Luchar Mecanismo Antiguo'),
	('El camino del Caballero Dragón'),
	('El Monstruo más imparable'),
	('El poder conduce al Destino'),
	('Equilibrador de Nivel del Cantante'),
	('Estrategia de Arobru'),
	('Fusión Milagrosa'),
	('Maestro de Rituales Supersoldado'),
	('Poder de los Sacrificados'),
	('Portal de Otra Dimensión');
/*
Ahora automatizar :P y que solo se quede los ids de skills y decks
*/
SELECT * FROM kcsep22;
BEGIN;
ALTER TABLE kcsep22 DROP COLUMN deck, DROP COLUMN skill;
SELECT * FROM kcsep22;
COMMIT;
/*
Crear llaves foráneas
*/
BEGIN;
ALTER TABLE kcsep22
ADD CONSTRAINT fk_kcsep22_deck_id
FOREIGN KEY (deck_id)
REFERENCES decks (deck_id);
COMMIT;
--
BEGIN;
ALTER TABLE kcsep22
ADD CONSTRAINT fk_kcsep22_skill_id
FOREIGN KEY (skill_id)
REFERENCES skills (skill_id);
COMMIT;