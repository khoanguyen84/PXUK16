SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khoa Nguyễn
-- Create date: 26/11/2020
-- Description:	Create new category
-- =============================================
CREATE PROCEDURE sp_CreateCategory
	@CategoryName NVARCHAR(500)
AS
BEGIN
	DECLARE @CategoryId	INT = 0,
			@Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'

	BEGIN TRY
		IF(@CategoryName IS NULL OR @CategoryName = '')
		BEGIN
			SET @Message = 'Category name is required.'
		END
		ELSE
		BEGIN
			IF(EXISTS(SELECT * FROM Category WHERE CategoryName = @CategoryName))
			BEGIN
				SET @Message = 'Category name is exists.'
			END
			ELSE
			BEGIN
				INSERT INTO [dbo].[Category]
					   ([CategoryName]
					   ,[IsDeleted])
				 VALUES
					   (@CategoryName
					   ,0)

				SET @CategoryId = SCOPE_IDENTITY()
				SET @Message = 'Category has been created success.'
			END
		END
		SELECT @CategoryId AS CategoryId, @Message AS [Message]
	END TRY
	BEGIN CATCH
		SELECT @CategoryId AS CategoryId, @Message AS [Message]
	END CATCH
END
GO
