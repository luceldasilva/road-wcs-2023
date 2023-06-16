/*
	Fe de errata tenía corrección de decks y skills duplicados y mal escrito
*/
-- Buscando la errata
SELECT * FROM decks WHERE deck LIKE '%ry%';
-- cambiar el 114 y ponerle otro deck
SELECT * FROM kcsep22 WHERE deck_id = 114;
BEGIN;
UPDATE kcsep22 set deck_id = 38 where id = 196;
SELECT s.id, s.usuario, s.ndmax, d.deck
FROM kcsep22 s
INNER JOIN decks d
ON s.deck_id = d.deck_id
WHERE s.id = 196;
COMMIT;
-- Poner Magistus
BEGIN;
UPDATE decks set deck = 'Magistus' where deck_id = 114;
SELECT * FROM decks WHERE deck_id = 114;
COMMIT;
-- Errata de Timerlod debe ser Timelord :(
SELECT * FROM decks WHERE deck LIKE '%lod%';
SELECT * FROM decks WHERE deck LIKE '%imel%';
SELECT * FROM kcapril23 WHERE deck_id = 104;
-- Actualizar 104 a Raidraptor
BEGIN;
UPDATE decks set deck = 'Raidraptor' where deck_id = 104;
SELECT * FROM decks WHERE deck_id = 104;
COMMIT;
--
BEGIN;
UPDATE kcapril23 set deck_id = 89 where id = 359;
SELECT ap.id, ap.usuario, ap.ndmax, d.deck
FROM kcapril23 ap
INNER JOIN decks d
ON ap.deck_id = d.deck_id
WHERE ap.id = 359;
COMMIT;
-- Borrar ladys
SELECT * FROM decks WHERE deck LIKE '%ady%';
SELECT * FROM kcsep22 WHERE deck_id = 116;
-- Poner Ritual Beats
SELECT * FROM decks WHERE deck LIKE '%eat%';
BEGIN;
UPDATE decks set deck = 'Ritual Beats' where deck_id = 116;
SELECT * FROM decks WHERE deck_id = 116;
COMMIT;
--
BEGIN;
UPDATE kcsep22 set deck_id = 43 where id = 281;
SELECT s.id, s.usuario, s.ndmax, d.deck
FROM kcsep22 s
INNER JOIN decks d
ON s.deck_id = d.deck_id
WHERE s.id = 281;
COMMIT;
-- Hay huevo en vez de hueco
SELECT * FROM skills WHERE skill LIKE '%antasma Hue%';
-- 74 hueco 131 huevo
SELECT ap.usuario, s.skill FROM kcapril23 ap
INNER JOIN kcsep22 sep ON ap.skill_id = sep.skill_id
INNER JOIN kcnov22 nov ON ap.skill_id = nov.skill_id
INNER JOIN kcfeb23 feb ON ap.skill_id = feb.skill_id
INNER JOIN skills s ON ap.skill_id = s.skill_id
WHERE ap.skill_id = 131;
-- No encontré respuesta :'v entonces solo actualizaré skill
BEGIN;
UPDATE skills set skill = 'Cristales Trascendentes' where skill_id = 131;
SELECT * FROM skills WHERE skill_id = 131;
COMMIT;
--