-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2025-04-01 22:18:26 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g

-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
-- em: 2025-04-01 22:18:26 BRT
-- site: Oracle Database 11g
-- tipo: Oracle Database 11g

-- Criação das Tabelas

CREATE TABLE dim_bairro (
    id_bairro           INTEGER NOT NULL,
    id_cidade           INTEGER NOT NULL,
    nome_bairro         VARCHAR2(100) NOT NULL,
    nr_populacao_bairro INTEGER,
    nr_nivel_seguranca  INTEGER NOT NULL
);

COMMENT ON COLUMN dim_bairro.id_bairro IS
    'Esta coluna irá receber o identificador único do bairro e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_bairro.id_cidade IS
    'Esta coluna irá receber o identificador da cidade e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_bairro.nome_bairro IS
    'Esta coluna irá receber o nome do bairro e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_bairro.nr_populacao_bairro IS
    'Esta coluna irá receber o número da população do bairro e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_bairro.nr_nivel_seguranca IS
    'Esta coluna irá receber o nível de segurança do bairro e seu conteúdo é obrigatório.';

ALTER TABLE dim_bairro ADD CONSTRAINT dim_bairro_pk PRIMARY KEY ( id_bairro );

CREATE TABLE dim_categoria (
    id_categoria           INTEGER NOT NULL,
    categoria              VARCHAR2(100) NOT NULL,
    st_categoria           CHAR(1) NOT NULL,
    nr_avaliacao_categoria NUMBER(3, 2) NOT NULL
);

COMMENT ON COLUMN dim_categoria.id_categoria IS
    'Esta coluna irá receber o identificador único da categoria e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_categoria.categoria IS
    'Esta coluna irá receber o nome da categoria e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_categoria.st_categoria IS
    'Esta coluna irá receber o status da categoria (A para ativo, I para inativo) e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_categoria.nr_avaliacao_categoria IS
    'Esta coluna irá receber a nota de avaliação média da categoria e seu conteúdo é obrigatório.';

ALTER TABLE dim_categoria ADD CONSTRAINT dim_categoria_pk PRIMARY KEY ( id_categoria );

CREATE TABLE dim_centro_distribuicao (
    id_centro_distribuicao   INTEGER NOT NULL,
    id_logradouro_cd         INTEGER NOT NULL,
    cd_cd                    VARCHAR2(10) NOT NULL,
    nome_centro_distribuicao VARCHAR2(200) NOT NULL
);

COMMENT ON COLUMN dim_centro_distribuicao.id_centro_distribuicao IS
    'Esta coluna irá receber o identificador único do centro de distribuição e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_centro_distribuicao.id_logradouro_cd IS
    'Esta coluna irá receber o identificador do logradouro do centro de distribuição e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_centro_distribuicao.cd_cd IS
    'Esta coluna irá receber o código do centro de distribuição e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_centro_distribuicao.nome_centro_distribuicao IS
    'Esta coluna irá receber o nome do centro de distribuição e seu conteúdo é obrigatório.';

ALTER TABLE dim_centro_distribuicao ADD CONSTRAINT dim_centro_dist_pk PRIMARY KEY ( id_centro_distribuicao );

CREATE TABLE dim_cidade (
    id_cidade    INTEGER NOT NULL,
    id_estado    INTEGER NOT NULL,
    nome_cidade  VARCHAR2(100) NOT NULL,
    nr_populacao INTEGER NOT NULL,
    codigo_ibge  INTEGER NOT NULL,
    altitude     INTEGER NOT NULL
);

COMMENT ON COLUMN dim_cidade.id_cidade IS
    'Esta coluna irá receber o identificador único da cidade e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_cidade.id_estado IS
    'Esta coluna irá receber o identificador do estado e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_cidade.nome_cidade IS
    'Esta coluna irá receber o nome da cidade e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_cidade.nr_populacao IS
    'Esta coluna irá receber o número da população da cidade e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_cidade.codigo_ibge IS
    'Esta coluna irá receber o código IBGE da cidade e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_cidade.altitude IS
    'Esta coluna irá receber a altitude da cidade e seu conteúdo é obrigatório.';

