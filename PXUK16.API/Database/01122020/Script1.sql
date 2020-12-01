SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Minh Hoang
-- Create date: 12/01/2020
-- Description:	delete Category by CategoryID
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteManufactory]
	@ManafactoryId INT
AS
BEGIN
	DECLARE @Message NVARCHAR(200) = 'Something went wrong, please try again'
	BEGIN TRY
		DELETE FROM [dbo].[Manafactory]
		WHERE ManafactoryId = @ManafactoryId

		SET @Message = 'Manufactory has been deleted successfully!'
		SELECT @ManafactoryId AS ManafactoryId, @Message AS [Message]

	END TRY
	BEGIN CATCH
		SELECT @ManafactoryId AS ManafactoryId, @Message AS [Message]
	END CATCH
END