-- *********************************************
-- * Standard SQL generation                   
-- *--------------------------------------------
-- * DB-MAIN version: 10.0.3              
-- * Generator date: Aug 17 2017              
-- * Generation date: Fri Apr  6 09:27:31 2018 
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

create table ATIVIDADE (
     id_atividade numeric(1) not null,
     tipo_atividade varchar(1) not null,
     data date not null,
     hora_inicio varchar(1) not null,
     hora_termino varchar(1) not null,
     descricao varchar(1) not null,
     flag_ativ_virtual char(1) not null,
     cpf numeric(11) not null,
     constraint ID_ATIVIDADE_ID primary key (id_atividade));

create table BARRACA (
     id_barraca numeric(1) not null,
     cpf numeric(11),
     modelo varchar(1) not null,
     marca varchar(1) not null,
     constraint ID_BARRACA_ID primary key (id_barraca),
     constraint SID_BARRA_PARTI_ID unique (cpf));

create table CARAVANA (
     id_caravana numeric(1) not null,
     nome varchar(1) not null,
     cidade_origem varchar(1) not null,
     qtd_pessoas numeric(1) not null,
     constraint ID_CARAVANA_ID primary key (id_caravana));

create table COBRE (
     id_atividade numeric(1) not null,
     cpf numeric(11) not null,
     constraint ID_COBRE_ID primary key (id_atividade, cpf));

create table EFETUA (
     cpf numeric(11) not null,
     id_inscricao numeric(1) not null,
     custo float(1) not null,
     constraint ID_EFETU_PARTI_ID primary key (cpf),
     constraint SID_EFETU_INSCR_ID unique (id_inscricao));

create table EMPREGA (
     cpf numeric(11) not null,
     codigo_vc char(1) not null,
     constraint ID_EMPREGA_ID primary key (codigo_vc, cpf));

create table EXPOSITOR (
     cpf numeric(11) not null,
     titulo_exposicao varchar(50) not null,
     assunto_exposicao varchar(50) not null,
     constraint ID_EXPOS_ISENT_ID primary key (cpf));

create table INSCRICAO (
     id_inscricao numeric(1) not null,
     categoria varchar(1) not null,
     constraint ID_INSCRICAO_ID primary key (id_inscricao));

create table ISENTO (
     cpf numeric(11) not null,
     PALESTRANTE numeric(11),
     PAINELISTA numeric(11),
     JORNALISTA numeric(11),
     EXPOSITOR numeric(11),
     constraint ID_ISENT_PARTI_ID primary key (cpf));

create table JORNALISTA (
     cpf numeric(11) not null,
     credencial numeric(1) not null,
     especialidade varchar(1) not null,
     constraint ID_JORNA_ISENT_ID primary key (cpf));

create table MATERIA (
     titulo varchar(50) not null,
     cpf numeric(11) not null,
     assunto varchar(100) not null,
     data date not null,
     constraint ID_MATERIA_ID primary key (titulo),
     constraint SID_MATERIA_ID unique (cpf, titulo));

create table ONIBUS (
     id_onibus numeric(1) not null,
     modelo varchar(20) not null,
     capacidade numeric(1) not null,
     id_caravana numeric(1) not null,
     constraint ID_ONIBUS_ID primary key (id_onibus));

create table PAGANTE (
     cpf numeric(11) not null,
     constraint ID_PAGAN_PARTI_ID primary key (cpf));

create table PAINELISTA (
     cpf numeric(11) not null,
     titulo_painel varchar(1) not null,
     tema_painel varchar(1) not null,
     constraint ID_PAINE_ISENT_ID primary key (cpf));

create table PALESTRANTE (
     cpf numeric(11) not null,
     titulo_palestra varchar(1) not null,
     tema_palestra varchar(1) not null,
     data -- Sequence attribute not implemented -- not null,
     horario -- Sequence attribute not implemented -- not null,
     constraint ID_PALES_ISENT_ID primary key (cpf));

create table PARTICIPA (
     id_atividade numeric(1) not null,
     cpf numeric(11) not null,
     constraint ID_PARTICIPA_ID primary key (id_atividade, cpf));

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

create table PRODUTO (
     id_produto numeric(1) not null,
     nome varchar(1) not null,
     tipo_produto varchar(1) not null,
     descricao varchar(1) not null,
     quantidade_estoque numeric(1) not null,
     custo float(1) not null,
     cpf numeric(11) not null,
     constraint ID_PRODUTO_ID primary key (id_produto));

create table VEICULO_COMUNICACAO (
     codigo_vc char(1) not null,
     nome_vc char(1) not null,
     meio_comunicacao varchar(1) not null,
     constraint ID_VEICULO_COMUNICACAO_ID primary key (codigo_vc));


-- Constraints Section
-- ___________________ 

alter table APRESENTA_1 add constraint EQU_APRES_PAINE_FK
     foreign key (cpf)
     references PAINELISTA;

alter table APRESENTA_1 add constraint EQU_APRES_ATIVI
     foreign key (id_atividade)
     references ATIVIDADE;

alter table ATIVIDADE add constraint ID_ATIVIDADE_CHK
     check(exists(select * from APRESENTA_1
                  where APRESENTA_1.id_atividade = id_atividade)); 

alter table ATIVIDADE add constraint EQU_ATIVI_PALES_FK
     foreign key (cpf)
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
                  where ATIVIDADE.cpf = cpf)); 

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
     on ATIVIDADE (cpf);

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

