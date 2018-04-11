-- *********************************************
-- * Standard SQL generation                   
-- *--------------------------------------------
-- * DB-MAIN version: 10.0.3              
-- * Generator date: Aug 17 2017              
-- * Generation date: Mon Apr  9 22:06:31 2018 
-- * LUN file: C:\Users\Jordana Carnicelli\Pastas de compartilhamento\LBDcomFatima\EP_LBD\projeto_lbd_vf01.lun 
-- * Schema: MR/SQL 
-- ********************************************* 


-- Database Section
-- ________________ 

create database MR;


-- DBSpace Section
-- _______________


-- Tables Section
-- _____________ 

create table PALESTRA (
     id_palestra numeric not null,
     tema_palestra varchar(100) not null,
     data_palestra date not null,
     hora_inicio date not null,
     hora_termino date not null,
     descricao varchar(50),
     cpf varchar(11),
     constraint ID_PALESTRA_ID primary key (id_palestra));

INSERT INTO PALESTRA (id_palestra, tema_palestra, data_palestra, hora_inicio, hora_termino, descricao, cpf) VALUES (1, 'Como se tornar um ninja em banco de dados.', TO_DATE('10/01/2018', 'dd/mm/yyyy'), TO_DATE('10:00', 'HH24:MI'), TO_DATE('11:00', 'HH24:MI'), 'descricao da palestra banco de dados', '11111111111');
INSERT INTO PALESTRA (id_palestra, tema_palestra, data_palestra, hora_inicio, hora_termino, descricao, cpf) VALUES (2,'Belas Maldições: as preciosas profecias.',TO_DATE('10/01/2018', 'dd/mm/yyyy'),TO_DATE('11:00', 'HH24:MI'),TO_DATE('12:00', 'HH24:MI'), 'muitas profecias serao realizadas hoje', '22222222222');
INSERT INTO PALESTRA (id_palestra, tema_palestra, data_palestra, hora_inicio, hora_termino, descricao, cpf) VALUES (3, 'Cavaleiros dos Horóscopos: fazendo seu próprio mapa astral como um cavaleiro.',TO_DATE('10/01/2018', 'dd/mm/yyyy'),TO_DATE('14:00', 'HH24:MI'),TO_DATE('15:00', 'HH24:MI'), 'a culpa é sempre do seu signo', '33333333333');
INSERT INTO PALESTRA (id_palestra, tema_palestra, data_palestra, hora_inicio, hora_termino, descricao, cpf) VALUES (4, 'Caso ou compro um playstation 4?',TO_DATE('11/01/2018', 'dd/mm/yyyy'),TO_DATE('10:00', 'HH24:MI'),TO_DATE('11:30', 'HH24:MI'),null,'44444444444');
INSERT INTO PALESTRA (id_palestra, tema_palestra, data_palestra, hora_inicio, hora_termino, descricao, cpf) VALUES (5, 'Subindo escadas enquanto masca chiclete: desenvolvendo habilidades motoras.',TO_DATE('11/01/2018', 'dd/mm/yyyy'),TO_DATE('11:30', 'HH24:MI'),TO_DATE('12:30', 'HH24:MI'), 'isso mesmo que você entendeu','55555555555');


create table PAINEL (
     id_painel numeric not null,
     tema_painel varchar(100) not null,
     data_painel date not null,
     descricao varchar(100),
     aberto_publico char not null,
     constraint ID_PAINEL_ID primary key (id_painel));

INSERT INTO PAINEL (id_painel, tema_painel, data_painel, descricao, aberto_publico) VALUES (1, 'Vacas que Voam: novo lançamento de Coelho da Silva.', TO_DATE('10/01/2018', 'dd/mm/yyyy'), 'nunca olhe para cima', 0);
INSERT INTO PAINEL (id_painel, tema_painel, data_painel, descricao, aberto_publico) VALUES (2, 'Do diário ao backup do cérebro.', TO_DATE('10/01/2018', 'dd/mm/yyyy'), null, 0);
INSERT INTO PAINEL (id_painel, tema_painel, data_painel, descricao, aberto_publico) VALUES (3, 'Microtransações: a decadência do mercado de games.', TO_DATE('10/01/2018', 'dd/mm/yyyy'), 'Sabe quando ninguém gosta de alguma coisa mas as pessoas continuam fazendo mesmo assim ?', 1);
INSERT INTO PAINEL (id_painel, tema_painel, data_painel, descricao, aberto_publico) VALUES (4, '150 tons de cinza: a relação entre o bestseller e a primeira geração de pokemons.', TO_DATE('11/01/2018', 'dd/mm/yyyy'), null, 1);
INSERT INTO PAINEL (id_painel, tema_painel, data_painel, descricao, aberto_publico) VALUES (5, 'Lucas Bisneto: a arte de fazer dinheiro sem entregar nada.', TO_DATE('11/01/2018', 'dd/mm/yyyy'), 'nunca me esforcei muito pra conseguir um dinheiro a mais', 1);


