CREATE TABLE [src].[SurveyGizmo_surveyResponse]
(
[SK] [bigint] NULL,
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_id] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_contact-id] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_status] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_is-test-data] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_date-submitted] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_session-id] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_language] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_date-started] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_link-id] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_ip-address] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_referer] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_user-agent] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_response-time] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_longitude] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_latitude] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_country] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_city] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_region] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_postal] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_dma] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_controller] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_controller_key] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_controller_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_controller_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_action_key] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_action_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_action_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_id_key] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_id_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_id_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_module_key] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_module_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_module_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sgtarget_key] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sgtarget_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sgtarget_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_slanguage_key] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_slanguage_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_slanguage_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-build-test_key] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-build-test_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-build-test_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-collab-test_key] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-collab-test_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-collab-test_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-tester_key] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-tester_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-tester_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-tester-name_key] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-tester-name_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-tester-name_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-tester-id_key] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-tester-id_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-tester-id_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_link-id_key] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_link-id_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_link-id_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-skip-actions_key] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-skip-actions_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sg-skip-actions_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_?preview-frame_key] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_?preview-frame_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_?preview-frame_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sgapptest_key] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sgapptest_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--sgapptest_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--ref_key] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--ref_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--ref_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--passthrough_key] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--passthrough_value] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_url-variables_--passthrough_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_survey-data_id] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_survey-data_type] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_survey-data_question] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_survey-data_section-id] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_survey-data_shown] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_survey-data_options_] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_survey-data_options_id] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_survey-data_options_option] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_survey-data_options_answer] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_survey-data_options_card_id] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_survey-data_options_card_answer] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_survey-data_options_set_id] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_survey-data_options_set_answer] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_survey-data_options_choice_id] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Response_survey-data_options_choice_answer] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
