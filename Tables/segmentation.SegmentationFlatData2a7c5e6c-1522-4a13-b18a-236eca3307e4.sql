CREATE TABLE [segmentation].[SegmentationFlatData2a7c5e6c-1522-4a13-b18a-236eca3307e4]
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
ALTER TABLE [segmentation].[SegmentationFlatData2a7c5e6c-1522-4a13-b18a-236eca3307e4] ADD CONSTRAINT [pk_SegmentationFlatData2a7c5e6c-1522-4a13-b18a-236eca3307e4] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData2a7c5e6c-1522-4a13-b18a-236eca3307e4] ON [segmentation].[SegmentationFlatData2a7c5e6c-1522-4a13-b18a-236eca3307e4] ([_rn])
GO