ALTER TABLE dim_cidade ADD CONSTRAINT dim_cidade_pk PRIMARY KEY ( id_cidade );

CREATE TABLE dim_cliente (
    id_cliente            INTEGER NOT NULL,
    id_logradouro_cliente INTEGER NOT NULL,
    nome_cliente          VARCHAR2(200) NOT NULL,
    dt_nascimento         DATE NOT NULL,
    st_cliente            CHAR(1) NOT NULL,
    nr_estrelas           INTEGER NOT NULL
);

COMMENT ON COLUMN dim_cliente.id_cliente IS
    'Esta coluna irá receber o identificador único do cliente e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_cliente.id_logradouro_cliente IS
    'Esta coluna irá receber o identificador do logradouro do cliente e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_cliente.nome_cliente IS
    'Esta coluna irá receber o nome do cliente e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_cliente.dt_nascimento IS
    'Esta coluna irá receber a data de nascimento do cliente e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_cliente.st_cliente IS
    'Esta coluna irá receber o status do cliente (A para ativo, I para inativo) e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_cliente.nr_estrelas IS
    'Esta coluna irá receber o número de estrelas do cliente e seu conteúdo é obrigatório.';

ALTER TABLE dim_cliente ADD CONSTRAINT dim_cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE dim_data (
    id_data       INTEGER NOT NULL,
    data_completa TIMESTAMP NOT NULL,
    dia           INTEGER NOT NULL,
    mes           INTEGER NOT NULL,
    ano           INTEGER NOT NULL,
    hora          INTEGER NOT NULL,
    minuto        INTEGER NOT NULL
);

COMMENT ON COLUMN dim_data.id_data IS
    'Esta coluna irá receber o identificador único da data e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_data.data_completa IS
    'Esta coluna irá receber a data completa (com hora) e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_data.dia IS
    'Esta coluna irá receber o dia da data e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_data.mes IS
    'Esta coluna irá receber o mês da data e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_data.ano IS
    'Esta coluna irá receber o ano da data e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_data.hora IS
    'Esta coluna irá receber a hora da data e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_data.minuto IS
    'Esta coluna irá receber o minuto da data e seu conteúdo é obrigatório.';

ALTER TABLE dim_data ADD CONSTRAINT dim_data_pk PRIMARY KEY ( id_data );

CREATE TABLE dim_entregador (
    id_entregador   INTEGER NOT NULL,
    nome_entregador VARCHAR2(200) NOT NULL
);

COMMENT ON COLUMN dim_entregador.id_entregador IS
    'Esta coluna irá receber o identificador único do entregador e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_entregador.nome_entregador IS
    'Esta coluna irá receber o nome do entregador e seu conteúdo é obrigatório.';

ALTER TABLE dim_entregador ADD CONSTRAINT dim_entregador_pk PRIMARY KEY ( id_entregador );

CREATE TABLE dim_estado (
    id_estado    INTEGER NOT NULL,
    id_regiao    INTEGER NOT NULL,
    sigla_estado CHAR(2) NOT NULL,
    nome_estado  VARCHAR2(50) NOT NULL,
    gentilico    VARCHAR2(50)
);

COMMENT ON COLUMN dim_estado.id_estado IS
    'Esta coluna irá receber o identificador único do estado e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_estado.id_regiao IS
    'Esta coluna irá receber o identificador da região e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_estado.sigla_estado IS
    'Esta coluna irá receber a sigla do estado e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_estado.nome_estado IS
    'Esta coluna irá receber o nome do estado e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_estado.gentilico IS
    'Esta coluna irá receber o gentílico do estado e seu conteúdo é obrigatório.';

ALTER TABLE dim_estado ADD CONSTRAINT dim_estado_pk PRIMARY KEY ( id_estado );

