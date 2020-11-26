USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_Manufactories]    Script Date: 11/26/2020 9:34:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Hoang Nam
-- Create date: 25/11/2020
-- Description:	Get categories have not deleted yet
-- =============================================
CREATE PROCEDURE [dbo].[sp_Manufactories] 
AS
BEGIN
	SELECT [ManufactoryId]
		  ,[Name]
	  FROM [dbo].[Manafactory]
	  WHERE IsDeleted = 0
END
GO
