SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ajay Singh
-- Create date: 30 March 2022
-- Description:	To get Claims data for Reporting Purpose
-- =============================================
CREATE PROCEDURE [dbo].[proc_rpt_getClaimsData] 
	-- Add the parameters for the stored procedure here
	-- No Parameters Associated as per requirement (AJ)
	/* <@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>*/
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
    tc.id_claim,
    tc.claim_number, 
    CONVERT(VARCHAR(10), tc.claim_submission_date, 105) as claim_submission_date, 
    tc.master_policy_number,
    tc.policy_owner_name, 
    DATEDIFF(day, tc.claim_submission_date, getdate()) 
    as 
    days_before 
    from tbl_claims tc;
END
GO
