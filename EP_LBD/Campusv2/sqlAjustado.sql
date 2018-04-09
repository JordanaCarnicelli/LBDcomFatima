-- -----------------------------------------------------
-- Table caravana
-- -----------------------------------------------------
CREATE TABLE caravana (
  id_caravana INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  cidade_origem VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_caravana));


-- -----------------------------------------------------
-- Table endereco
-- -----------------------------------------------------
CREATE TABLE endereco (
  id_endereco INT NOT NULL,
  estado VARCHAR(45) NOT NULL,
  cidade VARCHAR(100) NOT NULL,
  bairro VARCHAR(100) NOT NULL,
  rua VARCHAR(100) NOT NULL,
  numero VARCHAR(45) NOT NULL,
  complemento VARCHAR(100) NULL,
  cep VARCHAR(8) NOT NULL,
  PRIMARY KEY (id_endereco));

-- -----------------------------------------------------
-- Table participante
-- -----------------------------------------------------
CREATE TABLE participante (
  cpf CHAR(11) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  data_nasc DATE NOT NULL,
  genero CHAR(1) NOT NULL,
  ocupacao VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  categoria VARCHAR(100) NOT NULL,
  id_caravana INT NULL,
  id_endereco INT NULL,
  PRIMARY KEY (cpf),
  CONSTRAINT fk_participante_caravana
    FOREIGN KEY (id_caravana)
    REFERENCES caravana (id_caravana)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT fk_endereco
    FOREIGN KEY (id_endereco)
    REFERENCES endereco (id_endereco)
    ON DELETE SET NULL
    ON UPDATE CASCADE)

-- -----------------------------------------------------
-- Table barraca
-- -----------------------------------------------------
CREATE TABLE barraca (
  id_barraca INT NOT NULL,
  cpf CHAR(11) NOT NULL,
  modelo VARCHAR(45) NOT NULL,
  marca VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_barraca),
  CONSTRAINT fk_barraca_participante
    FOREIGN KEY (cpf)
    REFERENCES participante (cpf)
    ON DELETE SET NULL
    ON UPDATE CASCADE)

-- -----------------------------------------------------
-- Table participante_isento
-- -----------------------------------------------------
CREATE TABLE participante_isento (
  cpf CHAR(11) NOT NULL,
  tipo_participante VARCHAR(45) NOT NULL,
  PRIMARY KEY (cpf),
  CONSTRAINT fk_participante_isento
    FOREIGN KEY (cpf)
    REFERENCES participante (cpf)
    ON DELETE CASCADE
    ON UPDATE CASCADE)

-- -----------------------------------------------------
-- Table participante_pagante
-- -----------------------------------------------------
CREATE TABLE participante_pagante (
  cpf CHAR(11) NOT NULL,
  valor_inscricao DOUBLE NOT NULL,
  PRIMARY KEY (cpf),
  CONSTRAINT fk_participante_pagante
    FOREIGN KEY (cpf)
    REFERENCES participante (cpf)
    ON DELETE CASCADE
    ON UPDATE CASCADE)

-- -----------------------------------------------------
-- Table onibus
-- -----------------------------------------------------
CREATE TABLE onibus (
  id_caravana INT NOT NULL,
  num_onibus INT NOT NULL,
  tipo_onibus VARCHAR(100) NOT NULL,
  capacidade INT NOT NULL,
  PRIMARY KEY (num_onibus, id_caravana),
  CONSTRAINT fk_onibus_caravana
    FOREIGN KEY (id_caravana)
    REFERENCES caravana (id_caravana)
    ON DELETE CASCADE
    ON UPDATE CASCADE)

-- -----------------------------------------------------
-- Table expositor
-- -----------------------------------------------------
CREATE TABLE expositor (
  cpf CHAR(11) NOT NULL,
  nome_expo VARCHAR(45) NOT NULL,
  tema_expo VARCHAR(45) NOT NULL,
  PRIMARY KEY (cpf),
  CONSTRAINT fk_expositor_participante
    FOREIGN KEY (cpf)
    REFERENCES participante_isento (cpf)
    ON DELETE CASCADE
    ON UPDATE CASCADE)

-- -----------------------------------------------------
-- Table produto
-- -----------------------------------------------------
CREATE TABLE produto (
  id_produto INT NOT NULL,
  cpf CHAR(11) NOT NULL,
  nome_produto VARCHAR(45) NOT NULL,
  descricao_produto VARCHAR(250) NOT NULL,
  quantidade_estoque INT NOT NULL,
  preco DOUBLE NOT NULL,
  PRIMARY KEY (id_produto),
  CONSTRAINT fk_expositor_produto
    FOREIGN KEY (cpf)
    REFERENCES expositor (cpf)
    ON DELETE CASCADE
    ON UPDATE CASCADE)

-- -----------------------------------------------------
-- Table jornalista
-- -----------------------------------------------------
CREATE TABLE jornalista (
  cpf CHAR(11) NOT NULL,
  credencial INT NOT NULL,
  area_atuacao VARCHAR(100) NOT NULL,
  PRIMARY KEY (cpf),
  CONSTRAINT fk_participante_jornalista
    FOREIGN KEY (cpf)
    REFERENCES participante_isento (cpf)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

-- -----------------------------------------------------
-- Table materia
-- -----------------------------------------------------
CREATE TABLE materia (
  id_materia INT NOT NULL,
  cpf CHAR(11) NOT NULL,
  titulo_materia VARCHAR(45) NOT NULL,
  assunto_materia VARCHAR(100) NOT NULL,
  data DATE NOT NULL,
  PRIMARY KEY (id_materia),
  CONSTRAINT fk_jornalista_materia
    FOREIGN KEY (cpf)
    REFERENCES jornalista (cpf)
    ON DELETE CASCADE
    ON UPDATE CASCADE)

-- -----------------------------------------------------
-- Table categoria_veiculo
-- -----------------------------------------------------
CREATE TABLE categoria_veiculo (
  id_categoria_veiculo INT NOT NULL,
  desc_categoria_veiculol VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_categoria_veiculo))

