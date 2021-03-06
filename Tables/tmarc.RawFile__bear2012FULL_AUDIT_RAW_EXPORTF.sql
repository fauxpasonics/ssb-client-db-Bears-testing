CREATE TABLE [tmarc].[RawFile__bear2012FULL_AUDIT_RAW_EXPORTF]
(
[ETL__ID] [int] NOT NULL IDENTITY(1, 1),
[ETL__CreatedDate] [datetime] NOT NULL,
[ETL__Source] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[seat_status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[include_in_report] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[source_system] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[plan_event_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_sort] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sell_location] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_usr] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[orig_price_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tm_price_level] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[comp_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[comp_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[group_flag] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[class_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[class_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dist_status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[num_seats] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[purchase_price] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_23] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sell_location_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[plan_event_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tm_event_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[plan_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pricing_method] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[eip_pricing_used] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[disc_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[disc_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[disc_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[surchg_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[surchg_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[surchg_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[disc_level] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[summary_disc_level] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[calc_num_seats] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[calc_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paid] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fse] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price_code_desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[period] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[orig_disc_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[orig_surchg_amount] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[kill] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_ticket] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_tax] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_licfee] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_other1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_other2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sell_location_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ticket_type_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_other3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_other4] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_other5] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_other6] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_other7] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_other8] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sum_pc_ticket] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sum_pc_tax] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sum_pc_other1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sum_pc_other2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sum_pc_other3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sum_pc_other4] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sum_pc_other5] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sum_pc_other6] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sum_pc_other7] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sum_pc_other8] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sum_pc_licfee] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pc_template_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Audit_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[export_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seq_num] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pk_seq_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
