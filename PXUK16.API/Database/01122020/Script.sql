USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCategory]    Script Date: 12/1/2020 5:41:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Trinh Nam
-- Create date: 1/12/2020
-- Description:	Delete category
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
				IF(EXISTS(SELECT * FROM Category WHERE CategoryId = @CategoryId AND IsDeleted = 1))
				BEGIN
					SET @Message = 'Category has been deleted'
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
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteManufactory]    Script Date: 12/1/2020 5:41:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Trinh Nam
-- Create date: 1/12/2020
-- Description:	Delete Manufactory
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteManufactory]
	@ManufactoryId		INT	
AS
BEGIN
	
	DECLARE @Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'
	DECLARE @Result		BIT = 0
	DECLARE @IsDelete	BIT = 1

	BEGIN TRAN
	BEGIN TRY
		IF(ISNULL(@ManufactoryId,0) = 0)
		BEGIN
			SET @Message = 'ManufactoryId is required.'
		END
		ELSE
			BEGIN
				IF(NOT EXISTS(SELECT * FROM Manafactory WHERE ManufactoryId = @ManufactoryId))
				BEGIN
					SET @Message = 'Can not found Manufactory Id'	
				END
				ELSE
				IF(EXISTS(SELECT * FROM Manafactory WHERE ManufactoryId = @ManufactoryId AND IsDeleted = 1))
				BEGIN
					SET @Message = 'Manufactory has been deleted'
				END
				ELSE
				BEGIN
					UPDATE Manafactory
					SET IsDeleted = @IsDelete
					WHERE ManufactoryId = @ManufactoryId

					SET @Message = 'Manufactory has been delete success'
					SET @Result = 1
				END
		END
		SELECT @Result AS Result, @Message AS [Message] ,@ManufactoryId AS ManufactoryId ,@IsDelete AS IsDeleted
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT @Result AS Result, @Message AS [Message],@ManufactoryId AS ManufactoryId ,@IsDelete AS IsDeleted
		ROLLBACK TRAN
	END CATCH
END
GO
