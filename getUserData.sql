SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getUserData] 
	-- Add the parameters for the stored procedure here
	(@userName nvarchar(50),@password nvarchar(50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT User_Id,User_Name,Role,FullName from users where User_Name=@userName and Password=@password;
END
GO
