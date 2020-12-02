
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Quoc Khanh
-- Create date: 25/11/2020
-- Description:	Get Manafactories have not deleted yet
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetManufactory] 
AS
BEGIN

	SELECT [ManafactoryId]
		  ,[Name]
	  FROM [dbo].[Manafactory]
	  WHERE IsDeleted = 0
END
