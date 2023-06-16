import logging
from decouple import config
from sqlalchemy import create_engine as ce, MetaData as md


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
	else:
		cursor.execute('SELECT current_database()')
		database = cursor.fetchone()
		logging.info("Base de Datos: {}".format(database))


def show_tables():
	conn = pg_engine.connect()
	metadata = md()
	metadata.reflect(bind=conn)
	table_names = metadata.sorted_tables
	for sheet in table_names:
		logging.info(sheet.name)
	conn.close()


def turn_off_engine():
	pg_engine.dispose()
	logging.info("La conexión ha finalizado.")


if __name__ == '__main__':
	logging.info("Estoy arrancando...")