create table BARRACA (
     id_barraca numeric not null,
     cpf varchar(11),
     modelo varchar(50) not null,
     marca varchar(50) not null,
     constraint ID_BARRACA_ID primary key (id_barraca),
     constraint SID_BARRA_PARTI_ID unique (cpf));

INSERT INTO BARRACA (id_barraca, cpf, modelo, marca) VALUES (1, 11111111111, 'Modelo 1', 'Marca 1');
INSERT INTO BARRACA (id_barraca, cpf, modelo, marca) VALUES (2, 22222222222, 'Modelo 1', 'Marca 2');
INSERT INTO BARRACA (id_barraca, cpf, modelo, marca) VALUES (3, 77777777777, 'Modelo 2', 'Marca 1');
INSERT INTO BARRACA (id_barraca, cpf, modelo, marca) VALUES (4, 33333333333, 'Modelo 2', 'Marca 2');
INSERT INTO BARRACA (id_barraca, cpf, modelo, marca) VALUES (5, 44444444444, 'Modelo 2', 'Marca 2');
INSERT INTO BARRACA (id_barraca, cpf, modelo, marca) VALUES (6, 99999999999, 'Modelo 1', 'Marca 1');


create table CARAVANA (
     id_caravana numeric not null,
     nome varchar(100) not null,
     cidade_origem varchar(100) not null,
     constraint ID_CARAVANA_ID primary key (id_caravana));

INSERT INTO CARAVANA (id_caravana, nome, cidade_origem) VALUES (1, 'Furacão de Oz', 'Osasco');
INSERT INTO CARAVANA (id_caravana, nome, cidade_origem) VALUES (2, 'Guerreios do futuro', 'Juiz de Fora');
INSERT INTO CARAVANA (id_caravana, nome, cidade_origem) VALUES (3, 'Caravana Campus', 'Itu');
INSERT INTO CARAVANA (id_caravana, nome, cidade_origem) VALUES (4, 'Instituto Marques', 'Salvador');
INSERT INTO CARAVANA (id_caravana, nome, cidade_origem) VALUES (5, 'São Paulo Ninjas', 'São Paulo');
INSERT INTO CARAVANA (id_caravana, nome, cidade_origem) VALUES (6, 'RJ-45', 'Angra dos Reis');


create table ENDERECO (
     id_endereco numeric not null,
     estado varchar(2)  not null,
     cidade varchar(50) not null,
     bairro varchar(50) not null,
     rua varchar(50) not null,
     numero varchar(6) not null,
     complemento varchar(50) not null,
     cep varchar(8) not null,
     constraint ID_ENDERECO_ID primary key (id_endereco));

INSERT INTO ENDERECO (id_endereco, estado, cidade, bairro, rua, numero, complemento, cep) VALUES (1, 'SP', 'Osasco', 'Bairro de Osasco', 'Rua de Osasco', '28', 'Bloco c, apt 25', '08123456');
INSERT INTO ENDERECO (id_endereco, estado, cidade, bairro, rua, numero, complemento, cep) VALUES (2, 'MG', 'Juiz de Fora' 'Bairro de Juiz de Fora', 'Rua de Juiz de Fora', '4', null, '08754456');
INSERT INTO ENDERECO (id_endereco, estado, cidade, bairro, rua, numero, complemento, cep) VALUES (3, 'RJ', 'Angra dos Reis' 'Bairro de Angra dos Reis', 'Rua de Angra dos Reis', '5333', null, '99123456');
INSERT INTO ENDERECO (id_endereco, estado, cidade, bairro, rua, numero, complemento, cep) VALUES (4, 'RN', 'Natal', 'Bairro de Natal', 'Rua de Natal', '653', 'Bloco 7, apt 49', '08125527');
INSERT INTO ENDERECO (id_endereco, estado, cidade, bairro, rua, numero, complemento, cep) VALUES (5, 'RJ', 'Rio de Janeiro', 'Bairro de Rio de Janeiro', 'Rua de Rio de Janeiro', '988', null, '76523008');
INSERT INTO ENDERECO (id_endereco, estado, cidade, bairro, rua, numero, complemento, cep) VALUES (6, 'SP', 'São Paulo', 'Bairro de São Paulo', 'Rua de São Paulo', '1123', 'Bloco 15, apt 42', '05553456');
INSERT INTO ENDERECO (id_endereco, estado, cidade, bairro, rua, numero, complemento, cep) VALUES (7, 'BH', 'Salvador', 'Bairro de Salvador', 'Rua de Salvador', '490', null, '02134567');
INSERT INTO ENDERECO (id_endereco, estado, cidade, bairro, rua, numero, complemento, cep) VALUES (8, 'SP', 'São Paulo', 'Bairro de São Paulo', 'Rua de São Paulo', '1123', 'Bloco 15, apt 42', '05553456');
INSERT INTO ENDERECO (id_endereco, estado, cidade, bairro, rua, numero, complemento, cep) VALUES (9, 'RJ', 'Rio de Janeiro', 'Bairro de Rio de Janeiro 2', 'Rua de Rio de Janeiro 2', '12', null, '76443008');
INSERT INTO ENDERECO (id_endereco, estado, cidade, bairro, rua, numero, complemento, cep) VALUES (10, 'SP', 'São Paulo', 'Bairro de São Paulo 2', 'Rua de São Paulo 2', '123', 'Bloco 11, apt 73', '05553456');
INSERT INTO ENDERECO (id_endereco, estado, cidade, bairro, rua, numero, complemento, cep) VALUES (11, 'SP', 'São Paulo', 'Bairro de São Paulo 3', 'Rua de São Paulo 3', '112', 'Bloco 5, apt 83', '05553456');

