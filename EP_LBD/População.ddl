-- *********************************************
-- * Standard SQL generation                   
-- *--------------------------------------------
-- * DB-MAIN version: 10.0.3              
-- * Generator date: Aug 17 2017              
-- * Generation date: Sat Apr  7 12:18:27 2018 
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

create table APRESENTA_1 (
     id_atividade numeric(1) not null,
     cpf numeric(11) not null,
     constraint ID_APRESENTA_1_ID primary key (id_atividade, cpf));

INSERT INTO APRESENTA_1 VALUES
(1,11111111111),
(2,22222222222),
(3,33333333333),
(4,44444444444),
(5,55555555555);

create table ATIVIDADE (
     id_atividade numeric(1) not null,
     tipo_atividade varchar(1) not null,
     data date not null,
     hora_inicio varchar(1) not null,
     hora_termino varchar(1) not null,
     descricao varchar(1) not null,
     cpf_palestrante numeric(11),
     constraint ID_ATIVIDADE_ID primary key (id_atividade));

INSERT INTO ATIVIDADE VALUES
(1,"Palestra", 2017-11-19, "09:00","10:30", "Texto de descrição 1", 11111111111),
(2,"Palestra", 2017-11-19, "09:00","10:30", "Texto de descrição 2", 22222222222),
(3,"Palestra", 2017-11-19, "09:00","10:30", "Texto de descrição 3", 33333333333),
(4,"Painel", 2017-11-19, "09:00","10:30", "Texto de descrição 4", null,),
(5,"Painel", 2017-11-19, "09:00","10:30", "Texto de descrição 5", null,);

create table BARRACA (
     id_barraca numeric(1) not null,
     cpf numeric(11),
     modelo varchar(1) not null,
     marca varchar(1) not null,
     constraint ID_BARRACA_ID primary key (id_barraca),
     constraint SID_BARRA_PARTI_ID unique (cpf));

INSERT INTO BARRACA VALUES
(1, 20202020200, "Modelo 1", "Marca 1"),
(2, 66666666666, "Modelo 1", "Marca 2"),
(3, 77777777777, "Modelo 2", "Marca 1"),
(4, 20202020201, "Modelo 2", "Marca 2"),
(5, 99999999999, "Modelo 2", "Marca 2"),
(6, 20202020203, "Modelo 1", "Marca 1");

create table CARAVANA (
     id_caravana numeric(1) not null,
     nome varchar(1) not null,
     cidade_origem varchar(1) not null,
     qtd_pessoas numeric(1) not null,
     constraint ID_CARAVANA_ID primary key (id_caravana));

INSERT INTO CARAVANA VALUES
(1,"C. DO SUL", "Florianópolis", 45),
(2,"C. DO SUDESTE", "Santos", 28),
(3,"C. DO NORDESTE", "Fortaleza", 30),
(4,"C. DO NORTE", "Manaus", 87),
(5,"C. DO CENTRO-OESTE", "Goiânia", 21);

create table COBRE (
     id_atividade numeric(1) not null,
     cpf numeric(11) not null,
     constraint ID_COBRE_ID primary key (id_atividade, cpf));

INSERT INTO COBRE VALUES
(1,10101010100),
(2,10101010101),
(3,10101010102),
(4,10101010103),
(5,10101010104);

create table EFETUA (
     cpf numeric(11) not null,
     id_inscricao numeric(1) not null,
     custo float(1) not null,
     constraint ID_EFETU_PARTI_ID primary key (cpf),
     constraint SID_EFETU_INSCR_ID unique (id_inscricao));

INSERT INTO EFETUA VALUES
(11111111111, 1, 0.0),
(22222222222, 2, 0.0),
(33333333333, 3, 0.0),
(44444444444, 4, 0.0),
(55555555555, 5, 0.0),
(66666666666, 6, 200.0),
(77777777777, 7, 200.0),
(88888888888, 8, 100.0),
(99999999999, 9, 200.0),
(10101010100, 10, 0.0),
(10101010101, 11, 0.0),
(10101010102, 12, 0.0),
(10101010103, 13, 0.0),
(10101010104, 14, 0.0),
(10101010105, 15, 100.0),
(20202020200, 20, 70.0),
(20202020201, 21, 70.0),
(20202020203, 23, 70.0),
(20202020204, 24, 0.0),
(20202020205, 25, 0.0),
(30303030300, 30, 0.0),
(30303030301, 31, 0.0),
(30303030302, 32, 0.0),
(40404040400, 40, 0.0),
(40404040401, 41, 0.0);

