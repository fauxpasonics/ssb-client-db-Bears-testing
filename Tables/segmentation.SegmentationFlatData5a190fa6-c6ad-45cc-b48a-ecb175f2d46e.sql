CREATE TABLE [segmentation].[SegmentationFlatData5a190fa6-c6ad-45cc-b48a-ecb175f2d46e]
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
ALTER TABLE [segmentation].[SegmentationFlatData5a190fa6-c6ad-45cc-b48a-ecb175f2d46e] ADD CONSTRAINT [pk_SegmentationFlatData5a190fa6-c6ad-45cc-b48a-ecb175f2d46e] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatData5a190fa6-c6ad-45cc-b48a-ecb175f2d46e] ON [segmentation].[SegmentationFlatData5a190fa6-c6ad-45cc-b48a-ecb175f2d46e] ([_rn])
GO
