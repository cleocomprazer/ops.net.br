--ALTER TABLE fornecedores
--MODIFY COLUMN Complemento VARCHAR(500) NULL DEFAULT NULL;

--ALTER TABLE fornecedores
--ADD COLUMN Email VARCHAR(255) NULL,
--ADD COLUMN Telefone VARCHAR(255) NULL,
--ADD COLUMN EnteFederativoResponsavel VARCHAR(500) NULL
--ADD COLUMN CapitalSocial VARCHAR(100) NULL;

--CREATE TABLE fornecedorquadrosocietario
--(
--	txtCNPJCPF		VARCHAR(14) NULL,
--	Nome 			VARCHAR(255) NULL,
--	Qualificacao 	VARCHAR(255) NULL
--);

--CREATE INDEX `idx_FornecedorQuadroSocietario_txtCNPJCPF`  ON `fornecedorquadrosocietario` (txtCNPJCPF) COMMENT '' ALGORITHM DEFAULT LOCK DEFAULT

--CREATE TABLE comandosql(
--	IdComandoSql INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--	Nome VARCHAR(100),
--	Descricao VARCHAR(8000),
--	ComandoSQL  VARCHAR(8000),
--	Grupo TINYINT,
--	Ordem TINYINT
--);

--INSERT INTO comandosql (Nome, ComandoSQL, Grupo, Ordem) VALUES ('Denúncias Enviadas', 'SELECT COUNT(*) FROM denuncias', 1, 1);
--INSERT INTO comandosql (Nome, ComandoSQL, Grupo, Ordem) VALUES ('Fornecedores Suspeitos', 'SELECT COUNT(DISTINCT txtCNPJCPF) FROM denuncias WHERE Situacao = ''D''', 1, 2);
--INSERT INTO comandosql (Nome, ComandoSQL, Grupo, Ordem) VALUES ('Parlamentares Atingidos', 'SELECT COUNT(DISTINCT txNomeParlamentar) FROM lancamentos L, denuncias D WHERE L.txtCNPJCPF = D.txtCNPJCPF AND D.Situacao = ''D''', 1, 3);

--alter table lancamentos MODIFY column `txtBeneficiario` varchar(255)
--alter table lancamentos_tmp MODIFY column `txtBeneficiario` varchar(255)

--ALTER TABLE lancamentos CHANGE ide_documento_fiscal ideDocumento  varchar(20)
--ALTER TABLE lancamentos_tmp CHANGE ide_documento_fiscal ideDocumento  varchar(20)

--update parametros set ultima_atualizacao = '2016-03-06'

--UPDATE lancamentos AS l
--INNER JOIN lancamentos_tmp AS lt ON 
--    l.`txtCNPJCPF` = lt.`txtCNPJCPF` and 
--    l.`txtNumero` = lt.`txtNumero`
--SET 
--	l.`ideDocumento` = lt.`ideDocumento`
--where l.`txtNumero` <> ''
--and l.`ideDocumento` <> ''  
    
--CREATE INDEX `idx_lancamentos_txtCNPJCPF_txtNumero`  ON `auditoria`.`lancamentos` (txtCNPJCPF, txtNumero) COMMENT '' ALGORITHM DEFAULT LOCK DEFAULT

--CREATE INDEX `idx_lancamentos_tmp_txtCNPJCPF_txtNumero`  ON `auditoria`.`lancamentos_tmp` (txtCNPJCPF, txtNumero) COMMENT '' ALGORITHM DEFAULT LOCK DEFAULT

ALTER TABLE fornecedorquadrosocietario
ADD COLUMN NomeRepresentanteLegal VARCHAR(255) NULL,
ADD COLUMN QualificacaoRepresentanteLegal VARCHAR(255) NULL