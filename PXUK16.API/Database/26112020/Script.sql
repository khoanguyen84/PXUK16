USE [PXUK16DB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetManufactories]     ******/
DROP PROCEDURE [dbo].[sp_GetManufactories]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetManufactories]     ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tuanh Anh
-- Create date: 26/11/2020
-- Description:	Get manufactory have not deleted yet
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetManufactories] 
AS
BEGIN
	SELECT [ManufactoryId]
		  ,[Name]
	  FROM [dbo].[Manafactory]
	  WHERE IsDeleted = 0
END
GO


