import logging
from decouple import config
from datetime import datetime
from sqlalchemy import create_engine as ce


logging.basicConfig(
    format = '%(asctime)-5s %(levelname)-8s %(message)s', 
    level=logging.INFO,  
    encoding="utf-8"
)

pg_engine = ce(config('ENGINE_PSQL'))

def connection_psql():
	try:
		connection = pg_engine.raw_connection()
		logging.info("Conexión exitosa.")
		cursor = connection.cursor()
		cursor.execute("SELECT version()")
		row = cursor.fetchone()
		logging.info("Versión del servidor de PostgreSQL: {}".format(row))
	except Exception as ex:
		logging.error("Error durante la conexión: {}".format(ex))


def turn_off_engine():
	pg_engine.dispose()
	logging.info("La conexión ha finalizado.")