create table EMPREGA (
     cpf numeric(11) not null,
     codigo_vc char(1) not null,
     constraint ID_EMPREGA_ID primary key (codigo_vc, cpf));

INSERT INTO EMPREGA VALUES
(10101010100, 10),
(10101010101, 11),
(10101010102, 12),
(10101010103, 13),
(10101010104, 14);

create table EXPOSITOR (
     cpf numeric(11) not null,
     titulo_exposicao varchar(50) not null,
     assunto_exposicao varchar(50) not null,
     constraint ID_EXPOS_ISENT_ID primary key (cpf));

INSERT INTO EXPOSITOR VALUES
(20202020200, "Título 1", "Assunto 1"),
(20202020201, "Título 2", "Assunto 2"),
(20202020203, "Título 3", "Assunto 3"),
(20202020204, "Título 4", "Assunto 4"),
(20202020205, "Título 5", "Assunto 5");

create table INSCRICAO (
     id_inscricao numeric(1) not null,
     categoria varchar(1) not null,
     constraint ID_INSCRICAO_ID primary key (id_inscricao));

INSERT INTO INSCRICAO VALUES
(1, "Isento sem barraca."),
(2, "Isento sem barraca."),
(3, "Isento sem barraca."),
(4, "Isento sem barraca."),
(5, "Isento sem barraca."),
(6, "Pagante com barraca."),
(7, "Pagante com barraca."),
(8, "Pagante sem barraca."),
(9, "Pagante com barraca."),
(10, "Isento sem barraca."),
(11, "Isento sem barraca."),
(12, "Isento sem barraca."),
(13, "Isento sem barraca."),
(14, "Isento sem barraca."),
(15, "Pagante sem barraca."),
(20, "Isento com barraca."),
(21, "Isento com barraca."),
(23, "Isento com barraca."),
(24, "Isento sem barraca."),
(25, "Isento sem barraca."),
(30, "Isento sem barraca."),
(31, "Isento sem barraca."),
(32, "Isento sem barraca."),
(40, "Isento sem barraca."),
(41, "Isento sem barraca.");

create table ISENTO (
     cpf numeric(11) not null,
     PALESTRANTE numeric(11),
     PAINELISTA numeric(11),
     JORNALISTA numeric(11),
     EXPOSITOR numeric(11),
     constraint ID_ISENT_PARTI_ID primary key (cpf));

INSERT INTO ISENTO VALUES
(11111111111, 1, 0, 0, 0),
(22222222222, 1, 0, 0, 0),
(33333333333, 1, 0, 0, 0),
(44444444444, 0, 1, 0, 0),
(55555555555, 0, 1, 0, 0),
(10101010100, 0, 0, 1, 0),
(10101010101, 0, 0, 1, 0),
(10101010102, 0, 0, 1, 0),
(10101010103, 0, 0, 1, 0),
(10101010104, 0, 0, 1, 0),
(20202020200, 0, 0, 0, 1),
(20202020201, 0, 0, 0, 1),
(20202020203, 0, 0, 0, 1),
(20202020204, 0, 0, 0, 1),
(20202020205, 0, 0, 0, 1),
(30303030300, 0, 1, 0, 0),
(30303030301, 0, 1, 0, 0),
(30303030302, 0, 1, 0, 0),
(40404040400, 1, 0, 0, 0),
(40404040401, 1, 0, 0, 0);

create table JORNALISTA (
     cpf numeric(11) not null,
     credencial numeric(1) not null,
     especialidade varchar(1) not null,
     constraint ID_JORNA_ISENT_ID primary key (cpf));

INSERT INTO JORNALISTA VALUES
(10101010100, 132, "Esporte"),
(10101010101, 654, "Tecnologia"),
(10101010102, 987, "Negócios"),
(10101010103, 147, "Ciências"),
(10101010104, 915, "Futilidades");

