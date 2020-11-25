USE [PXUK16DB]
GO

DROP PROCEDURE [dbo].[sp_GetManufactories] 
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ngoc Phuoc
-- Create date: 26/11/2020
-- Description:	Get Manufactories have not deleted yet
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetManufactories] 
AS
BEGIN
	SELECT [ManufactoryId]
      ,[Name]    
	FROM [dbo].[Manufactory]
	WHERE IsDeleted = 0
END
GO
