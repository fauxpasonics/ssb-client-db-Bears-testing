CREATE TABLE [dbo].[DimEvent]
(
[DimEventId] [int] NOT NULL IDENTITY(1, 1),
[DimArenaId] [int] NOT NULL,
[DimSeasonId] [int] NOT NULL,
[DimEventHeaderId] [int] NOT NULL,
[EventCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EventName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EventDesc] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EventClass] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EventDateTime] [datetime] NULL,
[EventDate] [date] NULL,
[EventTime] [time] NULL,
[EventStatus] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Capacity] [int] NULL,
[Attendance] [int] NULL,
[ScanEventId] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ManifestId] [int] NULL,
[SSCreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSUpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSCreatedDate] [datetime] NULL,
[SSUpdatedDate] [datetime] NULL,
[SSID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSID_event_id] [int] NULL,
[SourceSystem] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DeltaHashKey] [binary] (32) NULL,
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_DimEvent_CreateDate] DEFAULT (getdate()),
[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_DimEvent_UpdateDate] DEFAULT (getdate()),
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_DimEvent_DeleteFlag] DEFAULT ((0)),
[DeleteDate] [datetime] NULL,
[IsClosed] [bit] NOT NULL CONSTRAINT [DF__DimEvent__IsClos__51300E55] DEFAULT ((0)),
[IsInventoryEligible] [bit] NULL,
[MajorCategoryTM] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MinorCategoryTM] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Config_IsRealTimeAttendanceEnabled] [bit] NULL,
[EventOpenTime] [datetime] NULL,
[EventFinishTime] [datetime] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_dbo__DimEvent] ON [dbo].[DimEvent]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_LoadKey] ON [dbo].[DimEvent] ([SourceSystem], [SSID_event_id])
GO
CREATE NONCLUSTERED INDEX [IX_UpdatedDate] ON [dbo].[DimEvent] ([UpdatedDate] DESC)
GO
