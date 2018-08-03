CREATE TABLE [stg].[FanCentric_EmailActivity]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__FanCentri__ETL_C__13FC4956] DEFAULT (getdate()),
[ETL_FileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMAIL_ADDR] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NFL_BUSINESS_UNIT] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MAILING_DT] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAMPAIGNS] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNDELIVERABLE] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OPENS] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CLICKS] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
