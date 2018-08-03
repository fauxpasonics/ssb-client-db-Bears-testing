SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preods].[SurveyGizmo_surveyQuestion]
AS

SELECT DISTINCT
	[ETL__multi_query_value_for_audit]
	,CONVERT(INT,[SK]) [SK]
	,CONVERT(INT,[Question_id]) [Question_id]
	,CONVERT(NVARCHAR(250),[Question_base-type]) [Question_base_type]
	,CONVERT(NVARCHAR(250),[Question_type]) [Question_type]
	,CONVERT(NVARCHAR(1000),[Question_shortname]) [Question_shortname]
	,CONVERT(NVARCHAR(10),[Question_has-showhide-deps]) [Question_has_showhide_deps]
	,CONVERT(NVARCHAR(10),[Question_comment]) [Question_comment]
	,CONVERT(NVARCHAR(MAX),[Question_title_English]) [Question_title_English]
	,CONVERT(NVARCHAR(10),[Question_properties_hidden]) [Question_properties_hidden]
	,CONVERT(NVARCHAR(250),[Question_properties_map-key]) [Question_properties_map_key]
	,CONVERT(NVARCHAR(10),[Question_properties_show-title]) [Question_properties_show_title]
	,CONVERT(NVARCHAR(10),[Question_properties_question-description-above]) [Question_properties_question_description_above]
	,CONVERT(NVARCHAR(10),[Question_properties_soft-required]) [Question_properties_soft_required]
	,CONVERT(NVARCHAR(10),[Question_properties_required]) [Question_properties_required]
	,CONVERT(NVARCHAR(10),[Question_properties_disabled]) [Question_properties_disabled]
	,CONVERT(NVARCHAR(10),[Question_properties_labels-right]) [Question_properties_labels_right]
	,CONVERT(NVARCHAR(10),[Question_properties_option-sort]) [Question_properties_option_sort]
	,CONVERT(NVARCHAR(10),[Question_properties_hide-after-response]) [Question_properties_hide_after_response]
	,CONVERT(NVARCHAR(MAX),[Question_properties_custom-css]) [Question_properties_custom_css]
	,CONVERT(NVARCHAR(10),[Question_properties_break-after]) [Question_properties_break_after]
	,CONVERT(NVARCHAR(MAX),[Question_properties_url]) [Question_properties_url]
	,CONVERT(NVARCHAR(50),[Question_properties_orientation]) [Question_properties_orientation]
	,CONVERT(NVARCHAR(MAX),[Question_properties_question-description_English]) [Question_properties_question_description_English]
	,CONVERT(NVARCHAR(MAX),[Question_options_id]) [Question_options_id]
	,CONVERT(NVARCHAR(MAX),[Question_options_value]) [Question_options_value]
	,CONVERT(NVARCHAR(MAX),[Question_options_properties]) [Question_options_properties]
	,CONVERT(NVARCHAR(MAX),[Question_properties_messages_conjoint-best-label_English]) [Question_properties_messages_conjoint_best_label_English]
	,CONVERT(NVARCHAR(MAX),[Question_properties_messages_conjoint-worst-label_English]) [Question_properties_messages_conjoint_worst_label_English]
	,CONVERT(NVARCHAR(MAX),[Question_options_title_English]) [Question_options_title_English]
	,CONVERT(NVARCHAR(MAX),[Question_options_properties_disabled]) [Question_options_properties_disabled]
	,CONVERT(NVARCHAR(MAX),[Question_options_properties_options_]) [Question_options_properties_options_]
	,CONVERT(NVARCHAR(MAX),[Question_options_properties_options_label]) [Question_options_properties_options_label]
	,CONVERT(NVARCHAR(MAX),[Question_options_properties_options_labelvalue]) [Question_options_properties_options_labelvalue]
	,CONVERT(NVARCHAR(MAX),[Question_options_properties_options_resource]) [Question_options_properties_options_resource]
	,CONVERT(NVARCHAR(MAX),[Question_options_properties_options_uniqid]) [Question_options_properties_options_uniqid]
FROM [src].[SurveyGizmo_surveyQuestion] WITH (NOLOCK)
GO