CREATE TABLE dim_logradouro (
    id_logradouro   INTEGER NOT NULL,
    id_bairro       INTEGER NOT NULL,
    nome_logradouro VARCHAR2(200) NOT NULL,
    nr_logradouro   VARCHAR2(10) NOT NULL,
    nr_cep          CHAR(8) NOT NULL
);

COMMENT ON COLUMN dim_logradouro.id_logradouro IS
    'Esta coluna irá receber o identificador único do logradouro e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_logradouro.id_bairro IS
    'Esta coluna irá receber o identificador do bairro e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_logradouro.nome_logradouro IS
    'Esta coluna irá receber o nome do logradouro e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_logradouro.nr_logradouro IS
    'Esta coluna irá receber o número do logradouro e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_logradouro.nr_cep IS
    'Esta coluna irá receber o CEP do logradouro e seu conteúdo é obrigatório.';

ALTER TABLE dim_logradouro ADD CONSTRAINT dim_logradouro_pk PRIMARY KEY ( id_logradouro );

CREATE TABLE dim_pedido (
    id_pedido INTEGER NOT NULL,
    nr_pedido INTEGER NOT NULL,
    nr_item   INTEGER NOT NULL
);

COMMENT ON COLUMN dim_pedido.id_pedido IS
    'Esta coluna irá receber o identificador único do pedido e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_pedido.nr_pedido IS
    'Esta coluna irá receber o número do pedido e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_pedido.nr_item IS
    'Esta coluna irá receber o número do item do pedido e seu conteúdo é obrigatório.';

ALTER TABLE dim_pedido ADD CONSTRAINT dim_pedido_pk PRIMARY KEY ( id_pedido );

CREATE TABLE dim_produto (
    id_produto      INTEGER NOT NULL,
    id_subcategoria INTEGER NOT NULL,
    nome_produto    VARCHAR2(200) NOT NULL,
    embalagem       VARCHAR2(50) NOT NULL,
    vl_unitario     NUMBER(10, 2) NOT NULL,
    icms            NUMBER(4, 2) NOT NULL
);

COMMENT ON COLUMN dim_produto.id_produto IS
    'Esta coluna irá receber o identificador único do produto e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_produto.id_subcategoria IS
    'Esta coluna irá receber o identificador da subcategoria do produto e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_produto.nome_produto IS
    'Esta coluna irá receber o nome do produto e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_produto.embalagem IS
    'Esta coluna irá receber o tipo de embalagem do produto e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_produto.vl_unitario IS
    'Esta coluna irá receber o valor unitário do produto e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_produto.icms IS
    'Esta coluna irá receber o percentual de ICMS do produto e seu conteúdo é obrigatório.';

ALTER TABLE dim_produto ADD CONSTRAINT dim_produto_pk PRIMARY KEY ( id_produto );

