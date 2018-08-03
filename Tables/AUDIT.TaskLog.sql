CREATE TABLE [AUDIT].[TaskLog]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[BatchID] [int] NOT NULL,
[Created] [datetime] NULL CONSTRAINT [DF__TaskLog__Created__01C491CF] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[User] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TaskName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Target] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SQL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExecuteStart] [datetime] NULL,
[ExecuteEnd] [datetime] NULL,
[ExecutionRuntimeSeconds] AS (CONVERT([float],datediff(second,[ExecuteStart],[ExecuteEnd]),(0))),
[RowCountBefore] [int] NULL CONSTRAINT [DF__TaskLog__RowCoun__02B8B608] DEFAULT ((0)),
[RowCountAfter] [int] NULL CONSTRAINT [DF__TaskLog__RowCoun__03ACDA41] DEFAULT ((0)),
[Inserted] [int] NULL CONSTRAINT [DF__TaskLog__Inserte__04A0FE7A] DEFAULT ((0)),
[Updated] [int] NULL CONSTRAINT [DF__TaskLog__Updated__059522B3] DEFAULT ((0)),
[Deleted] [int] NULL CONSTRAINT [DF__TaskLog__Deleted__068946EC] DEFAULT ((0)),
[Truncated] [int] NULL CONSTRAINT [DF__TaskLog__Truncat__077D6B25] DEFAULT ((0)),
[IsCommitted] [bit] NULL CONSTRAINT [DF__TaskLog__IsCommi__08718F5E] DEFAULT ((0)),
[IsError] [bit] NULL CONSTRAINT [DF__TaskLog__IsError__0965B397] DEFAULT ((0)),
[ErrorMessage] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErrorSeverity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErrorState] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [AUDIT].[TaskLog] ADD CONSTRAINT [PK__TaskLog__3214EC272FF9B0CB] PRIMARY KEY CLUSTERED  ([ID])
GO
