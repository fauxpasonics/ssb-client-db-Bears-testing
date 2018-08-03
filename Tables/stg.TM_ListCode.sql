CREATE TABLE [stg].[TM_ListCode]
(
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NULL CONSTRAINT [DF_TM_ListCode_ETL__CreatedDate] DEFAULT (getdate()),
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[value] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [stg].[TM_ListCode] ADD CONSTRAINT [PK__TM_Listc__C4EA2445A38D65A6] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO
