CREATE TABLE [etl].[TM_ArchiveLoadMapping]
(
[TABLE_NAME] [sys].[sysname] NOT NULL,
[Export] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArchiveYear] [int] NULL,
[DataSetName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