create table EXPOSITOR (
     cpf varchar(11) not null,
     nome_exposicao varchar(50) not null,
     tema_exposicao varchar(50) not null,
     constraint ID_EXPOS_ISENT_ID primary key (cpf));

INSERT INTO EXPOSITOR (cpf, nome_exposicao, tema_exposicao) VALUES ('11111111111', 'Loja oficial do evento', 'souvenir');
INSERT INTO EXPOSITOR (cpf, nome_exposicao, tema_exposicao) VALUES ('99999999999', 'Renner', 'vestuario');
INSERT INTO EXPOSITOR (cpf, nome_exposicao, tema_exposicao) VALUES ('44444444444', 'Colecionaveis show de bola', 'colecionaveis');


create table ISENTO (
     cpf varchar(11) not null,
     PALESTRANTE numeric,
     PAINELISTA numeric,
     JORNALISTA numeric,
     EXPOSITOR numeric,
     constraint ID_ISENT_PARTI_ID primary key (cpf));

INSERT INTO ISENTO (cpf, PALESTRANTE, PAINELISTA, JORNALISTA, EXPOSITOR) VALUES ('11111111111', 0, 0, 0, 1);
INSERT INTO ISENTO (cpf, PALESTRANTE, PAINELISTA, JORNALISTA, EXPOSITOR) VALUES ('22222222222', 0, 0, 1, 0);
INSERT INTO ISENTO (cpf, PALESTRANTE, PAINELISTA, JORNALISTA, EXPOSITOR) VALUES ('33333333333', 0, 0, 1, 0);
INSERT INTO ISENTO (cpf, PALESTRANTE, PAINELISTA, JORNALISTA, EXPOSITOR) VALUES ('44444444444', 0, 0, 0, 1);
INSERT INTO ISENTO (cpf, PALESTRANTE, PAINELISTA, JORNALISTA, EXPOSITOR) VALUES ('55555555555', 0, 1, 0, 0);
INSERT INTO ISENTO (cpf, PALESTRANTE, PAINELISTA, JORNALISTA, EXPOSITOR) VALUES ('66666666666', 0, 1, 0, 0);
INSERT INTO ISENTO (cpf, PALESTRANTE, PAINELISTA, JORNALISTA, EXPOSITOR) VALUES ('77777777777', 0, 1, 0, 0);
INSERT INTO ISENTO (cpf, PALESTRANTE, PAINELISTA, JORNALISTA, EXPOSITOR) VALUES ('88888888888', 1, 0, 0, 0);
INSERT INTO ISENTO (cpf, PALESTRANTE, PAINELISTA, JORNALISTA, EXPOSITOR) VALUES ('99999999999', 0, 0, 0, 1);


create table JORNALISTA (
     cpf varchar(11) not null,
     credencial numeric not null,
     especialidade varchar(100) not null,
     constraint ID_JORNA_ISENT_ID primary key (cpf));

INSERT INTO JORNALISTA (cpf, credencial, especialidade) VALUES ('22222222222', 1, 'Ciencia');
INSERT INTO JORNALISTA (cpf, credencial, especialidade) VALUES ('33333333333', 2, 'Tecnologia');