create table MATERIA (
     titulo varchar(50) not null,
     cpf numeric(11) not null,
     assunto varchar(100) not null,
     data date not null,
     constraint ID_MATERIA_ID primary key (titulo),
     constraint SID_MATERIA_ID unique (cpf, titulo));

INSERT INTO MATERIA VALUES
("Título 1", 10101010100, "Informática", 2018-04-11),
("Título 2", 10101010101, "Esoterismo", 2018-04-23),
("Título 3", 10101010102, "Astrologia", 2018-05-01);

create table ONIBUS (
     id_onibus numeric(1) not null,
     modelo varchar(20) not null,
     capacidade numeric(1) not null,
     id_caravana numeric(1) not null,
     constraint ID_ONIBUS_ID primary key (id_onibus));

INSERT INTO ONIBUS VALUES
(1, "Modelo 1", 30, 4),
(2, "Modelo 2", 30, 4),
(3, "Modelo 2", 30, 4),
(4, "Modelo 1", 30, 1),
(5, "Modelo 1", 30, 1),
(6, "Modelo 2", 30, 3),
(7, "Modelo 2", 30, 2),
(8, "Modelo 1", 30, 5);

create table PAGANTE (
     cpf numeric(11) not null,
     constraint ID_PAGAN_PARTI_ID primary key (cpf));

INSERT INTO PAGANTE VALUES
(66666666666),
(77777777777),
(88888888888),
(99999999999),
(10101010105);

create table PAINELISTA (
     cpf numeric(11) not null,
     titulo_painel varchar(1) not null,
     tema_painel varchar(1) not null,
     constraint ID_PAINE_ISENT_ID primary key (cpf));

INSERT INTO PAINELISTA VALUES
(44444444444, "Vacas que Voam: novo lançamento de Paulo Coelho.", "Literatura"),
(55555555555, "Do diário ao backup do cérebro.", "Neurociências"),
(30303030300, "Microtransações: a decadência do mercado de games.", "Entretenimento"),
(30303030301, "150 tons de cinza: a relação entre o bestseller e a primeira geração de pokemons.", "Futilidades");
(30303030302, "Lucas Neto: a arte de fazer dinheiro sem entregar nada.", "Empreendedorismo");

create table PALESTRANTE (
     cpf numeric(11) not null,
     titulo_palestra varchar(1) not null,
     tema_palestra varchar(1) not null,
     constraint ID_PALES_ISENT_ID primary key (cpf));

INSERT INTO PALESTRANTE VALUES
(11111111111, "Como se tornar um ninja em banco de dados com Fátima Nunes.", "Informática"),
(22222222222, "Belas Maldições: as precisas profecias de Jordana Carnicelli (bruxa).", "Esoterismo"),
(33333333333, "Cavaleiros dos Horóscopos: fazendo seu próprio mapa astral com Shun de Andrômeda.", "Astrologia"),
(40404040400, "Caso ou compro um playstation 4?" "Auto-ajuda"),
(40404040401, "Subindo escadas enquanto masca chiclete: desenvolvendo habilidades motoras.", "Corpo e Mente");

create table PARTICIPA (
     id_atividade numeric(1) not null,
     cpf numeric(11) not null,
     constraint ID_PARTICIPA_ID primary key (id_atividade, cpf));

INSERT INTO PARTICIPA VALUES
(1, 66666666666),
(2, 77777777777),
(3, 88888888888),
(4, 99999999999),
(5, 10101010105);

create table PARTICIPANTE (
     cpf numeric(11) not null,
     nome varchar(100) not null,
     data_nasc date not null,
     idade numeric(3) not null,
     end_rua varchar(50) not null,
     end_num numeric(6) not null,
     end_bairro varchar(50) not null,
     end_cidade varchar(70) not null,
     end_cep numeric(8) not null,
     email char(50) not null,
     telefone numeric(11) not null,
     genero char(1) not null,
     ocupacao varchar(50) not null,
     id_onibus numeric(1),
     id_caravana numeric(1),
     PAGANTE numeric(11),
     ISENTO numeric(11),
     constraint ID_PARTICIPANTE_ID primary key (cpf));

