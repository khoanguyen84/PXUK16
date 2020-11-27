USE [PXUK16DB]
GO

/****** Object:  StoredProcedure [dbo].[sp_Manufactories]    Script Date: 11/25/2020 12:30:46 PM ******/
DROP PROCEDURE [dbo].[sp_Manufactories]
GO

/****** Object:  StoredProcedure [dbo].[sp_Manufactories]    Script Date: 11/25/2020 12:30:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ron
-- Create date: 25/11/2020
-- Description:	Get manufactories have not deleted yet
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
