CREATE TABLE [dbo].[BearsEvents]
(
[DimEventId] [int] NOT NULL IDENTITY(1, 1),
[DimSeasonId] [int] NOT NULL,
[DimArenaId] [int] NOT NULL,
[EventCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EventName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EventClass] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