INSERT INTO PARTICIPANTE
VALUES (11111111111, "Fátima Nunes", 1990-11-01, 28, "Endereço 1", 5010, "Bairro 1", "São Paulo", 01312301, "fulano1@gmail.com", 991423201, "F", "Professor", 4, 1, 0, 1); 
INSERT INTO PARTICIPANTE
VALUES (22222222222, "Nome 2", 1990-11-01, 28, "Endereço 2", 6021, "Bairro 2", "Florianópolis", 01322302, "fulano2@gmail.com", 991423202, "M", "Professor", 4, 1, 0, 1); 
INSERT INTO PARTICIPANTE
VALUES (33333333333, "Nome 3", 1990-11-01, 28, "Endereço 3", 4036, "Bairro 3", "Florianópolis", 01323303, "fulano3@gmail.com", 991423203, "M", "Professor", 5, 1, 0, 1); 
INSERT INTO PARTICIPANT;
VALUES (44444444444, "Nome 4", 1990-11-01, 28, "Endereço 4", 3048, "Bairro 4", "Florianópolis", 01323514, "fulano4@gmail.com", 991423204, "F", "Professor", 5, 1, 0, 1); 
INSERT INTO PARTICIPANTE
VALUES (55555555555, "Nome 5", 1990-11-01, 28, "Endereço 5", 2057, "Bairro 5", "Florianópolis", 01323075, "fulano5@gmail.com", 991423205, "M", "Professor", 5, 1, 0, 1); 
INSERT INTO PARTICIPANTE
VALUES (66666666666, "Nome 6", 1990-11-01, 28, "Endereço 6", 1069, "Bairro 6", "Santos", 08132306, "fulano6@gmail.com", 991423206, "F", "Estudante", 7, 2, 1, 0);
INSERT INTO PARTICIPANTE
VALUES (77777777777, "Nome 7", 1990-11-01, 28, "Endereço 7", 0873, "Bairro 7", "Santos", 01532307, "fulano7@gmail.com", 991423207, "F", "Estudante", 7, 2, 1, 0); 
INSERT INTO PARTICIPANTE
VALUES (88888888888, "Nome 8", 1990-11-01, 28, "Endereço 8", 0181, "Bairro 8", "Santos", 06132308, "fulano8@gmail.com", 991423208, "M", "Estudante", 7, 2, 1, 0); 
INSERT INTO PARTICIPANTE
VALUES (99999999999, "Nome 9", 1990-11-01, 28, "Endereço 9", 0905, "Bairro 9", "Santos", 07132309, "fulano9@gmail.com", 991423209, "M", "Estudante", 7, 2, 1, 0); 
INSERT INTO PARTICIPANTE
VALUES (10101010100, "Nome 10", 1990-11-01, 28, "Endereço 10", 10, "Bairro 10", "Santos", 03123010, "fulano10@gmail.com", 991423210, "F", "Jornalista", 7, 2, 0, 1); 
INSERT INTO PARTICIPANTE
VALUES (10101010101, "Nome 11", 1990-11-01, 28, "Endereço 11", 11, "Bairro 11", "Fortaleza", 01323011, "fulano11@gmail.com", 991423211, "M", "Jornalista", 6, 3, 0, 1); 
INSERT INTO PARTICIPANTE
VALUES (10101010102, "Nome 12", 1990-11-01, 28, "Endereço 12", 12, "Bairro 12", "Fortaleza", 01323012, "fulano12@gmail.com", 991423212, "M", "Jornalista", 6, 3, 0, 1); 
INSERT INTO PARTICIPANTE
VALUES (10101010103, "Nome 13", 1990-11-01, 28, "Endereço 13", 13, "Bairro 13", "Fortaleza", 01323013, "fulano13@gmail.com", 991423213, "F", "Jornalista", 6, 3, 0, 1);
INSERT INTO PARTICIPANTE
VALUES (10101010104, "Nome 14", 1990-11-01, 28, "Endereço 14", 14, "Bairro 14", "Fortaleza", 01323014, "fulano14@gmail.com", 991423214, "F", "Jornalista", 6, 3, 0, 1); 
INSERT INTO PARTICIPANTE
VALUES (10101010105, "Nome 15", 1990-11-01, 28, "Endereço 15", 15, "Bairro 15", "Fortaleza", 01323015, "fulano15@gmail.com", 991423215, "M", "Estudante", 6, 3, 1, 0);
INSERT INTO PARTICIPANTE
VALUES (20202020200, "Nome 20", 1990-11-01, 28, "Endereço 20", 20, "Bairro 20", "Manaus", 01323020, "fulano20@gmail.com", 991423220, "F", "Vendedor", 1, 4, 0, 1);
INSERT INTO PARTICIPANTE
VALUES (20202020201, "Nome 21", 1990-11-01, 28, "Endereço 21", 21, "Bairro 21", "Manaus", 01323021, "fulano21@gmail.com", 991423221, "M", "Vendedor", 2, 4, 0, 1);
INSERT INTO PARTICIPANTE
VALUES (20202020203, "Nome 23", 1990-11-01, 28, "Endereço 23", 23, "Bairro 23", "Manaus", 01323023, "fulano23@gmail.com", 991423223, "M", "Vendedor", 3, 4, 0, 1);
INSERT INTO PARTICIPANTE
VALUES (20202020204, "Nome 24", 1990-11-01, 28, "Endereço 24", 24, "Bairro 24", "Manaus", 01323024, "fulano24@gmail.com", 991423224, "M", "Vendedor", 1, 4, 0, 1);
INSERT INTO PARTICIPANTE
VALUES (20202020205, "Nome 25", 1990-11-01, 28, "Endereço 25", 25, "Bairro 25", "Manaus", 01323025, "fulano25@gmail.com", 991423225, "F", "Vendedor", 2, 4, 0, 1);
INSERT INTO PARTICIPANTE
VALUES (30303030300, "Nome 30", 1990-11-01, 28, "Endereço 30", 30, "Bairro 30", "Goiânia", 01323030, "fulano30@gmail.com", 991423230, "F", "Professor", 8, 5, 0, 1);
INSERT INTO PARTICIPANTE
VALUES (30303030301, "Nome 31", 1990-11-01, 28, "Endereço 31", 31, "Bairro 31", "Goiânia", 01323031, "fulano31@gmail.com", 991423231, "F", "Professor", 8, 5, 0, 1);
INSERT INTO PARTICIPANTE
VALUES (30303030302, "Nome 32", 1990-11-01, 28, "Endereço 32", 32, "Bairro 32", "Goiânia", 01323032, "fulano32@gmail.com", 991423232, "M", "Professor", 8, 5, 0, 1);
INSERT INTO PARTICIPANTE
VALUES (40404040400, "Nome 40", 1990-11-01, 28, "Endereço 40", 40, "Bairro 40", "Goiânia", 01323040, "fulano40@gmail.com", 991423240, "F", "Professor", 8, 5, 0, 1);
INSERT INTO PARTICIPANTE
VALUES (40404040401, "Nome 41", 1990-11-01, 28, "Endereço 41", 41, "Bairro 41", "Goiânia", 01323041, "fulano41@gmail.com", 991423241, "M", "Professor", 8, 5, 0, 1);

