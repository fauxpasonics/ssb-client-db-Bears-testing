SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preods].[SurveyGizmo_survey]
AS

SELECT DISTINCT
	[ETL__multi_query_value_for_audit]
	,CONVERT(INT,[Survey_id]) [Survey_id]
	,CONVERT(INT,[Team_Id]) [Team_Id]
	,CONVERT(NVARCHAR(500),[Survey_type]) [Survey_type]
	,CONVERT(NVARCHAR(500),[Survey_status]) [Survey_status]
	,CONVERT(DATETIME,[created-on]) [created-on]
	,CONVERT(DATETIME,[modified-on]) [modified-on]
	,CONVERT(NVARCHAR(1000),[Survey_title]) [Survey_title]
	,CONVERT(NVARCHAR(100),[Survey_statistics]) [Survey_statistics]
	,MAX([Survey_statistics_TestData]) [Survey_statistics_TestData]
	,MAX([Survey_statistics_Complete]) [Survey_statistics_Complete]
	,MAX([Survey_links_edit]) [Survey_links_edit]
	,MAX([Survey_links_publish]) [Survey_links_publish]
	,MAX([Survey_links_default]) [Survey_links_default]
FROM [src].[SurveyGizmo_survey] WITH (NOLOCK)
GROUP BY ETL__multi_query_value_for_audit,
         Survey_id,
         Team_Id,
         Survey_type,
         Survey_status,
         [created-on],
         [modified-on],
         Survey_title,
         Survey_statistics

GO
