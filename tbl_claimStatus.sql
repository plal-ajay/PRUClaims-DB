SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_claimStatus](
	[id_statusClaim] [bigint] IDENTITY(1,1) NOT NULL,
	[id_claim] [bigint] NULL,
	[claim_number] [nvarchar](10) NULL,
	[current_status] [bigint] NULL,
	[previous_status] [bigint] NULL,
	[allocatedTo] [bigint] NULL,
	[created_date] [date] NULL,
	[updated_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_statusClaim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
