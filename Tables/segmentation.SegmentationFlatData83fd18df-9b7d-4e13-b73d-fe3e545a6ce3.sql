CREATE TABLE [segmentation].[SegmentationFlatData83fd18df-9b7d-4e13-b73d-fe3e545a6ce3]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerSourceSystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
ALTER TABLE [segmentation].[SegmentationFlatData83fd18df-9b7d-4e13-b73d-fe3e545a6ce3] ADD CONSTRAINT [pk_SegmentationFlatData83fd18df-9b7d-4e13-b73d-fe3e545a6ce3] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData83fd18df-9b7d-4e13-b73d-fe3e545a6ce3] ON [segmentation].[SegmentationFlatData83fd18df-9b7d-4e13-b73d-fe3e545a6ce3] ([_rn])
GO
