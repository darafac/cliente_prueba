/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     20/02/2023 7:55:56 a. m.                     */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CABEZA_FACTURA') and o.name = 'FK_CABEZA_F_REFERENCE_DETALLE_')
alter table CABEZA_FACTURA
   drop constraint FK_CABEZA_F_REFERENCE_DETALLE_
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLIENTES') and o.name = 'FK_CLIENTES_REFERENCE_CABEZA_F')
alter table CLIENTES
   drop constraint FK_CLIENTES_REFERENCE_CABEZA_F
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLE_FACTURA') and o.name = 'FK_DETALLE__REFERENCE_PRODUCTO')
alter table DETALLE_FACTURA
   drop constraint FK_DETALLE__REFERENCE_PRODUCTO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CABEZA_FACTURA')
            and   name  = 'REFERENCE_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CABEZA_FACTURA.REFERENCE_2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CABEZA_FACTURA')
            and   type = 'U')
   drop table CABEZA_FACTURA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CLIENTES')
            and   name  = 'REFERENCE_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLIENTES.REFERENCE_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTES')
            and   type = 'U')
   drop table CLIENTES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_FACTURA')
            and   name  = 'REFERENCE_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_FACTURA.REFERENCE_3_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DETALLE_FACTURA')
            and   type = 'U')
   drop table DETALLE_FACTURA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRODUCTOS')
            and   type = 'U')
   drop table PRODUCTOS
go

/*==============================================================*/
/* Table: CABEZA_FACTURA                                        */
/*==============================================================*/
create table CABEZA_FACTURA (
   NUMERO               int                  not null,
   PRODUCTO             int                  not null,
   FECHA                datetime             null,
   CLIENTE              int                  not null,
   TOTAL                int                  null,
   constraint PK_CABEZA_FACTURA primary key nonclustered (NUMERO, PRODUCTO, CLIENTE)
)
go

/*==============================================================*/
/* Index: REFERENCE_2_FK                                        */
/*==============================================================*/
create index REFERENCE_2_FK on CABEZA_FACTURA (
NUMERO ASC,
PRODUCTO ASC
)
go

/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
create table CLIENTES (
   CLIENTES             int                  not null,
   NUMERO               int                  null,
   PRODUCTO             int                  null,
   CLIENTE              int                  null,
   NOMBRE_CLIENTE       varchar(50)          null,
   DIRECCION            varchar(30)          null,
   constraint PK_CLIENTES primary key nonclustered (CLIENTES)
)
go

/*==============================================================*/
/* Index: REFERENCE_1_FK                                        */
/*==============================================================*/
create index REFERENCE_1_FK on CLIENTES (
NUMERO ASC,
PRODUCTO ASC,
CLIENTE ASC
)
go

/*==============================================================*/
/* Table: DETALLE_FACTURA                                       */
/*==============================================================*/
create table DETALLE_FACTURA (
   NUMERO               int                  not null,
   PRODUCTO             int                  not null,
   CANTIDAD             int                  null,
   VALOR                int                  null,
   constraint PK_DETALLE_FACTURA primary key nonclustered (NUMERO, PRODUCTO)
)
go

/*==============================================================*/
/* Index: REFERENCE_3_FK                                        */
/*==============================================================*/
create index REFERENCE_3_FK on DETALLE_FACTURA (
PRODUCTO ASC
)
go

/*==============================================================*/
/* Table: PRODUCTOS                                             */
/*==============================================================*/
create table PRODUCTOS (
   PRODUCTO             int                  not null,
   NOMBRE_PRODUCTO      varchar(50)          null,
   VALOR                int                  null,
   constraint PK_PRODUCTOS primary key nonclustered (PRODUCTO)
)
go

alter table CABEZA_FACTURA
   add constraint FK_CABEZA_F_REFERENCE_DETALLE_ foreign key (NUMERO, PRODUCTO)
      references DETALLE_FACTURA (NUMERO, PRODUCTO)
go

alter table CLIENTES
   add constraint FK_CLIENTES_REFERENCE_CABEZA_F foreign key (NUMERO, PRODUCTO, CLIENTE)
      references CABEZA_FACTURA (NUMERO, PRODUCTO, CLIENTE)
go

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__REFERENCE_PRODUCTO foreign key (PRODUCTO)
      references PRODUCTOS (PRODUCTO)
go

