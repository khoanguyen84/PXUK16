SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ron
-- Create date: 25/11/2020
-- Description:	Get categories have not deleted yet
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetManufactory] 
AS
BEGIN

	SELECT [ManufactoryId]
		  ,[Name]
		  ,[IsDeleted]
	  FROM [dbo].[Manafactory]
	  WHERE IsDeleted = 0
END
GO