create table MATERIA (
     id_materia numeric not null,
     titulo varchar(50) not null,
     assunto varchar(100) not null,
     data date not null,
     cpf varchar(11) not null,
     constraint ID_MATERIA_ID primary key (id_materia));

INSERT INTO MATERIA (id_materia, titulo, assunto, data, cpf) VALUES (1, 'Como fazer seus miolos explodirem', 'Neurologia aplicada', TO_DATE('12/01/2018', 'dd/mm/yyyy'), '22222222222');
INSERT INTO MATERIA (id_materia, titulo, assunto, data, cpf) VALUES (2, 'Aprendendo a se exercitar com as capivaras', 'Esporte', TO_DATE('20/01/2018', 'dd/mm/yyyy'), '22222222222');
INSERT INTO MATERIA (id_materia, titulo, assunto, data, cpf) VALUES (3, 'IA para formigas', 'Inteligencia artificial', TO_DATE('10/01/2018', 'dd/mm/yyyy'), '33333333333');
INSERT INTO MATERIA (id_materia, titulo, assunto, data, cpf) VALUES (4, 'Acessorios para escritorio', 'estilo de vida', TO_DATE('13/01/2018', 'dd/mm/yyyy'), '33333333333');

create table PAGANTE (
     cpf varchar(11) not null,
     valor_insc number(9,2) not null,
     constraint ID_PAGAN_PARTI_ID primary key (cpf));

INSERT INTO PAGANTE (cpf, valor_insc) VALUES ('21111111111', 450.00);
INSERT INTO PAGANTE (cpf, valor_insc) VALUES ('23333333333', 300.00);
INSERT INTO PAGANTE (cpf, valor_insc) VALUES ('24444444444', 150.00);
INSERT INTO PAGANTE (cpf, valor_insc) VALUES ('25555555555', 450.00);
INSERT INTO PAGANTE (cpf, valor_insc) VALUES ('26666666666', 450.00);

create table PAINELISTA (
     cpf varchar(11) not null,
     especialidade varchar(50) not null,
     titulacao varchar(50) not null,
     constraint ID_PAINE_ISENT_ID primary key (cpf));

INSERT INTO PAINELISTA (cpf, especialidade, titulacao) VALUES ('55555555555', 'Psicologia', 'Doutor');
INSERT INTO PAINELISTA (cpf, especialidade, titulacao) VALUES ('66666666666', 'Data Mining', 'Mestre');
INSERT INTO PAINELISTA (cpf, especialidade, titulacao) VALUES ('77777777777', 'Inteligencia Artificial', 'Doutor');

create table PALESTRANTE (
     cpf varchar(11) not null,
     especialidade varchar(50) not null,
     titulacao varchar(50) not null,
     constraint ID_PALES_ISENT_ID primary key (cpf));

INSERT INTO PALESTRANTE (cpf, especialidade, titulacao) VALUES ('88888888888', 'Machine Learning', 'Doutor');

create table PARTICIPANTE (
     cpf varchar(11) not null,
     nome varchar(100) not null,
     data_nasc date not null,
     email varchar(50) not null,
     telefone varchar(12) not null,
     genero char(1) not null,
     ocupacao varchar(50) not null,
     categoria_ins varchar(25) not null,
     valor_barraca number(9,2) not null,
     PAGANTE numeric,
     ISENTO numeric,
     id_endereco numeric not null,
     id_caravana numeric,
     constraint ID_PARTICIPANTE_ID primary key (cpf));

