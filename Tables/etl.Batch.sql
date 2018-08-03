CREATE TABLE [etl].[Batch]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[ParentID] [int] NULL,
[SortOrder] [int] NULL,
[BatchName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BatchRefID] [int] NULL,
[SourceSchema] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TargetSchema] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceQuery] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TaskType] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SQL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExecuteInParallel] [bit] NULL CONSTRAINT [DF__Batch__ExecuteIn__0A59D7D0] DEFAULT ((0)),
[CustomMatchOn] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExcludeColumns] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Execute] [bit] NULL CONSTRAINT [DF__Batch__Execute__0B4DFC09] DEFAULT ((1)),
[FailBatchOnFailure] [bit] NULL CONSTRAINT [DF__Batch__FailBatch__0C422042] DEFAULT ((0)),
[SuppressResults] [bit] NULL CONSTRAINT [DF__Batch__SuppressR__0D36447B] DEFAULT ((0)),
[FKTables] [bit] NULL CONSTRAINT [DF__Batch__FKTables__0E2A68B4] DEFAULT ((0)),
[AddID] [bit] NULL CONSTRAINT [DF__Batch__AddID__0F1E8CED] DEFAULT ((0)),
[SnapshotTables] [bit] NULL CONSTRAINT [DF__Batch__SnapshotT__1012B126] DEFAULT ((0)),
[AzureTier] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [bit] NULL CONSTRAINT [DF__Batch__Active__1106D55F] DEFAULT ((1))
)
GO
ALTER TABLE [etl].[Batch] ADD CONSTRAINT [PK__Batch__3214EC27E9E50F34] PRIMARY KEY CLUSTERED  ([ID])
GO
ALTER TABLE [etl].[Batch] ADD CONSTRAINT [uc_BatchName] UNIQUE NONCLUSTERED  ([BatchName])
GO
