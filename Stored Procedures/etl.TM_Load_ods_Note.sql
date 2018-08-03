SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[TM_Load_ods_Note]
(
	@BatchId NVARCHAR(50),
	@Target VARCHAR(256),
	@Source VARCHAR(256),
	@BusinessKey VARCHAR(256),
	@Options NVARCHAR(MAX)
)

AS
BEGIN

    EXEC etl.TM_StandardMerge @BatchId = '00000000-0000-0000-0000-000000000000', @Target = 'ods.TM_Note', @Source = 'stg.TM_Note', @BusinessKey = 'note_id, task_stage_seq_num'
    , @Options = '<options><LoadArchiveTable>true</LoadArchiveTable><ArchiveTableName>archive.TM_Note</ArchiveTableName><DedupeStage>true</DedupeStage><DedupeSortPriority>ETL__ID</DedupeSortPriority><JoinString>t.[note_id] = s.[note_id] AND ISNULL(t.[task_stage_seq_num], -987) = ISNULL(s.[task_stage_seq_num], -987)</JoinString></options>'


END



















GO
