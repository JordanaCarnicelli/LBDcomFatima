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
     tema_palestra varchar(50) not null,
     data_palestra date not null,
     hora_inicio date not null,
     hora_termino date not null,
     descricao varchar(100) not null,
     cpf varchar(11),
     constraint ID_PALESTRA_ID primary key (id_palestra));

create table PAINEL (
     id_painel numeric not null,
     tema_painel varchar(50) not null,
     data_painel date not null,
     descricao varchar(100) not null,
     aberto_publico char not null,
     constraint ID_PAINEL_ID primary key (id_painel));

create table BARRACA (
     id_barraca numeric not null,
     cpf varchar(11),
     modelo varchar(1) not null,
     marca varchar(1) not null,
     constraint ID_BARRACA_ID primary key (id_barraca),
     constraint SID_BARRA_PARTI_ID unique (cpf));

create table CARAVANA (
     id_caravana numeric not null,
     nome varchar(1) not null,
     cidade_origem varchar(1) not null,
     constraint ID_CARAVANA_ID primary key (id_caravana));

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

create table EXPOSITOR (
     cpf varchar(11) not null,
     nome_exposicao varchar(50) not null,
     tema_exposicao varchar(50) not null,
     constraint ID_EXPOS_ISENT_ID primary key (cpf));

create table ISENTO (
     cpf varchar(11) not null,
     PALESTRANTE varchar(11),
     PAINELISTA varchar(11),
     JORNALISTA varchar(11),
     EXPOSITOR varchar(11),
     constraint ID_ISENT_PARTI_ID primary key (cpf));

create table JORNALISTA (
     cpf varchar(11) not null,
     credencial numeric not null,
     especialidade varchar(1) not null,
     constraint ID_JORNA_ISENT_ID primary key (cpf));

create table MATERIA (
     id_materia numeric not null,
     titulo varchar(50) not null,
     assunto varchar(100) not null,
     data date not null,
     cpf varchar(11) not null,
     constraint ID_MATERIA_ID primary key (id_materia));

create table PAGANTE (
     cpf varchar(11) not null,
     valor_insc number(9,2) not null,
     constraint ID_PAGAN_PARTI_ID primary key (cpf));

create table PAINELISTA (
     cpf varchar(11) not null,
     especialidade varchar(50) not null,
     titulacao varchar(50) not null,
     constraint ID_PAINE_ISENT_ID primary key (cpf));

create table PALESTRANTE (
     cpf varchar(11) not null,
     especialidade varchar(50) not null,
     titulacao varchar(50) not null,
     constraint ID_PALES_ISENT_ID primary key (cpf));

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
     PAGANTE varchar(11),
     ISENTO varchar(11),
     id_endereco numeric not null,
     id_caravana numeric,
     constraint ID_PARTICIPANTE_ID primary key (cpf));

create table PRODUTO (
     id_produto numeric not null,
     nome varchar(50) not null,
     tipo_produto varchar(15) not null,
     descricao varchar(50) not null,
     quantidade_estoque numeric not null,
     preco number(9,2) not null,
     cpf varchar(11) not null,
     constraint ID_PRODUTO_ID primary key (id_produto));

create table APRESENTA_PN (
     cpf varchar(11) not null,
     id_painel numeric not null,
     constraint ID_APRESENTA_PN_ID primary key (id_painel, cpf));

create table ONIBUS_1 (
     id_onibus numeric not null,
     id_caravana numeric not null,
     modelo varchar(20) not null,
     capacidade numeric not null,
     constraint ID_ONIBUS_1_ID primary key (id_onibus),
     constraint SID_ONIBUS_1_ID unique (id_caravana, id_onibus));

create table TRABALHA_EM (
     cpf varchar(11) not null,
     codigo_vc numeric not null,
     constraint ID_TRABALHA_EM_ID primary key (codigo_vc, cpf));

create table VEICULO_COMUNICACAO (
     codigo_vc numeric not null,
     nome_vc varchar(100) not null,
     meio_comunicacao varchar(30) not null,
     constraint ID_VEICULO_COMUNICACAO_ID primary key (codigo_vc));


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