INSERT INTO PARTICIPANTE (cpf, nome, data_nasc, email, telefone, genero, ocupacao, categoria_ins, valor_barraca, PAGANTE, ISENTO, id_endereco, id_caravana) VALUES ('11111111111', 'Maria Maravilha', TO_DATE('12/03/1988', 'dd/mm/yyyy'), 'maria@email.com', '11999999999', 'F', 'Professor', 'isento sem barraca', 0, 0, 1, 1, null);
INSERT INTO PARTICIPANTE (cpf, nome, data_nasc, email, telefone, genero, ocupacao, categoria_ins, valor_barraca, PAGANTE, ISENTO, id_endereco, id_caravana) VALUES ('22222222222', 'João Joalheiro', TO_DATE('19/01/1975', 'dd/mm/yyyy'), 'joao@email.com', '15929764991', 'M', 'Jornalista', 'isento com barraca', 150, 0, 2, 2, 1);
INSERT INTO PARTICIPANTE (cpf, nome, data_nasc, email, telefone, genero, ocupacao, categoria_ins, valor_barraca, PAGANTE, ISENTO, id_endereco, id_caravana) VALUES ('33333333333', 'Lucas Loiro', TO_DATE('23/06/1999', 'dd/mm/yyyy'), 'lucas@email.com', '15922323232', 'M', 'Youtuber', 'isento com barraca', 300, 0, 1, 3, 2);
INSERT INTO PARTICIPANTE (cpf, nome, data_nasc, email, telefone, genero, ocupacao, categoria_ins, valor_barraca, PAGANTE, ISENTO, id_endereco, id_caravana) VALUES ('44444444444', 'Pedro Pedroso', TO_DATE('17/07/1974', 'dd/mm/yyyy'), 'pedro@email.com', '11999988899', 'M', 'Comerciante', 'isento sem barraca', 0, 0, 1, 4, null);
INSERT INTO PARTICIPANTE (cpf, nome, data_nasc, email, telefone, genero, ocupacao, categoria_ins, valor_barraca, PAGANTE, ISENTO, id_endereco, id_caravana) VALUES ('55555555555', 'Bruna Bala', TO_DATE('28/02/1988', 'dd/mm/yyyy'), 'bruna@email.com', '12349999977', 'F', 'Professor', 'isento sem barraca', 0, 0, 1, 5, 1);
INSERT INTO PARTICIPANTE (cpf, nome, data_nasc, email, telefone, genero, ocupacao, categoria_ins, valor_barraca, PAGANTE, ISENTO, id_endereco, id_caravana) VALUES ('66666666666', 'Vitória Valente', TO_DATE('04/04/1986', 'dd/mm/yyyy'), 'vitoria@email.com', '11999995534', 'F', 'Pesquisador', 'isento com barraca', 150, 0, 1, 6, 5);
INSERT INTO PARTICIPANTE (cpf, nome, data_nasc, email, telefone, genero, ocupacao, categoria_ins, valor_barraca, PAGANTE, ISENTO, id_endereco, id_caravana) VALUES ('77777777777', 'Trevor Tirano', TO_DATE('19/07/1972', 'dd/mm/yyyy'), 'trevor@email.com', '119349993242', 'M', 'Administrador de sistema', 'isento sem barraca', 0, 0, 1, 7, 6);
INSERT INTO PARTICIPANTE (cpf, nome, data_nasc, email, telefone, genero, ocupacao, categoria_ins, valor_barraca, PAGANTE, ISENTO, id_endereco, id_caravana) VALUES ('88888888888', 'Diana Durona', TO_DATE('17/011/1988', 'dd/mm/yyyy'), 'diana@email.com', '14954782342', 'F', 'Professor', 'isento sem barraca', 0, 0, 1, 8, 3);
INSERT INTO PARTICIPANTE (cpf, nome, data_nasc, email, telefone, genero, ocupacao, categoria_ins, valor_barraca, PAGANTE, ISENTO, id_endereco, id_caravana) VALUES ('99999999999', 'Pablo Ruanda Marcos Rossi', TO_DATE('20/02/1990', 'dd/mm/yyyy'), 'pablo@email.com', '19988888888', 'M', 'Comerciante', 'isento sem barraca', 0, 0, 1, 9, 3);
INSERT INTO PARTICIPANTE (cpf, nome, data_nasc, email, telefone, genero, ocupacao, categoria_ins, valor_barraca, PAGANTE, ISENTO, id_endereco, id_caravana) VALUES ('21111111111', 'Gabriel Garcia', TO_DATE('12/12/2000', 'dd/mm/yyyy'), 'gabriel@email.com', '11977766545', 'M', 'Funcionario Publico', 'pagante com barraca', 300, 0, 1, 10, 4);
INSERT INTO PARTICIPANTE (cpf, nome, data_nasc, email, telefone, genero, ocupacao, categoria_ins, valor_barraca, PAGANTE, ISENTO, id_endereco, id_caravana) VALUES ('23333333333', 'Fernanda Falamansa', TO_DATE('09/08/1979', 'dd/mm/yyyy'), 'fernanda@email.com', '1177779999', 'F', 'Desenvolvedor', 'pagante sem barraca', 0, 0, 1, 11, null);
INSERT INTO PARTICIPANTE (cpf, nome, data_nasc, email, telefone, genero, ocupacao, categoria_ins, valor_barraca, PAGANTE, ISENTO, id_endereco, id_caravana) VALUES ('24444444444', 'Igor Irado', TO_DATE('30/04/1977', 'dd/mm/yyyy'), 'igor@email.com', '11996659990', 'M', 'Empresario', 'pagante sem barraca', 0, 0, 1, 11, null);
INSERT INTO PARTICIPANTE (cpf, nome, data_nasc, email, telefone, genero, ocupacao, categoria_ins, valor_barraca, PAGANTE, ISENTO, id_endereco, id_caravana) VALUES ('25555555555', 'Julio Iradado Falamansa', TO_DATE('24/07/2007', 'dd/mm/yyyy'), 'julio@email.com', '11900925991', 'M', 'Estudante', 'pagante sem barraca', 0, 0, 1, 11, null);
INSERT INTO PARTICIPANTE (cpf, nome, data_nasc, email, telefone, genero, ocupacao, categoria_ins, valor_barraca, PAGANTE, ISENTO, id_endereco, id_caravana) VALUES ('26666666666', 'Clara Irado Falamansa', TO_DATE('02/05/2005', 'dd/mm/yyyy'), 'clara@email.com', '11943999923', 'F', 'Estudante', 'pagante sem barraca', 0, 0, 1, 11, null);


