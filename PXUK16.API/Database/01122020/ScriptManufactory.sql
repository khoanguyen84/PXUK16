USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteManufactory]    Script Date: 01/12/2020 19:49:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tuan Anh
-- Create date: 1/12/2020
-- Description:	Delete Manufactory
-- =============================================
ALTER PROCEDURE [dbo].[sp_DeleteManufactory]
	@ManufactoryId		INT	
AS
BEGIN
	
	DECLARE @Message	NVARCHAR(200) = 'Something went wrong, please contact administrator !'
	DECLARE @Result		BIT = 0
	DECLARE @IsDelete	BIT = 1

	BEGIN TRAN
	BEGIN TRY
		IF(ISNULL(@ManufactoryId,0) = 0)
		BEGIN
			SET @Message = 'ManufactoryId is required !'
		END
		ELSE
			BEGIN
				IF(NOT EXISTS(SELECT * FROM Manafactory WHERE ManufactoryId = @ManufactoryId))
				BEGIN
					SET @Message = 'Can not found ManufactoryId !'	
				END
				ELSE
				IF(EXISTS(SELECT * FROM Manafactory WHERE ManufactoryId = @ManufactoryId AND IsDeleted = 1))
				BEGIN
					SET @Message = 'Manufactory has been deleted ! '
				END
				ELSE
				BEGIN
					UPDATE Manafactory
					SET IsDeleted = @IsDelete
					WHERE ManufactoryId = @ManufactoryId

					SET @Message = 'Manufactory has been deleted success !'
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