-- -----------------------------------------------------
-- Table veiculo_comunicacao
-- -----------------------------------------------------
CREATE TABLE veiculo_comunicacao (
  id_veiculo INT NOT NULL,
  id_categoria_veiculo INT NULL,
  nome_veiculo VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_veiculo),
  CONSTRAINT fk_categoria_veiculo
    FOREIGN KEY (id_categoria_veiculo)
    REFERENCES categoria_veiculo (id_categoria_veiculo)
    ON DELETE SET NULL
    ON UPDATE CASCADE)

-- -----------------------------------------------------
-- Table jornalista_veiculo
-- -----------------------------------------------------
CREATE TABLE jornalista_veiculo (
  id_jornalista_veiculo INT NOT NULL,
  id_veiculo INT NOT NULL,
  cpf CHAR(11) NOT NULL,
  PRIMARY KEY (id_jornalista_veiculo),
  CONSTRAINT fk_veiculo_jornalista
    FOREIGN KEY (id_veiculo)
    REFERENCES veiculo_comunicacao (id_veiculo)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_jornalista_veiculo
    FOREIGN KEY (cpf)
    REFERENCES jornalista (cpf)
    ON DELETE CASCADE
    ON UPDATE CASCADE)

-- -----------------------------------------------------
-- Table painelista
-- -----------------------------------------------------
CREATE TABLE painelista (
  cpf CHAR(11) NOT NULL,
  area_atuacao VARCHAR(250) NOT NULL,
  PRIMARY KEY (cpf),
  CONSTRAINT fk_palestrante
    FOREIGN KEY (cpf)
    REFERENCES participante_isento (cpf)
    ON DELETE CASCADE
    ON UPDATE CASCADE)

-- -----------------------------------------------------
-- Table tema
-- -----------------------------------------------------
CREATE TABLE tema (
  id_tema INT NOT NULL,
  desc_tema VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_tema))

-- -----------------------------------------------------
-- Table atividade
-- -----------------------------------------------------
CREATE TABLE atividade (
  id_atividade INT NOT NULL,
  id_tema INT NULL,
  titulo VARCHAR(45) NOT NULL,
  tipo VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_atividade),
  CONSTRAINT fk_tema
    FOREIGN KEY (id_tema)
    REFERENCES tema (id_tema)
    ON DELETE SET NULL
    ON UPDATE CASCADE)

-- -----------------------------------------------------
-- Table participacao
-- -----------------------------------------------------
CREATE TABLE participacao (
  id_participacao INT NOT NULL,
  cpf CHAR(11) NOT NULL,
  id_atividade INT NOT NULL,
  PRIMARY KEY (id_participacao),
  CONSTRAINT fk_participante_atividade
    FOREIGN KEY (cpf)
    REFERENCES participante (cpf)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_atividade_participante
    FOREIGN KEY (id_atividade)
    REFERENCES atividade (id_atividade)
    ON DELETE CASCADE
    ON UPDATE CASCADE)

-- -----------------------------------------------------
-- Table painel
-- -----------------------------------------------------
CREATE TABLE painel (
  id_atividade INT NOT NULL,
  aberto_publico INT NOT NULL,
  PRIMARY KEY (id_atividade),
  CONSTRAINT fk_painel
    FOREIGN KEY (id_atividade)
    REFERENCES atividade (id_atividade)
    ON DELETE CASCADE
    ON UPDATE CASCADE)

-- -----------------------------------------------------
-- Table painelista_painel
-- -----------------------------------------------------
CREATE TABLE painelista_painel (
  id_painelista_painel INT NOT NULL,
  cpf CHAR(11) NOT NULL,
  id_atividade INT NOT NULL,
  presidente INT NOT NULL,
  PRIMARY KEY (id_painelista_painel),
  CONSTRAINT fk_painelista_painel
    FOREIGN KEY (cpf)
    REFERENCES painelista (cpf)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_painel_painelista
    FOREIGN KEY (id_atividade)
    REFERENCES painel (id_atividade)
    ON DELETE CASCADE
    ON UPDATE CASCADE)

-- -----------------------------------------------------
-- Table palestrante
-- -----------------------------------------------------
CREATE TABLE palestrante (
  cpf CHAR(11) NOT NULL,
  especializacao VARCHAR(100) NOT NULL,
  PRIMARY KEY (cpf),
  CONSTRAINT fk_palestrante
    FOREIGN KEY (cpf)
    REFERENCES participante_isento (cpf)
    ON DELETE CASCADE
    ON UPDATE CASCADE)

-- -----------------------------------------------------
-- Table palestra
-- -----------------------------------------------------
CREATE TABLE palestra (
  id_atividade INT NOT NULL,
  cpf CHAR(11) NOT NULL,
  data_palestra DATE NOT NULL,
  horario_palestra VARCHAR(5) NOT NULL,
  PRIMARY KEY (id_atividade),
  CONSTRAINT fk_palestra
    FOREIGN KEY (id_atividade)
    REFERENCES atividade (id_atividade)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_palestrante_palestra
    FOREIGN KEY (cpf)
    REFERENCES palestrante (cpf)
    ON DELETE CASCADE
    ON UPDATE CASCADE)