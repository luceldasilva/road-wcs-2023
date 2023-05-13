/*  
Poner ids a decks y skills
y estandarizar decks con engines
*/
ALTER TABLE decks ADD COLUMN deck_id SERIAL;
ALTER TABLE skills ADD COLUMN skill_id SERIAL;
-- Borrar los que tengas engines que no son relevantes
select * from decks where deck like '%nfer%';
DELETE from decks where deck_id = 12;
DELETE from decks where deck_id = 55;
-- Borrar resetear los ids y que sean consecutivos
ALTER TABLE decks DROP COLUMN deck_id;
-- Volver a ejecutar el crear deck_id Serial
/* Agregar este conjunto porque
fue relevante en la Edición de Abril 2023
*/
INSERT INTO decks (deck) 
VALUES 
	('Code Talker Salamangreat');
-- Actualizar registro de kcapril23
select * from kcapril23;
ALTER TABLE kcapril23 ADD COLUMN id SERIAL;
/*
Estandarizar Code Talker Salamangreat en kcapril23
*/
SELECT id, deck, skill
FROM kcapril23
WHERE skill like '%abla%';
--
BEGIN;
UPDATE kcapril23 SET skill = 'Codificador Hablador Vivo'
WHERE skill like '%alam%';
ROLLBACK; --casi la cago :v
/*
Primero agregar salamangreat al code talker 
que tenga de skill salamangreat
*/
BEGIN;
UPDATE kcapril23
SET deck = 'Code Talker Salamangreat'
WHERE skill like '%alam%';
COMMIT;
-- Ahora poner la skill sin abreviar
BEGIN;
UPDATE kcapril23
SET skill = 'Codificador Hablador Vivo'
WHERE deck = 'Code Talker Salamangreat';
COMMIT;

-- Agregar la columnas deck_id y skill_id
ALTER TABLE kcapril23 ADD COLUMN deck_id INTEGER, ADD COLUMN skill_id INTEGER;
ALTER TABLE kcnov22 ADD COLUMN deck_id INTEGER, ADD COLUMN skill_id INTEGER;
ALTER TABLE kcfeb23 ADD COLUMN deck_id INTEGER, ADD COLUMN skill_id INTEGER;
ALTER TABLE kcsep22 ADD COLUMN deck_id INTEGER, ADD COLUMN skill_id INTEGER;