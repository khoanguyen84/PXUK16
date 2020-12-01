USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCategory]    Script Date: 12/1/2020 8:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Đạt
-- Create date: 30/11/2020
-- Description:	Delete category
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteCategory]
	@CategoryId INT
AS
BEGIN
	DECLARE @Message NVARCHAR(200) ='Something went wrong, please contact administrator.'

	BEGIN TRAN
	BEGIN TRY
	IF(ISNULL(@CategoryId,0) = 0)
	BEGIN
		SET @Message = 'Category ID is required.'
	END
	ELSE
	BEGIN
		IF (NOT EXISTS (SELECT * FROM Category WHERE CategoryId = @CategoryId))
		BEGIN
			SET @Message = 'Category is not exists.'
		END
		ELSE
			BEGIN
			IF (EXISTS(SELECT * FROM Category WHERE CategoryId = 1))
			BEGIN
			SET @Message = 'Category already deleted.'
			END
			ELSE
			BEGIN
				UPDATE Category
				SET IsDeleted = 1
				WHERE CategoryId = @CategoryId
				SET @Message = 'Category has been deleted.'
			END
		END
	END
	SELECT @Message AS [Message], @CategoryId AS [CategoryId]
		COMMIT TRAN
	END TRY
	BEGIN CATCH
	SELECT @Message AS [Message], @CategoryId AS [CategoryId]
		ROLLBACK TRAN
	END CATCH
END
GO
