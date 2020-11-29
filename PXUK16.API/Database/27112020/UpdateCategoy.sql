SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Khoa Nguyễn
-- Create date: 27/11/2020
-- Description:	Update category
-- =============================================
CREATE PROCEDURE sp_UpdateCategory
	@CategoryId		INT,
	@CategoryName	NVARCHAR(500)
AS
BEGIN
	
	DECLARE @Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'
	DECLARE @Result		BIT = 0

	BEGIN TRAN
	BEGIN TRY
		IF(ISNULL(@CategoryId,0) = 0)
		BEGIN
			SET @Message = 'CategoryId is required.'
		END
		ELSE
		BEGIN
			IF(ISNULL(@CategoryName, '') = '')
			BEGIN
				SET @Message = 'Category name is required.'
			END
			ELSE
			BEGIN
				IF(NOT EXISTS(SELECT * FROM Category WHERE CategoryId = @CategoryId))
				BEGIN
					SET @Message = 'Can not found category Id'	
				END
				ELSE
				BEGIN
					IF(EXISTS(SELECT * FROM Category WHERE CategoryName = @CategoryName AND CategoryId <> @CategoryId))
					BEGIN
						SET @Message = 'Category is exists'	
					END
					ELSE
					BEGIN
						UPDATE Category
						SET CategoryName = @CategoryName
						WHERE CategoryId = @CategoryId

						SET @Message = 'Category has been updated success'
						SET @Result = 1
					END
				END
			END
		END
		SELECT @Result AS Result, @Message AS [Message]
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT @Result AS Result, @Message AS [Message]
		ROLLBACK TRAN
	END CATCH
END
GO