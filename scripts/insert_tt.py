#!/usr/bin/python
# -*- coding: UTF-8 -*-

#------------------------------------------------------------------------------
# Inserir os dados do Times & Trades - Aba negocios
#
#------------------------------------------------------------------------------
# Importação das Bibliotecas
import psycopg2
import sys
import csv

#------------------------------------------------------------------------------
# Abrindo conexão com o banco de dados
con = psycopg2.connect( host='localhost',
                        user='rodolpho',
                        password='macav810',
                        dbname='bolsa')
c = con.cursor()


# Acessando o schema
c.execute('SET SEARCH_PATH TO dolar')
con.commit()


#------------------------------------------------------------------------------
# Lendo o CSV






    #--------------------------------------------------------------------------
    # Inserindo no banco de dados
    c.execute('''  INSERT INTO negocios
                VALUES ('%s', '%s', %s, %s,
                            '%s', '%s', '%s') '''
            %(data, hora, valor, quantidade, comprador, vendedor, agressor))

    # Pesistindo dados no BD
    con.commit()

