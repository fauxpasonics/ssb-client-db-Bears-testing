CREATE TABLE [ods].[Eloqua_ContactUsForm]
(
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NULL,
[ETL__UpdatedDate] [datetime] NULL,
[ID] [int] NULL,
[ContactId] [int] NULL,
[CreatedAt] [datetime] NULL,
[year] [int] NULL,
[month] [int] NULL,
[day] [int] NULL,
[lastName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[firstName] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[emailAddress] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[address1] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[stateOrProvince] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zipOrPostalCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[singleLineText] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contactUsReason] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[comments] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[birthDate] [datetime] NULL,
[submit] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
