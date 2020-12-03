USE [PXUK16DB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ron
-- Create date: 30/11/2020
-- Description:	Update Manufactory
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteCategory]
	@CategoryId		INT
AS
BEGIN
	
	DECLARE @Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'
	DECLARE @Result		BIT = 0
	DECLARE @IsDelete	BIT = 1

	BEGIN TRAN
	BEGIN TRY
		IF(ISNULL(@CategoryId,0) = 0)
		BEGIN
			SET @Message = 'CategoryId is required.'
		END
		ELSE
			BEGIN
				IF(NOT EXISTS(SELECT * FROM Category WHERE CategoryId = @CategoryId))
				BEGIN
					SET @Message = 'Can not found Category Id'	
				END
				ELSE
				BEGIN
					UPDATE Category
					SET IsDeleted = @IsDelete
					WHERE CategoryId = @CategoryId

					SET @Message = 'Category has been delete success'
					SET @Result = 1
				END
		END
		SELECT @Result AS Result, @Message AS [Message] ,@CategoryId AS CategoryId ,@IsDelete AS IsDeleted
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT @Result AS Result, @Message AS [Message],@CategoryId AS CategoryId ,@IsDelete AS IsDeleted
		ROLLBACK TRAN
	END CATCH
END
 