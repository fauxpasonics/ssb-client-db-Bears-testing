CREATE TABLE [dbo].[DimSeat]
(
[DimSeatId] [int] NOT NULL IDENTITY(1, 1),
[DimArenaId] [int] NOT NULL,
[ManifestId] [smallint] NULL,
[SectionName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SectionDesc] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SectionSort] [int] NULL,
[RowName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RowSort] [int] NULL,
[Seat] [int] NULL,
[DefaultClass] [int] NULL,
[DefaultPriceCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSCreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSUpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSCreatedDate] [datetime] NULL,
[SSUpdatedDate] [datetime] NULL,
[SSID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSID_manifest_id] [int] NULL,
[SSID_section_id] [int] NULL,
[SSID_row_id] [int] NULL,
[SSID_seat] [int] NULL,
[SourceSystem] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DeltaHashKey] [binary] (32) NULL,
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_DimSeat_CreatedDate] DEFAULT (getdate()),
[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_DimSeat_UpdatedDate] DEFAULT (getdate()),
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_DimSeat_DeleteFlag] DEFAULT ((0)),
[DeleteDate] [datetime] NULL CONSTRAINT [DF_DimSeat_DeleteDate] DEFAULT ((0)),
[Config_Location] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Config_IsFactInventoryEligible] [bit] NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_dbo__DimSeat] ON [dbo].[DimSeat]
GO
CREATE NONCLUSTERED INDEX [DimSeat_SeatId] ON [dbo].[DimSeat] ([DimSeatId]) INCLUDE ([RowName], [SectionName])
GO
CREATE NONCLUSTERED INDEX [IX_UpdatedDate] ON [dbo].[DimSeat] ([UpdatedDate] DESC)
GO
