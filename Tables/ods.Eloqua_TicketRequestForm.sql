CREATE TABLE [ods].[Eloqua_TicketRequestForm]
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
[zipOrPostalCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SingleGameTickets] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SeasonTickets] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriorityTickets] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GroupTickets] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Premium] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
