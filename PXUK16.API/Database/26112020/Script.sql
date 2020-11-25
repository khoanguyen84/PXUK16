USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Manufactories]    Script Date: 11/25/2020 4:08:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Manufactories]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	SELECT [ManufactoryId]
      ,[Name]
    
  FROM [dbo].[Manafactory]
     WHERE IsDeleted = 0

END
GO
