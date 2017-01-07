-- ----------------------------------------------------------------------------
--	Criação do banco de dados para análise do Dólar 
--		BD: bolsa		
-- Entrar no banco de dados através do psql -> psql 
                                        --username=rodolpho --dbname=bolsa
-- Entrar no banco de dados -> psql --host='localhost' 
                                        --username='rodolpho' --dbname='bolsa'
-- Rodar o script via psql -> psql --username=postgres --password 
                                        --file=criar_banco_bovespa.sql 
-- Ou dentro do psql digitar -> \i /path/script.sql -- importar script.sql
--
-- Deletar todas as tabelas (para desenvolvimento) drop schema bovespa cascade;
-- ----------------------------------------------------------------------------


-- Criando schema para os dados do times and trades
create schema dolar;
set search_path to dolar;

-- Deletar todas as tabelas do schema bovespa
-- FIXME: drop schema dolar cascade;


-- Times & Trades - Aba Negocios - Profit
CREATE TABLE negocios(
DATA        DATE            NOT NULL,
HORA        TIMESTAMP       NOT NULL,
VALOR       NUMERIC(7,2)    NOT NULL,
QUANTIDADE  INTEGER         NOT NULL,
COMPRADOR   VARCHAR(50)     NOT NULL,
VENDEDOR    VARCHAR(50)     NOT NULL,
AGRESSOR    VARCHAR(50)     NOT NULL);


-- Times & Trades - Aba Orderm Original - Profit
CREATE TABLE ordemoriginal(
DATA        DATE            NOT NULL,
HORA        TIMESTAMP       NOT NULL,
VALOR       NUMERIC(7,2)    NOT NULL,
QUANTIDADE  INTEGER         NOT NULL,
COMPRADOR   VARCHAR(50),
VENDEDOR    VARCHAR(50),
AGRESSOR    VARCHAR(50)     NOT NULL);


-- Contratos em Abertos - Dados da BM&F 
-- http://www.bmfbovespa.com.br/pt_br/servicos/market-data/consultas/
--                              mercado-de-derivativos/
--                              contratos-em-aberto/
--                              por-tipo-de-participante/
CREATE TABLE contratosAbertos(
DATA                DATE            NOT NULL,
CONTRATO            VARCHAR(200)    NOT NULL,
PLAYER              VARCHAR(200)    NOT NULL,
COMPRA_CONTR        INTEGER,
COMPRA_PERCT        NUMERIC(6,2),
VENDA_CONTR         INTEGER,
VENDA_PERCT         NUMERIC(6,2),
PRIMARY KEY (DATA, CONTRATO, PLAYER));

-- Contratos em Abertos - Dados da BM&F - Futuro
-- http://www.bmfbovespa.com.br/pt_br/servicos/market-data/consultas/
--                              mercado-de-derivativos/contratos-em-aberto/
--                              vencimento-serie/contratos-em-aberto-futuro/
CREATE TABLE contratosAbertosFuturos(
DATA                DATE            NOT NULL,
MERCADORIA          VARCHAR(200)    NOT NULL,
PRAZO_VCTO          VARCHAR(30)     NOT NULL,
EM_ABERTO           INTEGER,
VAR_QTD             INTEGER,
PRIMARY KEY (DATA, MERCADORIA, PRAZO_VCTO));


-- Times & Trades - Aba Comprados - Profit
CREATE TABLE POSICAO_COMPRADOS(
DATA            DATE            NOT NULL,
CORRETORA       VARCHAR(100)    NOT NULL,
PERCENTUAL      NUMERIC(5,2),
VOL_FINANCEIRO  NUMERIC(17,2),
VOL_QUANTIDADE  INTEGER,
MEDIO           NUMERIC(10,2),
PRIMARY KEY(DATA, CORRETORA));

-- Times & Trades - Aba Vendidos - Profit
CREATE TABLE POSICAO_VENDIDOS(
DATA            DATE            NOT NULL,
CORRETORA       VARCHAR(100)    NOT NULL,
PERCENTUAL      NUMERIC(5,2),
VOL_FINANCEIRO  NUMERIC(17,2),
VOL_QUANTIDADE  INTEGER,
MEDIO           NUMERIC(10,2),
PRIMARY KEY(DATA, CORRETORA));


