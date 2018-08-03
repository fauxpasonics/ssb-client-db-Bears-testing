CREATE TABLE [ods].[SurveyGizmo_survey]
(
[Survey_id] [int] NOT NULL,
[Team_Id] [int] NOT NULL,
[Survey_type] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_status] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created-on] [datetime] NULL,
[modified-on] [datetime] NULL,
[Survey_title] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_statistics] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_statistics_TestData] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_statistics_Complete] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_links_edit] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_links_publish] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survey_links_default] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__SurveyGiz__ETL_C__0949B0B9] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__SurveyGiz__ETL_C__0A3DD4F2] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__SurveyGiz__ETL_U__0B31F92B] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__SurveyGiz__ETL_U__0C261D64] DEFAULT (suser_sname())
)
GO
ALTER TABLE [ods].[SurveyGizmo_survey] ADD CONSTRAINT [PK__SurveyGi__DC27E5BA175A0035] PRIMARY KEY CLUSTERED  ([Survey_id], [Team_Id])
GO
