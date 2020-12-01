USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCategory]    Script Date: 12/1/2020 4:16:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:    Quang Lê
-- Create date: 31/11/2020
-- Description:  Delete category
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteCategory]
  @CategoryId INT
AS
BEGIN
  
  DECLARE @Message  NVARCHAR(200) = 'Something went wrong, please contact administrator.'

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
          SET @Message = 'Can not found category Id'  
          END
          ELSE
          BEGIN
		  IF(EXISTS(SELECT * FROM Category WHERE IsDeleted =1))
		  BEGIN
		  SET @Message = 'Category is not EXISTS '
		  END
		  ELSE
		  BEGIN
          UPDATE  Category
          SET IsDeleted = 1
          WHERE CategoryId = @CategoryId
          SET @Message = 'Category has been delete successfully!'
          
          END
        END
      END
    SELECT @Message AS [Message] , @CategoryId AS [CategoryId]
    COMMIT TRAN
  END TRY
  BEGIN CATCH
    SELECT @Message AS [Message] , @CategoryId AS [CategoryId]
    ROLLBACK TRAN
  END CATCH
END

---------------------------------------------------------------------------------------
USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCategory]    Script Date: 12/1/2020 4:16:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:    Quang Lê
-- Create date: 31/11/2020
-- Description:  Delete manufactory
-- =============================================
CREATE PROCEDURE sp_DeleteManufactory
  @ManufactoryId INT
AS
BEGIN
  
  DECLARE @Message  NVARCHAR(200) = 'Something went wrong, please contact administrator.'

  BEGIN TRAN
  BEGIN TRY
   IF(ISNULL(@ManufactoryId,0) = 0)
          BEGIN
          SET @Message = 'CategoryId is required.'
          END
          ELSE
          BEGIN
          IF(NOT EXISTS(SELECT * FROM Manafactory WHERE ManufactoryId = @ManufactoryId))
          BEGIN
          SET @Message = 'Can not found category Id'  
          END
          ELSE
          BEGIN
		  IF(EXISTS(SELECT * FROM Manafactory WHERE IsDeleted =1))
		  BEGIN
		  SET @Message = 'Manufactory is not EXISTS '
		  END
		  ELSE
		  BEGIN
          UPDATE  Manafactory
          SET IsDeleted = 1
          WHERE ManufactoryId = @ManufactoryId
          SET @Message = 'Manufactory has been delete successfully!'
          
          END
        END
      END
    SELECT @Message AS [Message] , @ManufactoryId AS [ManufactoryId]
    COMMIT TRAN
  END TRY
  BEGIN CATCH
    SELECT @Message AS [Message] , @ManufactoryId AS [ManufactoryId]
    ROLLBACK TRAN
  END CATCH
END