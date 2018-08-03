CREATE TABLE [etl].[Task]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[BatchID] [int] NOT NULL CONSTRAINT [DF__Task__BatchID__28DE5EF0] DEFAULT ((0)),
[ExecutionOrder] [int] NOT NULL CONSTRAINT [DF__Task__ExecutionO__29D28329] DEFAULT ((1)),
[TaskName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__TaskName__2AC6A762] DEFAULT ('Not Specified'),
[TaskType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__TaskType__2BBACB9B] DEFAULT ('Not Specified'),
[SQL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__SQL__2CAEEFD4] DEFAULT (NULL),
[Target] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__Target__2DA3140D] DEFAULT (NULL),
[Source] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__Source__2E973846] DEFAULT (NULL),
[CustomMatchOn] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__CustomMatc__2F8B5C7F] DEFAULT (NULL),
[ExcludeColumns] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Task__ExcludeCol__307F80B8] DEFAULT (NULL),
[Execute] [bit] NULL CONSTRAINT [DF__Task__Execute__3173A4F1] DEFAULT ((0)),
[FailBatchOnFailure] [bit] NULL CONSTRAINT [DF__Task__FailBatchO__3267C92A] DEFAULT ((1)),
[SuppressResults] [bit] NULL CONSTRAINT [DF__Task__SuppressRe__335BED63] DEFAULT ((0)),
[RunSQL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [bit] NULL CONSTRAINT [DF__Task__Active__3450119C] DEFAULT ((1)),
[CREATED_DATE] [datetime] NOT NULL CONSTRAINT [DF__Task__CREATED_DA__354435D5] DEFAULT ([etl].[ConvertToLocalTime](getdate())),
[LUPDATED_DATE] [datetime] NOT NULL CONSTRAINT [DF__Task__LUPDATED_D__36385A0E] DEFAULT ([etl].[ConvertToLocalTime](getdate()))
)
GO
ALTER TABLE [etl].[Task] ADD CONSTRAINT [PK__Task__3214EC27C86DF777] PRIMARY KEY CLUSTERED  ([ID])
GO
