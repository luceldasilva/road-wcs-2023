/*
	Agregar ceros a la izquierda para unificar
*/
BEGIN;
UPDATE kcsep22 SET usuario = LPAD(usuario::text, 4, '0');
SELECT usuario FROM kcsep22;
COMMIT;
--La tabla kcnov22 ya tiene los ceros
BEGIN;
UPDATE kcfeb23 SET usuario = LPAD(usuario::text, 4, '0');
SELECT usuario FROM kcfeb23;
COMMIT;
--ROLLBACK;
BEGIN;
UPDATE kcapril23 SET usuario = LPAD(usuario::text, 4, '0');
SELECT usuario FROM kcapril23;
COMMIT;
--