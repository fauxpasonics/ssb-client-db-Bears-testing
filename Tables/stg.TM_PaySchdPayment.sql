CREATE TABLE [stg].[TM_PaySchdPayment]
(
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NULL CONSTRAINT [DF_TM_PaySchdPayment_ETL__CreatedDate] DEFAULT (getdate()),
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_schedule_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[due_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[percent_due] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [stg].[TM_PaySchdPayment] ADD CONSTRAINT [PK__TM_Paysc__C4EA24458A3C7BAE] PRIMARY KEY CLUSTERED  ([ETL__ID])
GO