create table PRODUTO (
     id_produto numeric not null,
     nome varchar(50) not null,
     tipo_produto varchar(15) not null,
     descricao varchar(50) not null,
     quantidade_estoque numeric not null,
     preco number(9,2) not null,
     cpf varchar(11) not null,
     constraint ID_PRODUTO_ID primary key (id_produto));

INSERT INTO PRODUTO (id_produto, nome, tipo_produto, descricao, quantidade_estoque, preco, cpf) VALUES (1, 'Caneca do evento', 'caneca', 'Preta com o logo', 1000, 50.00, ‘11111111111’);
INSERT INTO PRODUTO (id_produto, nome, tipo_produto, descricao, quantidade_estoque, preco, cpf) VALUES (2, Camiseta do evento', 'vestuario', Azul com o logo', 1000, 70.00, ‘11111111111’);
INSERT INTO PRODUTO (id_produto, nome, tipo_produto, descricao, quantidade_estoque, preco, cpf) VALUES (3, Agenda do evento', 'papelaria', 'Azul com o logo brochura', 1000, 80.00, ‘11111111111’);
INSERT INTO PRODUTO (id_produto, nome, tipo_produto, descricao, quantidade_estoque, preco, cpf) VALUES (4, 'Moletom Mulher Maravilha', 'vestuario', 'Vermelha com estampa, capuz', 500, 200.00, ‘44444444444’);
INSERT INTO PRODUTO (id_produto, nome, tipo_produto, descricao, quantidade_estoque, preco, cpf) VALUES (5, 'Par de meias Batman', 'vestuario', 'Preta com o bat-sinal', 200, 50.00, ‘44444444444’);
INSERT INTO PRODUTO (id_produto, nome, tipo_produto, descricao, quantidade_estoque, preco, cpf) VALUES (6, 'Replica Dr. Estranho’, 'colecionavel', 'Replica de aço escala 1/6', 100, 500.00, ‘99999999999’);
INSERT INTO PRODUTO (id_produto, nome, tipo_produto, descricao, quantidade_estoque, preco, cpf) VALUES (7, 'Chaveiro Ada Lovelace', 'colecionavel', 'Branco com estampa feito de pano', 1000, 50.00, ‘99999999999’);


create table APRESENTA_PN (
     cpf varchar(11) not null,
     id_painel numeric not null,
     constraint ID_APRESENTA_PN_ID primary key (id_painel, cpf));

INSERT INTO APRESENTA_PN (cpf, id_painel) VALUES ('55555555555', 1);
INSERT INTO APRESENTA_PN (cpf, id_painel) VALUES ('55555555555', 3);
INSERT INTO APRESENTA_PN (cpf, id_painel) VALUES ('55555555555', 5);
INSERT INTO APRESENTA_PN (cpf, id_painel) VALUES ('66666666666', 2);
INSERT INTO APRESENTA_PN (cpf, id_painel) VALUES ('66666666666', 4);
INSERT INTO APRESENTA_PN (cpf, id_painel) VALUES ('66666666666', 5);
INSERT INTO APRESENTA_PN (cpf, id_painel) VALUES ('77777777777', 1);
INSERT INTO APRESENTA_PN (cpf, id_painel) VALUES ('77777777777', 2);
INSERT INTO APRESENTA_PN (cpf, id_painel) VALUES ('77777777777', 3);
INSERT INTO APRESENTA_PN (cpf, id_painel) VALUES ('77777777777', 4);
INSERT INTO APRESENTA_PN (cpf, id_painel) VALUES ('77777777777', 5);


create table ONIBUS_1 (
     id_onibus numeric not null,
     id_caravana numeric not null,
     modelo varchar(50) not null,
     capacidade numeric not null,
     constraint ID_ONIBUS_1_ID primary key (id_onibus),
     constraint SID_ONIBUS_1_ID unique (id_caravana, id_onibus));

INSERT INTO ONIBUS_1 (id_onibus, id_caravana, modelo, capacidade) VALUES (1, 3, 'Onibus Turismo', 40);
INSERT INTO ONIBUS_1 (id_onibus, id_caravana, modelo, capacidade) VALUES (2, 2, 'Van', 15);
INSERT INTO ONIBUS_1 (id_onibus, id_caravana, modelo, capacidade) VALUES (3, 1, 'Onibus Turismo', 40);
INSERT INTO ONIBUS_1 (id_onibus, id_caravana, modelo, capacidade) VALUES (4, 5, 'Onibus Turismo', 40);
INSERT INTO ONIBUS_1 (id_onibus, id_caravana, modelo, capacidade) VALUES (5, 4, 'Van', 10);
INSERT INTO ONIBUS_1 (id_onibus, id_caravana, modelo, capacidade) VALUES (6, 6, 'Van', 12);
INSERT INTO ONIBUS_1 (id_onibus, id_caravana, modelo, capacidade) VALUES (7, 3, 'Van', 15);

create table TRABALHA_EM (
     cpf varchar(11) not null,
     codigo_vc numeric not null,
     constraint ID_TRABALHA_EM_ID primary key (codigo_vc, cpf));

INSERT INTO TRABALHA_EM (cpf, codigo_vc) VALUES ('33333333333', 1);
INSERT INTO TRABALHA_EM (cpf, codigo_vc) VALUES ('33333333333', 2);
INSERT INTO TRABALHA_EM (cpf, codigo_vc) VALUES ('22222222222', 3);


create table VEICULO_COMUNICACAO (
     codigo_vc numeric not null,
     nome_vc varchar(100) not null,
     meio_comunicacao varchar(50) not null,
     constraint ID_VEICULO_COMUNICACAO_ID primary key (codigo_vc));

INSERT INTO VEICULO_COMUNICACAO (codigo_vc, nome_vc, meio_comunicacao) VALUES (1, 'Canal Tech', 'youtube');
INSERT INTO VEICULO_COMUNICACAO (codigo_vc, nome_vc, meio_comunicacao) VALUES (2, 'G1', 'portal de noticias');
INSERT INTO VEICULO_COMUNICACAO (codigo_vc, nome_vc, meio_comunicacao) VALUES (3, 'Galileu', 'revista');


-- Constraints Section
-- ___________________ 

alter table PALESTRA add constraint EQU_PALES_PALES_FK
     foreign key (cpf)
     references PALESTRANTE;

alter table BARRACA add constraint SID_BARRA_PARTI_FK
     foreign key (cpf)
     references PARTICIPANTE;

alter table CARAVANA add constraint ID_CARAVANA_CHK
     check(exists(select * from PARTICIPANTE
                  where PARTICIPANTE.id_caravana = id_caravana)); 

alter table CARAVANA add constraint ID_CARAVANA_CHK
     check(exists(select * from ONIBUS_1
                  where ONIBUS_1.id_caravana = id_caravana)); 

alter table ENDERECO add constraint ID_ENDERECO_CHK
     check(exists(select * from PARTICIPANTE
                  where PARTICIPANTE.id_endereco = id_endereco)); 

alter table EXPOSITOR add constraint ID_EXPOS_ISENT_CHK
     check(exists(select * from PRODUTO
                  where PRODUTO.cpf = cpf)); 

alter table EXPOSITOR add constraint ID_EXPOS_ISENT_FK
     foreign key (cpf)
     references ISENTO;

alter table ISENTO add constraint EXTONE_ISENTO
     check((JORNALISTA is not null and PALESTRANTE is null and EXPOSITOR is null and PAINELISTA is null)
           or (JORNALISTA is null and PALESTRANTE is not null and EXPOSITOR is null and PAINELISTA is null)
           or (JORNALISTA is null and PALESTRANTE is null and EXPOSITOR is not null and PAINELISTA is null)
           or (JORNALISTA is null and PALESTRANTE is null and EXPOSITOR is null and PAINELISTA is not null)); 

alter table ISENTO add constraint ID_ISENT_PARTI_FK
     foreign key (cpf)
     references PARTICIPANTE;

alter table JORNALISTA add constraint ID_JORNA_ISENT_CHK
     check(exists(select * from TRABALHA_EM
                  where TRABALHA_EM.cpf = cpf)); 

alter table JORNALISTA add constraint ID_JORNA_ISENT_FK
     foreign key (cpf)
     references ISENTO;

alter table MATERIA add constraint REF_MATER_JORNA_FK
     foreign key (cpf)
     references JORNALISTA;

alter table PAGANTE add constraint ID_PAGAN_PARTI_FK
     foreign key (cpf)
     references PARTICIPANTE;

alter table PAINELISTA add constraint ID_PAINE_ISENT_CHK
     check(exists(select * from APRESENTA_PN
                  where APRESENTA_PN.cpf = cpf)); 

alter table PAINELISTA add constraint ID_PAINE_ISENT_FK
     foreign key (cpf)
     references ISENTO;

alter table PALESTRANTE add constraint ID_PALES_ISENT_CHK
     check(exists(select * from PALESTRA
                  where PALESTRA.cpf = cpf)); 

alter table PALESTRANTE add constraint ID_PALES_ISENT_FK
     foreign key (cpf)
     references ISENTO;

alter table PARTICIPANTE add constraint EXTONE_PARTICIPANTE
     check((ISENTO is not null and PAGANTE is null)
           or (ISENTO is null and PAGANTE is not null)); 

alter table PARTICIPANTE add constraint EQU_PARTI_ENDER_FK
     foreign key (id_endereco)
     references ENDERECO;

alter table PARTICIPANTE add constraint EQU_PARTI_CARAV_FK
     foreign key (id_caravana)
     references CARAVANA;

alter table PRODUTO add constraint EQU_PRODU_EXPOS_FK
     foreign key (cpf)
     references EXPOSITOR;

alter table APRESENTA_PN add constraint REF_APRES_PAINE
     foreign key (id_painel)
     references PAINEL;

alter table APRESENTA_PN add constraint EQU_APRES_PAINE_FK
     foreign key (cpf)
     references PAINELISTA;

alter table ONIBUS_1 add constraint EQU_ONIBU_CARAV
     foreign key (id_caravana)
     references CARAVANA;

alter table TRABALHA_EM add constraint EQU_TRABA_VEICU
     foreign key (codigo_vc)
     references VEICULO_COMUNICACAO;

alter table TRABALHA_EM add constraint EQU_TRABA_JORNA_FK
     foreign key (cpf)
     references JORNALISTA;

alter table VEICULO_COMUNICACAO add constraint ID_VEICULO_COMUNICACAO_CHK
     check(exists(select * from TRABALHA_EM
                  where TRABALHA_EM.codigo_vc = codigo_vc)); 


-- Index Section
-- _____________ 

create unique index ID_PALESTRA_IND
     on PALESTRA (id_palestra);

create index EQU_PALES_PALES_IND
     on PALESTRA (cpf);

create unique index ID_PAINEL_IND
     on PAINEL (id_painel);

create unique index ID_BARRACA_IND
     on BARRACA (id_barraca);

create unique index SID_BARRA_PARTI_IND
     on BARRACA (cpf);

create unique index ID_CARAVANA_IND
     on CARAVANA (id_caravana);

create unique index ID_ENDERECO_IND
     on ENDERECO (id_endereco);

create unique index ID_EXPOS_ISENT_IND
     on EXPOSITOR (cpf);

create unique index ID_ISENT_PARTI_IND
     on ISENTO (cpf);

create unique index ID_JORNA_ISENT_IND
     on JORNALISTA (cpf);

create unique index ID_MATERIA_IND
     on MATERIA (id_materia);

create index REF_MATER_JORNA_IND
     on MATERIA (cpf);

create unique index ID_PAGAN_PARTI_IND
     on PAGANTE (cpf);

create unique index ID_PAINE_ISENT_IND
     on PAINELISTA (cpf);

create unique index ID_PALES_ISENT_IND
     on PALESTRANTE (cpf);

create unique index ID_PARTICIPANTE_IND
     on PARTICIPANTE (cpf);

create index EQU_PARTI_ENDER_IND
     on PARTICIPANTE (id_endereco);

create index EQU_PARTI_CARAV_IND
     on PARTICIPANTE (id_caravana);

create unique index ID_PRODUTO_IND
     on PRODUTO (id_produto);

create index EQU_PRODU_EXPOS_IND
     on PRODUTO (cpf);

create unique index ID_APRESENTA_PN_IND
     on APRESENTA_PN (id_painel, cpf);

create index EQU_APRES_PAINE_IND
     on APRESENTA_PN (cpf);

create unique index ID_ONIBUS_1_IND
     on ONIBUS_1 (id_onibus);

create unique index SID_ONIBUS_1_IND
     on ONIBUS_1 (id_caravana, id_onibus);

create unique index ID_TRABALHA_EM_IND
     on TRABALHA_EM (codigo_vc, cpf);

create index EQU_TRABA_JORNA_IND
     on TRABALHA_EM (cpf);

create unique index ID_VEICULO_COMUNICACAO_IND
     on VEICULO_COMUNICACAO (codigo_vc);

