SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [etl].[sp_Load_Eloqua_TicketRequestForm]
AS
MERGE ods.Eloqua_TicketRequestForm AS target
USING
(SELECT * FROM etl.vw_Load_Eloqua_TicketRequestForm) AS source
ON (target.ID = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.ETL__UpdatedDate = GETDATE(),
			   target.ContactId = source.ContactId,
			   target.year = source.year,
			   target.month = source.month,
			   target.day = source.day,
			   target.zipOrPostalCode = source.zipOrPostalCode,
			   target.lastName = source.lastName,
			   target.firstName = source.firstName,
               target.emailAddress = source.emailAddress,
			   target.SingleGameTickets = source.SingleGameTickets,
			   TARGET.SeasonTickets = source.SingleGameTickets,
			   target.PriorityTickets = source.PriorityTickets,
			   target.GroupTickets = source.GroupTickets,
			   target.Premium = source.Premium,
			   target.CreatedAt = source.CreatedAt
WHEN NOT MATCHED BY TARGET THEN
    INSERT
    (
        ETL__CreatedDate,
        ETL__UpdatedDate,
        ID,
        ContactId,
        CreatedAt,
        year,
        month,
        day,
        lastName,
        firstName,
        emailAddress,
        zipOrPostalCode,
        SingleGameTickets,
		SeasonTickets,
		PriorityTickets,
		GroupTickets,
		Premium
    )
    VALUES
    (GETDATE(),
     GETDATE(),
     source.ID,
     source.ContactId,
     source.CreatedAt,
     source.year,
     source.month,
     source.day,
     source.lastName,
     source.firstName,
     source.emailAddress,
     source.zipOrPostalCode,
     source.SingleGameTickets,
     source.SeasonTickets,
     source.PriorityTickets,
     source.GroupTickets,
     source.Premium
    );
GO
