CREATE TABLE [apietl].[SurveyGizmo_surveyQuestion]
(
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__SurveyGiz__ETL____22D07FDF] DEFAULT (getutcdate()),
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsLoaded] [bit] NULL CONSTRAINT [DF__SurveyGiz__IsLoa__2D99BDC3] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1)
)
GO
