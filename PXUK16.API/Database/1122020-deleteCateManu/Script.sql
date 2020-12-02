USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCategory]    Script Date: 12/2/2020 8:12:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ngọc Phước
-- Create date: 30/11/2020
-- Description:	Delete category
-- =============================================
ALTER PROCEDURE [dbo].[sp_DeleteCategory]
	@CategoryId INT
AS
BEGIN
  
  DECLARE @Message  NVARCHAR(200) = 'Something went wrong, please contact administrator.'

 BEGIN TRAN
	BEGIN TRY
		IF(ISNULL(@CategoryId,0) = 0)
		BEGIN
			SET @Message = 'CategoryId is required!'
		END
		ELSE
		BEGIN
				IF(NOT EXISTS(SELECT * FROM Category WHERE CategoryId = @CategoryId))
				BEGIN
					SET @Message = 'Can not found CategoryId!'	
				END
				ELSE
					BEGIN
					IF(EXISTS(SELECT * FROM Category WHERE CategoryId = @CategoryId AND IsDeleted = 1))
					BEGIN
					SET @Message ='Category does not exist' 
					END 
					ELSE
					BEGIN
						UPDATE Category
						SET    IsDeleted =1
						WHERE CategoryId = @CategoryId
						SET @Message = 'Category has been delete successfully!'			
					END
				END
			END
		SELECT @Message AS [Message] , @CategoryId AS CategoryId
		COMMIT TRAN
	END TRY
  BEGIN CATCH
    SELECT @Message AS [Message] , @CategoryId AS CategoryId
    ROLLBACK TRAN
  END CATCH
END


___________________
USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteManufactory]    Script Date: 12/2/2020 8:25:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ngọc Phước
-- Create date: 01/12/2020
-- Description:	Delete Manufactory
-- =============================================
ALTER PROCEDURE [dbo].[sp_DeleteManufactory]
	@ManufactoryId INT
AS
BEGIN
	
	DECLARE @Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'

	BEGIN TRAN
	BEGIN TRY
		IF(ISNULL(@ManufactoryId,0) = 0)
		BEGIN
			SET @Message = 'ManufactoryId is required!'
		END
		ELSE
		BEGIN
				IF(NOT EXISTS(SELECT * FROM Manufactory WHERE ManufactoryId = @ManufactoryId))
				BEGIN
					SET @Message = 'Can not found ManufactoryId!'	
				END
				ELSE
					BEGIN
					IF(EXISTS(SELECT * FROM Manufactory WHERE IsDeleted = 1))
					BEGIN
					SET @Message ='Manufactory does not exist' 
					END 
					ELSE
					BEGIN
						UPDATE Manufactory
						SET    IsDeleted =1
						WHERE ManufactoryId = @ManufactoryId
						SET @Message = 'Manufactory has been delete successfully!'			
					END
				END
			END
		SELECT @Message AS [Message] , @ManufactoryId AS ManufactoryId
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT @Message AS [Message] , @ManufactoryId AS ManufactoryId
		ROLLBACK TRAN
	END CATCH
END
