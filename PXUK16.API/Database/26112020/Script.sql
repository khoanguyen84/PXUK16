USE [PXUK16DB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Minh Hoang
-- Create date: 25/11/2020
-- Description:	Get Manafactories have not deleted yet
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetManafactory] 
AS
BEGIN

	SELECT [ManufactoryId]
		  ,[Name]
		  ,[IsDeleted]
	  FROM [dbo].[Manafactory]
	  WHERE IsDeleted = 0
END
GO