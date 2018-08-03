CREATE TABLE [segmentation].[SegmentationFlatDatad20224d9-2cc6-41e2-a8c5-e67942ece5f6]
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
ALTER TABLE [segmentation].[SegmentationFlatDatad20224d9-2cc6-41e2-a8c5-e67942ece5f6] ADD CONSTRAINT [pk_SegmentationFlatDatad20224d9-2cc6-41e2-a8c5-e67942ece5f6] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatDatad20224d9-2cc6-41e2-a8c5-e67942ece5f6] ON [segmentation].[SegmentationFlatDatad20224d9-2cc6-41e2-a8c5-e67942ece5f6] ([_rn])
GO
