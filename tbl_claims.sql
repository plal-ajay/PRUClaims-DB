SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_claims](
	[id_claim] [bigint] IDENTITY(1,1) NOT NULL,
	[claim_number] [nvarchar](10) NOT NULL,
	[claim_submission_date] [date] NOT NULL,
	[master_policy_number] [nvarchar](max) NOT NULL,
	[policy_owner_name] [nvarchar](max) NOT NULL,
	[id_number] [varchar](max) NOT NULL,
	[date_of_birth] [date] NOT NULL,
	[requestor_name] [varchar](max) NOT NULL,
	[requestor_id_number] [varchar](max) NOT NULL,
	[phone_number] [varchar](15) NOT NULL,
	[contact_address] [nvarchar](max) NOT NULL,
	[relationship_with_policy_owner] [varchar](100) NOT NULL,
	[relationship_others] [nvarchar](max) NULL,
	[claim_event] [varchar](100) NOT NULL,
	[cause] [varchar](200) NOT NULL,
	[cause_event_date] [date] NULL,
	[cause_at] [varchar](max) NULL,
	[injury_status] [varchar](250) NULL,
	[illness_info] [nvarchar](max) NOT NULL,
	[diagnosis_date] [date] NOT NULL,
	[type_of_medical_treatment] [varchar](max) NOT NULL,
	[doctor_name] [varchar](100) NULL,
	[hospital_name] [varchar](250) NULL,
	[diagnosis] [varchar](250) NULL,
	[time] [varchar](100) NULL,
	[signature_and_name] [varchar](100) NOT NULL,
	[requestor_phone_number] [varchar](15) NOT NULL,
	[medical_report_of_policy_number] [nvarchar](max) NULL,
	[death_certificate] [nvarchar](max) NULL,
	[ID_proof_of_policy_owner] [nvarchar](max) NULL,
	[created_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_claim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_claims] ADD  DEFAULT (getdate()) FOR [created_date]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_addClaimToStatus]
on [dbo].[tbl_claims]
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO tbl_claimStatus(
    id_claim,
    claim_number,
    current_status,
    previous_status,
    allocatedTo,
    created_date,
    updated_date
) 
SELECT 
i.id_claim,
i.claim_number,
1,
0,
01,
GETDATE(),
GETDATE()
FROM INSERTED i
END;
GO
ALTER TABLE [dbo].[tbl_claims] ENABLE TRIGGER [trg_addClaimToStatus]
GO
