CREATE TABLE [tmarc].[RawFile__bear2012FULLFILECOUNTSF]
(
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[File_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Num_records] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bear2012] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
