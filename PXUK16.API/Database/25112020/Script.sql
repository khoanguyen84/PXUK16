USE [PXUK16DB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCategories]    Script Date: 11/25/2020 9:27:03 AM ******/
DROP PROCEDURE [dbo].[sp_GetCategories]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCategories]    Script Date: 11/25/2020 9:27:03 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Khoa Nguyen
-- Create date: 25/11/2020
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


