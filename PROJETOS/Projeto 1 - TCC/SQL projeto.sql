-- CRIAÇÃO DA DATABASE
CREATE DATABASE PESQUISA;
GO

USE PESQUISA;
GO

-- CRIAÇÃO DA TABELA
CREATE TABLE DADOS(
	IDRESPOSTA INT IDENTITY,
	DATA_HORA VARCHAR(50) NOT NULL,
	FUNCAO_EXERCIDA VARCHAR(50) NOT NULL,
	PORTE_EMPRESA VARCHAR(50) NOT NULL,
	TEMPO_EMPRESA VARCHAR(50) NOT NULL,
	TEMPO_CARGO VARCHAR(50) NOT NULL,
	ESCOLARIDADE VARCHAR(50) NOT NULL,
	FAIXA_ETARIA VARCHAR(50) NOT NULL,
	GENERO VARCHAR(50) NOT NULL,
	PRE_1SUP NUMERIC,
	PRE_2COM NUMERIC,
	PRE_3COO NUMERIC,
	PRE_4OBJ NUMERIC,
	PRE_5GES NUMERIC,
	PRE_6GES NUMERIC,
	PRE_7PRE NUMERIC,
	PRE_8SEL NUMERIC,
	PRE_9ANA NUMERIC,
	PRE_10TRE NUMERIC,
	PRE_11EST NUMERIC,
	PRE_12CUS NUMERIC,
	PRE_13GES NUMERIC,
	PRE_14GES NUMERIC,
	PRE_15USO NUMERIC,
	EXE_1SUP NUMERIC,
	EXE_2COM NUMERIC,
	EXE_3COO NUMERIC,
	EXE_4OBJ NUMERIC,
	EXE_5GES NUMERIC,
	EXE_6GES NUMERIC,
	EXE_7PRE NUMERIC,
	EXE_8SEL NUMERIC,
	EXE_9ANA NUMERIC,
	EXE_10TRE NUMERIC,
	EXE_11EST NUMERIC,
	EXE_12CUS NUMERIC,
	EXE_13GES NUMERIC,
	EXE_14GES NUMERIC,
	EXE_15USO NUMERIC,
	POS_1SUP NUMERIC,
	POS_2COM NUMERIC,
	POS_3COO NUMERIC,
	POS_4OBJ NUMERIC,
	POS_5GES NUMERIC,
	POS_6GES NUMERIC,
	POS_7PRE NUMERIC,
	POS_8SEL NUMERIC,
	POS_9ANA NUMERIC,
	POS_10TRE NUMERIC,
	POS_11EST NUMERIC,
	POS_12CUS NUMERIC,
	POS_13GES NUMERIC,
	POS_14GES NUMERIC,
	POS_15USO NUMERIC,
	PRIMARY KEY(IDRESPOSTA)
);
GO

-- IMPORTAÇÃO DOS DADOS DA PLANILHA CSV
BULK INSERT DADOS
FROM 'C:\SOFTWARES\Importações\FATORES DE SUCESSO EM PROJETOS DE IMPLANTAÇÃO DE SISTEMAS ERP (respostas).csv'
WITH (
	FIRSTROW = 2,
	KEEPIDENTITY,
	CODEPAGE = '65001',
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '0x0a'
);
GO

SELECT *
FROM DADOS;
GO

-- ALTERANDO TIPO DAS COLUNAS PARA NUMERIC, DEVIDO AOS CALCULOS PRECISAREM SER EXATOS E SEM ARREDONDAMENTO
-- COMPENSA DROPAR A TABELA E CRIAR NOVAMENTE
ALTER TABLE DADOS
ALTER COLUMN PRE_1SUP NUMERIC;

-- CALCULANDO AS VARIAVEIS DA PESQUISA
SELECT --Suporte da Alta Gerencia
	COUNT(ID_RESPOSTA) AS "QTD",
	SUM(PRE_1SUP) AS "TOTAL",
	AVG(PRE_1SUP) AS "MÉDIA",
	MAX(PRE_1SUP) AS "MAXIMO",
	MIN(PRE_1SUP) AS "MINIMO",
	MAX(PRE_1SUP) - MIN(PRE_1SUP) AS "AMPLITUDE",
	ROUND(VAR(PRE_1SUP),4) AS "VARIANCIA",
	ROUND(STDEV(PRE_1SUP),4) AS "DV PADRÃO",
	ROUND(((STDEV(PRE_1SUP) / AVG(PRE_1SUP)) * 100),4) AS "COEF. VARIANCIA",
	(SELECT DISTINCT
	PERCENTILE_CONT(0.50)
		WITHIN GROUP(ORDER BY PRE_1SUP)
		OVER() AS MEDIANA
	FROM PREIMPLANTACAO) AS MEDIANA
FROM PREIMPLANTACAO;
GO


--CRIANDO QUERRY DA MEDIANA
SELECT DISTINCT
		PERCENTILE_CONT(0.50)
			WITHIN GROUP(ORDER BY PRE_1SUP)
			OVER() AS MEDIANA
FROM PREIMPLANTACAO


--CRIANDO QUERRY DA MODA
--NAO É POSSÍVEL CRIAR NA MESMA QUERY DEVIDO A FUNÇÕES DIFERENTES
--UNION/UNION ALL NÃO FUNCIONAM PARA WITH E SELECT **NAO ENCONTREI SOLUÇAO, MAS É PÓSSÍVEL CRIAR VIEWS PRA ISSO
WITH FREQ_MODA_CTE AS(
	SELECT PRE_1SUP, COUNT(PRE_1SUP) AS FREQUENCIA
	FROM PREIMPLANTACAO
	GROUP BY PRE_1SUP)
SELECT * FROM FREQ_MODA_CTE
	WHERE FREQUENCIA = (SELECT MAX(FREQUENCIA)
	FROM FREQ_MODA_CTE)
GO




"QUANTIDADE" OK
"TOTAL" OK
"MEDIA" OK
"MAXIMO" OK
"MINIMO" OK
"AMPLIT. TOTAL" OK
"VARIANCIA" OK
"DESV. PADRAO" OK
"COEF. VARIACAO PEARSON" OK
"MODA" OK
"MEDIANA" OK

"QUARTIS Q1-25%, Q2-50% E Q3-75%"
"PERCENTIS P1-25%, P2-50% E P3-75%"
"TIPO DE ASSIMETRIA"
"CURTOSE"
"TIPO DE CURVA"