CREATE TABLE dim_regiao (
    id_regiao   INTEGER NOT NULL,
    nome_regiao VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN dim_regiao.id_regiao IS
    'Esta coluna irá receber o identificador único da região e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_regiao.nome_regiao IS
    'Esta coluna irá receber o nome da região e seu conteúdo é obrigatório.';

ALTER TABLE dim_regiao ADD CONSTRAINT dim_regiao_pk PRIMARY KEY ( id_regiao );

CREATE TABLE dim_subcategoria (
    id_subcategoria            INTEGER NOT NULL,
    id_categoria               INTEGER NOT NULL,
    subcategoria               VARCHAR2(100) NOT NULL,
    st_sub_categoria           CHAR(1) NOT NULL,
    nr_avaliacao_sub_categoria NUMBER(3, 2) NOT NULL
);

COMMENT ON COLUMN dim_subcategoria.id_subcategoria IS
    'Esta coluna irá receber o identificador único da subcategoria e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_subcategoria.id_categoria IS
    'Esta coluna irá receber o identificador da categoria e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_subcategoria.subcategoria IS
    'Esta coluna irá receber o nome da subcategoria e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_subcategoria.st_sub_categoria IS
    'Esta coluna irá receber o status da subcategoria (A para ativo, I para inativo) e seu conteúdo é obrigatório.';
COMMENT ON COLUMN dim_subcategoria.nr_avaliacao_sub_categoria IS
    'Esta coluna irá receber a nota de avaliação média da subcategoria e seu conteúdo é obrigatório.';

ALTER TABLE dim_subcategoria ADD CONSTRAINT dim_subcategoria_pk PRIMARY KEY ( id_subcategoria );

CREATE TABLE fato_entrega_produto (
    id_fato                  INTEGER NOT NULL,
    id_pedido                INTEGER NOT NULL,
    nr_pedido                INTEGER NOT NULL,
    nr_item                  INTEGER NOT NULL,
    id_cliente               INTEGER NOT NULL,
    id_produto1              INTEGER NOT NULL,
    id_centro_distribuicao   INTEGER NOT NULL,
    id_data_pedido           INTEGER NOT NULL,
    id_data_prevista_entrega INTEGER NOT NULL,
    id_data_entrega_real     INTEGER NOT NULL,
    id_entregador            INTEGER NOT NULL,
    quantidade               INTEGER NOT NULL,
    qt_prod_entregue         INTEGER NOT NULL,
    vl_total                 NUMBER(10, 2) NOT NULL,
    nota_embalagem           INTEGER NOT NULL,
    nota_pontualidade        INTEGER NOT NULL,
    nota_cortesia            INTEGER NOT NULL
);

COMMENT ON COLUMN fato_entrega_produto.id_fato IS
    'Esta coluna irá receber o identificador único do fato e seu conteúdo é obrigatório.';
COMMENT ON COLUMN fato_entrega_produto.id_pedido IS
    'Esta coluna irá receber o identificador do pedido da dimensão Dim_Pedido e seu conteúdo é obrigatório.';
COMMENT ON COLUMN fato_entrega_produto.nr_pedido IS
    'Esta coluna irá receber o número do pedido como atributo de negócio e seu conteúdo é obrigatório.';
COMMENT ON COLUMN fato_entrega_produto.nr_item IS
    'Esta coluna irá receber o número do item como atributo de negócio e seu conteúdo é obrigatório.';
COMMENT ON COLUMN fato_entrega_produto.id_cliente IS
    'Esta coluna irá receber o identificador do cliente e seu conteúdo é obrigatório.';
COMMENT ON COLUMN fato_entrega_produto.id_produto1 IS
    'Esta coluna irá receber o identificador do produto e seu conteúdo é obrigatório.';
COMMENT ON COLUMN fato_entrega_produto.id_centro_distribuicao IS
    'Esta coluna irá receber o identificador do centro de distribuição e seu conteúdo é obrigatório.';
COMMENT ON COLUMN fato_entrega_produto.id_data_pedido IS
    'Esta coluna irá receber o identificador da data do pedido e seu conteúdo é obrigatório.';
COMMENT ON COLUMN fato_entrega_produto.id_data_prevista_entrega IS
    'Esta coluna irá receber o identificador da data prevista de entrega e seu conteúdo é obrigatório.';
COMMENT ON COLUMN fato_entrega_produto.id_data_entrega_real IS
    'Esta coluna irá receber o identificador da data real de entrega e seu conteúdo é obrigatório.';
COMMENT ON COLUMN fato_entrega_produto.id_entregador IS
    'Esta coluna irá receber o identificador único do entregador e seu conteúdo é obrigatório.';
COMMENT ON COLUMN fato_entrega_produto.quantidade IS
    'Esta coluna irá receber a quantidade solicitada do produto e seu conteúdo é obrigatório.';
COMMENT ON COLUMN fato_entrega_produto.qt_prod_entregue IS
    'Esta coluna irá receber a quantidade entregue do produto e seu conteúdo é obrigatório.';
COMMENT ON COLUMN fato_entrega_produto.vl_total IS
    'Esta coluna irá receber o valor total do item e seu conteúdo é obrigatório.';
COMMENT ON COLUMN fato_entrega_produto.nota_embalagem IS
    'Esta coluna irá receber a nota de avaliação da embalagem e seu conteúdo é obrigatório.';
COMMENT ON COLUMN fato_entrega_produto.nota_pontualidade IS
    'Esta coluna irá receber a nota de avaliação da pontualidade e seu conteúdo é obrigatório.';
COMMENT ON COLUMN fato_entrega_produto.nota_cortesia IS
    'Esta coluna irá receber a nota de avaliação da cortesia e seu conteúdo é obrigatório.';

ALTER TABLE fato_entrega_produto ADD CONSTRAINT fato_entrega_pk PRIMARY KEY ( id_fato );

-- Chaves Estrangeiras com Nomes Abreviados
ALTER TABLE dim_bairro
    ADD CONSTRAINT fk_bairro_cidade FOREIGN KEY ( id_cidade )
        REFERENCES dim_cidade ( id_cidade );

ALTER TABLE dim_centro_distribuicao
    ADD CONSTRAINT fk_centro_logradouro FOREIGN KEY ( id_logradouro_cd )
        REFERENCES dim_logradouro ( id_logradouro );

ALTER TABLE dim_cidade
    ADD CONSTRAINT fk_cidade_estado FOREIGN KEY ( id_estado )
        REFERENCES dim_estado ( id_estado );

ALTER TABLE dim_cliente
    ADD CONSTRAINT fk_cliente_logradouro FOREIGN KEY ( id_logradouro_cliente )
        REFERENCES dim_logradouro ( id_logradouro );

ALTER TABLE dim_estado
    ADD CONSTRAINT fk_estado_regiao FOREIGN KEY ( id_regiao )
        REFERENCES dim_regiao ( id_regiao );

ALTER TABLE dim_logradouro
    ADD CONSTRAINT fk_logradouro_bairro FOREIGN KEY ( id_bairro )
        REFERENCES dim_bairro ( id_bairro );

ALTER TABLE dim_produto
    ADD CONSTRAINT fk_produto_subcat FOREIGN KEY ( id_subcategoria )
        REFERENCES dim_subcategoria ( id_subcategoria );

ALTER TABLE dim_subcategoria
    ADD CONSTRAINT fk_subcat_categoria FOREIGN KEY ( id_categoria )
        REFERENCES dim_categoria ( id_categoria );

ALTER TABLE fato_entrega_produto
    ADD CONSTRAINT fk_fato_centro_dist FOREIGN KEY ( id_centro_distribuicao )
        REFERENCES dim_centro_distribuicao ( id_centro_distribuicao );

ALTER TABLE fato_entrega_produto
    ADD CONSTRAINT fk_fato_cliente FOREIGN KEY ( id_cliente )
        REFERENCES dim_cliente ( id_cliente );

ALTER TABLE fato_entrega_produto
    ADD CONSTRAINT fk_fato_data_pedido FOREIGN KEY ( id_data_pedido )
        REFERENCES dim_data ( id_data );

ALTER TABLE fato_entrega_produto
    ADD CONSTRAINT fk_fato_data_prevista FOREIGN KEY ( id_data_prevista_entrega )
        REFERENCES dim_data ( id_data );

ALTER TABLE fato_entrega_produto
    ADD CONSTRAINT fk_fato_data_real FOREIGN KEY ( id_data_entrega_real )
        REFERENCES dim_data ( id_data );

ALTER TABLE fato_entrega_produto
    ADD CONSTRAINT fk_fato_entregador FOREIGN KEY ( id_entregador )
        REFERENCES dim_entregador ( id_entregador );

ALTER TABLE fato_entrega_produto
    ADD CONSTRAINT fk_fato_pedido FOREIGN KEY ( id_pedido )
        REFERENCES dim_pedido ( id_pedido );

ALTER TABLE fato_entrega_produto
    ADD CONSTRAINT fk_fato_produto FOREIGN KEY ( id_produto1 )
        REFERENCES dim_produto ( id_produto );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             0
-- ALTER TABLE                             28
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
