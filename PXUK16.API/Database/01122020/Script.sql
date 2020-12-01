SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Minh Hoang
-- Create date: 12/01/2020
-- Description:	delete Category by CategoryID
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteCategory]
	@CategoryId INT
AS
BEGIN
	DECLARE @Message NVARCHAR(200) = 'Something went wrong, please try again'
	BEGIN TRY
		DELETE FROM [dbo].[Category]
		WHERE CategoryId = @CategoryId

		SET @Message = 'Category has been deleted successfully!'
		SELECT @CategoryId AS CategoryId, @Message AS [Message]

	END TRY
	BEGIN CATCH
		SELECT @CategoryId AS CategoryId, @Message AS [Message]
	END CATCH
END