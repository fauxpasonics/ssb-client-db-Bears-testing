CREATE TABLE [ods].[FanCentric_EmailActivity]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__FanCentri__ETL_C__102BB872] DEFAULT (getdate()),
[ETL_UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__FanCentri__ETL_U__111FDCAB] DEFAULT (getdate()),
[ETL_IsDeleted] [bit] NOT NULL CONSTRAINT [DF__FanCentri__ETL_I__121400E4] DEFAULT ((0)),
[ETL_DeletedDate] [datetime] NULL,
[ETL_DeltaHashKey] [binary] (32) NULL,
[ETL_FileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMAIL_ADDR] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NFL_BUSINESS_UNIT] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MAILING_DT] [date] NULL,
[CAMPAIGNS] [int] NULL,
[UNDELIVERABLE] [int] NULL,
[OPENS] [int] NULL,
[CLICKS] [int] NULL
)
GO
