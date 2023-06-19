import logging
import os
import pyprojroot
import pandas as pd

logging.basicConfig(
    format = '%(message)s', 
    level=logging.INFO,  
    encoding="utf-8"
    )

'''
	Este lo trabajé en google sheets así lo descargo
	para ponerlo en la base de datos
'''

directorio = pyprojroot.here('data')
os.chdir(str(directorio))


df = pd.read_csv(
'https://docs.google.com/spreadsheets/d/1LAAq6NL_ZfiDYpMKH9OBd3Uyv_mVeUGuELF5xYs7xsM/export?format=csv', dtype={'usuario': str}, parse_dates=['ndmax'])

df = df.drop('registro', axis=1)

df.to_csv('qualifier_wcs_23.csv', index=False)
logging.info('Archivo creado')