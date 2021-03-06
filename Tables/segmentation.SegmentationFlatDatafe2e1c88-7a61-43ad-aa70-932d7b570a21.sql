CREATE TABLE [segmentation].[SegmentationFlatDatafe2e1c88-7a61-43ad-aa70-932d7b570a21]
(
[id] [uniqueidentifier] NOT NULL,
[DocumentType] [varchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SessionId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Environment] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TenantId] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[_rn] [bigint] NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_ETL_IsDeleted] [bit] NOT NULL,
[C_ETL_DeletedDate] [datetime] NULL,
[C_ID] [int] NOT NULL,
[C_Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_AccountName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_BouncebackDate] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_IsBounceback] [bit] NULL,
[C_IsSubscribed] [bit] NULL,
[C_PostalCode] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Province] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SubscriptionDate] [datetime] NULL,
[C_UnsubscriptionDate] [datetime] NULL,
[C_CreatedAt] [datetime] NULL,
[C_CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_AccessedAt] [datetime] NULL,
[C_CurrentStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Depth] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_UpdatedAt] [datetime] NULL,
[C_UpdatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_EmailAddress] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_FirstName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_LastName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [segmentation].[SegmentationFlatDatafe2e1c88-7a61-43ad-aa70-932d7b570a21] ADD CONSTRAINT [pk_SegmentationFlatDatafe2e1c88-7a61-43ad-aa70-932d7b570a21] PRIMARY KEY NONCLUSTERED  ([id])
GO
CREATE CLUSTERED INDEX [cix_SegmentationFlatDatafe2e1c88-7a61-43ad-aa70-932d7b570a21] ON [segmentation].[SegmentationFlatDatafe2e1c88-7a61-43ad-aa70-932d7b570a21] ([_rn])
GO
