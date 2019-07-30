SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Create tables, import data for test, etc */
CREATE TABLE [dbo].[test]
(
 [id] Int IDENTITY(1,1) NOT NULL,
 [integerColumn] Int DEFAULT(NULL) NULL,
 [uuidColumn] Uniqueidentifier DEFAULT(NULL) NULL,
 [varcharColumn] Varchar(45) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT (NULL) NULL,
 [datetime2Column] Datetime2 DEFAULT (NULL) NULL,
 [datetimeColumn] Datetime DEFAULT (NULL) NULL
)
go

ALTER TABLE [dbo].[test] ADD CONSTRAINT [PK_test] PRIMARY KEY ([id])
go
