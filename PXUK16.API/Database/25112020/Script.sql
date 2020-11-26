USE [PXUK16DB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCategories]     ******/
DROP PROCEDURE [dbo].[sp_GetCategories]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCategories]     ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tuan Anh
-- Create date: 26/11/2020
-- Description:	Get categories have not deleted yet
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCategories] 
AS
BEGIN
	SELECT [CategoryId]
		  ,[CategoryName]
	  FROM [dbo].[Category]
	  WHERE IsDeleted = 0
END
GO


