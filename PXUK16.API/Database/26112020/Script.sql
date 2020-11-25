USE [PXUK16DB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetManufactories]    Script Date: 11/25/2020 9:27:03 AM ******/
DROP PROCEDURE [dbo].[sp_GetManufactories]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetManufactories]    Script Date: 11/25/2020 9:27:03 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Khoa Nguyen
-- Create date: 25/11/2020
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