create table PRODUTO (
     id_produto numeric(1) not null,
     nome varchar(1) not null,
     tipo_produto varchar(1) not null,
     descricao varchar(1) not null,
     cpf numeric(11) not null,
     constraint ID_PRODUTO_ID primary key (id_produto));

INSERT INTO PRODUTO VALUES
(1, "Playstation 4", "Eletrônico", "Descrição 1", 20202020200),
(2, "Geléia de morango", "Alimentos", "Descrição 2", 20202020201),
(3, "Cone trufado", "Alimentos", "Descrição 3", 20202020203),
(4, "Readshift", "Data Warehouse", "Descrição 4", 20202020204),
(5, "IBM Watson", "Serviços", "Descrição 5", 20202020205);

create table VEICULO_COMUNICACAO (
     codigo_vc char(1) not null,
     nome_vc char(1) not null,
     meio_comunicacao varchar(1) not null,
     constraint ID_VEICULO_COMUNICACAO_ID primary key (codigo_vc));

INSERT INTO VEICULO_COMUNICACAO VALUES
(1, "Nome 1", "Meio 1"),
(2, "Nome 2", "Meio 2"),
(3, "Nome 3", "Meio 3"),
(4, "Nome 4", "Meio 4"),
(5, "Nome 5", "Meio 5");

