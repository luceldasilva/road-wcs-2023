/*
	Primer caso de nick actualizado en Discord
	no tiene número y tenía que buscarlo XD
*/
--
SELECT s.id, s.usuario, s.ndmax, d.deck
FROM kcapril23 s
INNER JOIN decks d
ON s.deck_id = d.deck_id
WHERE d.deck = 'Elemental Heros'
AND s.ndmax = '2023-04-07';
--
SELECT s.id, s.usuario, s.ndmax, d.deck
FROM kcsep22 s
INNER JOIN decks d
ON s.deck_id = d.deck_id
WHERE d.deck LIKE '%yn%'
AND s.ndmax = '2022-09-12';