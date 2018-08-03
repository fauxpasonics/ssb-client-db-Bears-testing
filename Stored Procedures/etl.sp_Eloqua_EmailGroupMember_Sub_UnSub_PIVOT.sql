SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [etl].[sp_Eloqua_EmailGroupMember_Sub_UnSub_PIVOT]
AS
    BEGIN

        DROP TABLE ods.Eloqua_EmailGroupMember_Sub_UnSub_PIVOT

        IF OBJECT_ID('tempdb..#TempEmailGroupFlagged') IS NOT NULL
            DROP TABLE #TempEmailGroupFlagged

        SELECT  ContactID
              , EmailAddress
              , EmailGroup
              , CASE WHEN ETL_IsDeleted = 1 THEN -1
                     ELSE 1
                END AS Flag
        INTO    #TempEmailGroupFlagged
        FROM    ods.Eloqua_EmailGroupMembers WITH ( NOLOCK )


        DECLARE @cols AS NVARCHAR(MAX)
          , @query AS NVARCHAR(MAX)

        SELECT  @cols = STUFF((SELECT   ',' + QUOTENAME(EmailGroup)
                               FROM     #TempEmailGroupFlagged
                               GROUP BY EmailGroup
                               ORDER BY EmailGroup
                FOR           XML PATH('')
                                , TYPE
            ).value('.', 'NVARCHAR(MAX)'), 1, 1, '')


        SET @query = 'SELECT ContactID, EmailAddress,' + @cols + ' 
			  INTO ods.Eloqua_EmailGroupMember_Sub_UnSub_PIVOT
			  FROM 
             (
                SELECT ContactID, EmailAddress, Flag, EmailGroup
                FROM #TempEmailGroupFlagged
				--where ETL_IsDeleted = 0
				--AND EmailAddress = ''phatt41@aol.com''
            ) x
            PIVOT 
            (
                SUM(Flag)
                FOR EmailGroup IN (' + @cols + ')
            ) p'

        EXECUTE(@query)

        EXECUTE (
        'DROP  VIEW [ro].[vw_Eloqua_EmailGroupMember_Sub_UnSub_PIVOT]')

        EXECUTE (
        'CREATE VIEW [ro].[vw_Eloqua_EmailGroupMember_Sub_UnSub_PIVOT] AS (

        SELECT *
        FROM ods.Eloqua_EmailGroupMember_Sub_UnSub_PIVOT WITH (NOLOCK)
        )')

    END

GO