-- Constraints Section
-- ___________________ 

alter table APRESENTA_1 add constraint EQU_APRES_PAINE_FK
     foreign key (cpf)
     references PAINELISTA;

alter table APRESENTA_1 add constraint REF_APRES_ATIVI
     foreign key (id_atividade)
     references ATIVIDADE;

alter table ATIVIDADE add constraint EQU_ATIVI_PALES_FK
     foreign key (cpf_palestrante)
     references PALESTRANTE;

alter table BARRACA add constraint SID_BARRA_PARTI_FK
     foreign key (cpf)
     references PARTICIPANTE;

alter table CARAVANA add constraint ID_CARAVANA_CHK
     check(exists(select * from PARTICIPANTE
                  where PARTICIPANTE.id_caravana = id_caravana)); 

alter table CARAVANA add constraint ID_CARAVANA_CHK
     check(exists(select * from ONIBUS
                  where ONIBUS.id_caravana = id_caravana)); 

alter table COBRE add constraint REF_COBRE_JORNA_FK
     foreign key (cpf)
     references JORNALISTA;

alter table COBRE add constraint REF_COBRE_ATIVI
     foreign key (id_atividade)
     references ATIVIDADE;

alter table EFETUA add constraint ID_EFETU_PARTI_FK
     foreign key (cpf)
     references PARTICIPANTE;

alter table EFETUA add constraint SID_EFETU_INSCR_FK
     foreign key (id_inscricao)
     references INSCRICAO;

alter table EMPREGA add constraint EQU_EMPRE_VEICU
     foreign key (codigo_vc)
     references VEICULO_COMUNICACAO;

alter table EMPREGA add constraint REF_EMPRE_JORNA_FK
     foreign key (cpf)
     references JORNALISTA;

alter table EXPOSITOR add constraint ID_EXPOS_ISENT_CHK
     check(exists(select * from PRODUTO
                  where PRODUTO.cpf = cpf)); 

alter table EXPOSITOR add constraint ID_EXPOS_ISENT_FK
     foreign key (cpf)
     references ISENTO;

alter table INSCRICAO add constraint ID_INSCRICAO_CHK
     check(exists(select * from EFETUA
                  where EFETUA.id_inscricao = id_inscricao)); 

alter table ISENTO add constraint EXTONE_ISENTO
     check((JORNALISTA is not null and PALESTRANTE is null and EXPOSITOR is null and PAINELISTA is null)
           or (JORNALISTA is null and PALESTRANTE is not null and EXPOSITOR is null and PAINELISTA is null)
           or (JORNALISTA is null and PALESTRANTE is null and EXPOSITOR is not null and PAINELISTA is null)
           or (JORNALISTA is null and PALESTRANTE is null and EXPOSITOR is null and PAINELISTA is not null)); 

alter table ISENTO add constraint ID_ISENT_PARTI_FK
     foreign key (cpf)
     references PARTICIPANTE;

alter table JORNALISTA add constraint ID_JORNA_ISENT_FK
     foreign key (cpf)
     references ISENTO;

alter table MATERIA add constraint REF_MATER_JORNA
     foreign key (cpf)
     references JORNALISTA;

alter table ONIBUS add constraint ID_ONIBUS_CHK
     check(exists(select * from PARTICIPANTE
                  where PARTICIPANTE.id_onibus = id_onibus)); 

alter table ONIBUS add constraint EQU_ONIBU_CARAV_FK
     foreign key (id_caravana)
     references CARAVANA;

alter table PAGANTE add constraint ID_PAGAN_PARTI_FK
     foreign key (cpf)
     references PARTICIPANTE;

alter table PAINELISTA add constraint ID_PAINE_ISENT_CHK
     check(exists(select * from APRESENTA_1
                  where APRESENTA_1.cpf = cpf)); 

alter table PAINELISTA add constraint ID_PAINE_ISENT_FK
     foreign key (cpf)
     references ISENTO;

alter table PALESTRANTE add constraint ID_PALES_ISENT_CHK
     check(exists(select * from ATIVIDADE
                  where ATIVIDADE.cpf_palestrante = cpf)); 

alter table PALESTRANTE add constraint ID_PALES_ISENT_FK
     foreign key (cpf)
     references ISENTO;

