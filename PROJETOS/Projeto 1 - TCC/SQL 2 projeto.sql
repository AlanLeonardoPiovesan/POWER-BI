-- ORGANIZANDO OS DADOS EM TABELAS DIFERENTES PARA PODER CALCULAR AS VARIÁVEIS
CREATE TABLE PREIMPLANTACAO(
	ID_RESPOSTA INT IDENTITY,
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
	PRE_15USO NUMERIC
);
GO

-- DEFININDO AS FOREIGNS KEYS
ALTER TABLE PREIMPLANTACAO
ADD CONSTRAINT FK_PREIMPLANTACAO_IDCLIENTE
FOREIGN KEY(ID_RESPOSTA) REFERENCES DADOS(IDRESPOSTA)
GO

CREATE TABLE EXECUCAOIMPLANTACAO(
	ID_RESPOSTA INT IDENTITY,
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
	EXE_15USO NUMERIC
);
GO

ALTER TABLE EXECUCAOIMPLANTACAO
ADD CONSTRAINT FK_EXECUCAOIMPLANTACAO_IDCLIENTE
FOREIGN KEY(ID_RESPOSTA) REFERENCES DADOS(IDRESPOSTA)
GO

CREATE TABLE POSIMPLANTACAO(
	ID_RESPOSTA INT IDENTITY,
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
	POS_15USO NUMERIC
);
GO

ALTER TABLE POSIMPLANTACAO
ADD CONSTRAINT FK_POSIMPLANTACAO_IDCLIENTE
FOREIGN KEY(ID_RESPOSTA) REFERENCES DADOS(IDRESPOSTA)
GO

-- CONSULTA DOS DADOS PARA INSERÇÃO PRE IMPLANTACAO
SELECT 
	IDRESPOSTA, 
	PRE_1SUP, 
	PRE_2COM, 
	PRE_3COO, 
	PRE_4OBJ, 
	PRE_5GES, 
	PRE_6GES, 
	PRE_7PRE, 
	PRE_8SEL, 
	PRE_9ANA, 
	PRE_10TRE, 
	PRE_11EST, 
	PRE_12CUS, 
	PRE_13GES, 
	PRE_14GES, 
	PRE_15USO 
FROM DADOS
GO

-- NECESSÁRIO PARA GERAR O ID CORRETAMENTE
SET IDENTITY_INSERT PREIMPLANTACAO ON
GO

INSERT INTO PREIMPLANTACAO 
WITH(TABLOCK)
(	ID_RESPOSTA, 
	PRE_1SUP, 
	PRE_2COM, 
	PRE_3COO, 
	PRE_4OBJ, 
	PRE_5GES, 
	PRE_6GES, 
	PRE_7PRE, 
	PRE_8SEL, 
	PRE_9ANA, 
	PRE_10TRE, 
	PRE_11EST, 
	PRE_12CUS, 
	PRE_13GES, 
	PRE_14GES, 
	PRE_15USO)
SELECT IDRESPOSTA, 
	PRE_1SUP, 
	PRE_2COM, 
	PRE_3COO, 
	PRE_4OBJ, 
	PRE_5GES, 
	PRE_6GES, 
	PRE_7PRE, 
	PRE_8SEL, 
	PRE_9ANA, 
	PRE_10TRE, 
	PRE_11EST, 
	PRE_12CUS, 
	PRE_13GES, 
	PRE_14GES, 
	PRE_15USO 
	FROM DADOS;
GO

-- NECESSÁRIO PARA GERAR O ID CORRETAMENTE
SET IDENTITY_INSERT PREIMPLANTACAO OFF
GO

SET IDENTITY_INSERT EXECUCAOIMPLANTACAO ON
GO

INSERT INTO EXECUCAOIMPLANTACAO 
WITH(TABLOCK)
(	ID_RESPOSTA, 
	EXE_1SUP, 
	EXE_2COM, 
	EXE_3COO, 
	EXE_4OBJ, 
	EXE_5GES, 
	EXE_6GES, 
	EXE_7PRE, 
	EXE_8SEL, 
	EXE_9ANA, 
	EXE_10TRE, 
	EXE_11EST, 
	EXE_12CUS, 
	EXE_13GES, 
	EXE_14GES, 
	EXE_15USO)
SELECT IDRESPOSTA, 
	EXE_1SUP, 
	EXE_2COM, 
	EXE_3COO, 
	EXE_4OBJ, 
	EXE_5GES, 
	EXE_6GES, 
	EXE_7PRE, 
	EXE_8SEL, 
	EXE_9ANA, 
	EXE_10TRE, 
	EXE_11EST, 
	EXE_12CUS, 
	EXE_13GES, 
	EXE_14GES, 
	EXE_15USO 
	FROM DADOS;
GO

-- NECESSÁRIO PARA GERAR O ID CORRETAMENTE
SET IDENTITY_INSERT EXECUCAOIMPLANTACAO OFF
GO

SET IDENTITY_INSERT POSIMPLANTACAO ON
GO

INSERT INTO POSIMPLANTACAO 
WITH(TABLOCK)
(	ID_RESPOSTA, 
	POS_1SUP, 
	POS_2COM, 
	POS_3COO, 
	POS_4OBJ, 
	POS_5GES, 
	POS_6GES, 
	POS_7PRE, 
	POS_8SEL, 
	POS_9ANA, 
	POS_10TRE, 
	POS_11EST, 
	POS_12CUS, 
	POS_13GES, 
	POS_14GES, 
	POS_15USO)
SELECT IDRESPOSTA, 
	POS_1SUP, 
	POS_2COM, 
	POS_3COO, 
	POS_4OBJ, 
	POS_5GES, 
	POS_6GES, 
	POS_7PRE, 
	POS_8SEL, 
	POS_9ANA, 
	POS_10TRE, 
	POS_11EST, 
	POS_12CUS, 
	POS_13GES, 
	POS_14GES, 
	POS_15USO 
	FROM DADOS;
GO

-- CORRIGINDO A TABELA DADOS
ALTER TABLE DADOS
DROP COLUMN PRE_1, PRE_2COM, PRE_3COO, PRE_4OBJ, PRE_5GES, PRE_6GES, PRE_7PRE, PRE_8SEL, PRE_9ANA, PRE_10TRE, PRE_11EST, PRE_12CUS, PRE_13GES, PRE_14GES, PRE_15USO
GO

ALTER TABLE DADOS
DROP COLUMN EXE_1SUP, EXE_2COM, EXE_3COO, EXE_4OBJ, EXE_5GES, EXE_6GES, EXE_7PRE, EXE_8SEL, EXE_9ANA, EXE_10TRE, EXE_11EST, EXE_12CUS, EXE_13GES, EXE_14GES, EXE_15USO
GO

ALTER TABLE DADOS
DROP COLUMN POS_1SUP, POS_2COM, POS_3COO, POS_4OBJ, POS_5GES, POS_6GES, POS_7PRE, POS_8SEL, POS_9ANA, POS_10TRE, POS_11EST, POS_12CUS, POS_13GES, POS_14GES, POS_15USO
GO