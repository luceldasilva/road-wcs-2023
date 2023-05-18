/*
Trabajar con kcnov22
*/
-- Establecer los valores de deck_id
BEGIN;
UPDATE kcnov22
SET deck_id = decks.deck_id
FROM decks
WHERE kcnov22.deck = decks.deck;
SELECT DISTINCT deck FROM kcnov22 WHERE deck_id IS NULL;
COMMIT;
--ROLLBACK;
/*
borrar los ft :P
*/
-- Héroe Herido
BEGIN;
UPDATE kcnov22 
SET deck = 'Heros' 
WHERE deck = 'Wounded Heros';
SELECT id, deck, skill FROM kcnov22 WHERE deck = 'Heros';
COMMIT;
--ROLLBACK;
UPDATE kcnov22 SET deck = 'Burning Abyss' WHERE deck = 'Burning Abyss Infernoid';
--
UPDATE kcnov22 SET deck = 'Rose Dragon' WHERE deck = 'Rose Dragon Mekk-Knights';
--
SELECT * FROM decks WHERE deck LIKE '%alam%'
UPDATE kcnov22 SET deck = 'Salamangreat' WHERE deck = 'Salamangreat Mekk-Knights';
-- No había para agregar mazos nuevos
-- Establecer los valores de skill_id
BEGIN;
UPDATE kcnov22
SET skill_id = skills.skill_id
FROM skills
WHERE kcnov22.skill = skills.skill;
SELECT DISTINCT skill FROM kcnov22 WHERE skill_id IS NULL;
COMMIT;
--ROLLBACK;
-- No hay skills nuevas que agregar
/*
Ahora automatizar :P y que solo se quede los ids de skills y decks
*/
SELECT * FROM kcnov22;
BEGIN;
ALTER TABLE kcnov22 DROP COLUMN deck, DROP COLUMN skill;
SELECT * FROM kcnov22;
COMMIT;
/*
Crear llaves foráneas
*/
BEGIN;
ALTER TABLE kcnov22
ADD CONSTRAINT fk_kcnov22_deck_id
FOREIGN KEY (deck_id)
REFERENCES decks (deck_id);
COMMIT;
--
BEGIN;
ALTER TABLE kcnov22
ADD CONSTRAINT fk_kcnov22_skill_id
FOREIGN KEY (skill_id)
REFERENCES skills (skill_id);
COMMIT;
--