alter table PARTICIPA add constraint REF_PARTI_PARTI_FK
     foreign key (cpf)
     references PARTICIPANTE;

alter table PARTICIPA add constraint REF_PARTI_ATIVI
     foreign key (id_atividade)
     references ATIVIDADE;

alter table PARTICIPANTE add constraint ID_PARTICIPANTE_CHK
     check(exists(select * from EFETUA
                  where EFETUA.cpf = cpf)); 

alter table PARTICIPANTE add constraint EXTONE_PARTICIPANTE
     check((ISENTO is not null and PAGANTE is null)
           or (ISENTO is null and PAGANTE is not null)); 

alter table PARTICIPANTE add constraint EQU_PARTI_ONIBU_FK
     foreign key (id_onibus)
     references ONIBUS;

alter table PARTICIPANTE add constraint EQU_PARTI_CARAV_FK
     foreign key (id_caravana)
     references CARAVANA;

alter table PRODUTO add constraint EQU_PRODU_EXPOS_FK
     foreign key (cpf)
     references EXPOSITOR;

alter table VEICULO_COMUNICACAO add constraint ID_VEICULO_COMUNICACAO_CHK
     check(exists(select * from EMPREGA
                  where EMPREGA.codigo_vc = codigo_vc)); 


-- Index Section
-- _____________ 

create unique index ID_APRESENTA_1_IND
     on APRESENTA_1 (id_atividade, cpf);

create index EQU_APRES_PAINE_IND
     on APRESENTA_1 (cpf);

create unique index ID_ATIVIDADE_IND
     on ATIVIDADE (id_atividade);

create index EQU_ATIVI_PALES_IND
     on ATIVIDADE (cpf_palestrante);

create unique index ID_BARRACA_IND
     on BARRACA (id_barraca);

create unique index SID_BARRA_PARTI_IND
     on BARRACA (cpf);

create unique index ID_CARAVANA_IND
     on CARAVANA (id_caravana);

create unique index ID_COBRE_IND
     on COBRE (id_atividade, cpf);

create index REF_COBRE_JORNA_IND
     on COBRE (cpf);

create unique index ID_EFETU_PARTI_IND
     on EFETUA (cpf);

create unique index SID_EFETU_INSCR_IND
     on EFETUA (id_inscricao);

create unique index ID_EMPREGA_IND
     on EMPREGA (codigo_vc, cpf);

create index REF_EMPRE_JORNA_IND
     on EMPREGA (cpf);

create unique index ID_EXPOS_ISENT_IND
     on EXPOSITOR (cpf);

create unique index ID_INSCRICAO_IND
     on INSCRICAO (id_inscricao);

create unique index ID_ISENT_PARTI_IND
     on ISENTO (cpf);

create unique index ID_JORNA_ISENT_IND
     on JORNALISTA (cpf);

create unique index ID_MATERIA_IND
     on MATERIA (titulo);

create unique index SID_MATERIA_IND
     on MATERIA (cpf, titulo);

create unique index ID_ONIBUS_IND
     on ONIBUS (id_onibus);

create index EQU_ONIBU_CARAV_IND
     on ONIBUS (id_caravana);

create unique index ID_PAGAN_PARTI_IND
     on PAGANTE (cpf);

create unique index ID_PAINE_ISENT_IND
     on PAINELISTA (cpf);

create unique index ID_PALES_ISENT_IND
     on PALESTRANTE (cpf);

create unique index ID_PARTICIPA_IND
     on PARTICIPA (id_atividade, cpf);

create index REF_PARTI_PARTI_IND
     on PARTICIPA (cpf);

create unique index ID_PARTICIPANTE_IND
     on PARTICIPANTE (cpf);

create index EQU_PARTI_ONIBU_IND
     on PARTICIPANTE (id_onibus);

create index EQU_PARTI_CARAV_IND
     on PARTICIPANTE (id_caravana);

create unique index ID_PRODUTO_IND
     on PRODUTO (id_produto);

create index EQU_PRODU_EXPOS_IND
     on PRODUTO (cpf);

create unique index ID_VEICULO_COMUNICACAO_IND
     on VEICULO_COMUNICACAO (codigo_vc);

