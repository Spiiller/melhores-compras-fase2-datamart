# Melhores Compras - Fase 2: Data Mart Índice Satisfação Entrega Produtos

Inclui modelagem dimensional snowflake para data mart de satisfação de entregas, scripts SQL, implementação de Oracle Autonomous Database na OCI, e trigger para auditoria de cartões de crédito.


## Objetivos
- **Data Mart Satisfação Entregas**: Modelo snowflake para responder perguntas como tempo médio de entrega por CD, notas por localização, distorções em datas, produtos por categoria.
- **Oracle Autonomous DB**: Provisionamento de DB "auditoriamc" na OCI, criação de usuário "AUDMC".
- **Auditoria via Trigger**: Controle de versão em T_MC_CARTAO_CREDITO_CLI com logs em T_MC_CARTAO_CREDITO_LOG (INSERT/UPDATE/DELETE).

## Tecnologias
- **Banco de Dados**: Oracle Autonomous Database (OCI), PL/SQL para triggers.
- **Modelagem**: Snowflake schema (ver docs/dimensional-fisico.pdf).
- **Dados**: Baseado em planilha "Dados_Entrega_CentroDistribuicao_v1.xlsx" (flattened table com colunas como NR_PEDIDO, NOTA_EMBALAGEM, etc.).

## Instalação e Uso
1. Clone: `git clone https://github.com/spiiller/melhores-compras-fase2-datamart.git`
2. Banco: No Oracle SQL Developer, rode `sql/apaga.sql` para limpar, então `sql/cria.sql` para criar dimensões (ex: DIM_PEDIDO, DIM_DATA, DIM_PRODUTO) e fato (Fato_Entrega_Produto).
3. Modelagem: Abra `docs/dimensional-fisico.pdf` para visualizar snowflake schema.
4. OCI DB: Veja `docs/PBL_FIAPOS_2TSCO_Fase2_item_1_3.docx` para passos de provisionamento e user creation.
5. Trigger/Auditoria: Veja `docs/PBL_FIAPOS_2TSCO_Fase2_item_1_4.docx` para criação de tabelas, trigger, sequence, e testes (3 INSERTs, 3 UPDATEs, 1 DELETE).

## Funcionalidades Principais
- **Modelo Snowflake**: Grão: NR_PEDIDO + NR_ITEM. Dimensões: DIM_PEDIDO, DIM_DATA (role-playing para pedido/previsão/entrega), DIM_ENTREGADOR, DIM_ESTADO, DIM_REGIAO, DIM_CENTRO_DISTRIBUICAO, DIM_PRODUTO, DIM_SUBCATEGORIA, DIM_CATEGORIA, DIM_CLIENTE, DIM_LOGRADOURO, DIM_BAIRRO, DIM_CIDADE.
- **Perguntas Atendidas**: Tempo médio entregas por CD/dia/mês/ano vs notas; Melhores CDs por notas; Médias por localização; Avaliações por tempo; Qtde prevista vs real; Distorções datas; Clientes satisfeitos por localização; Produtos por categoria; Totais por localização CD/ano/mês.
- **Oracle Autonomous DB**: DB "auditoriamc" provisionado; User "AUDMC" criado.
- **Trigger Auditoria**: Em T_MC_CARTAO_CREDITO_CLI; Logs em T_MC_CARTAO_CREDITO_LOG com sequence para ID_LOG. Testes: 3 INSERTs (novos valores; antigos NULL), 3 UPDATEs (novos/atualizados; antigos preenchidos), 1 DELETE (novos NULL; antigos preenchidos).

## Aprendizados
- Modelagem OLAP snowflake com hierarquias (ex: localização, categoria).
- Provisionamento OCI Autonomous DB e user management.
- Triggers PL/SQL para CDC/auditoria (FOR EACH ROW, :NEW/:OLD).

