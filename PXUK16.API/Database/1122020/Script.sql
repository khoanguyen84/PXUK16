USE [PXUK16DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteManufactory]    Script Date: 12/1/2020 7:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:   TUAN
-- Create date: 31/11/2020
-- Description:  Delete ManufactoryId
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteManufactory]
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
          SET @Message = 'Can not found ManufactoryId Id'  
        END
        ELSE
          BEGIN
		  IF(EXISTS(SELECT * FROM Manafactory WHERE IsDeleted =1))
		  BEGIN
		  SET @Message = 'Category is not EXISTS '
		  END
            UPDATE  Manafactory
            SET IsDeleted = 1
            WHERE ManufactoryId = @ManufactoryId

            SET @Message = 'ManufactoryId has been Delete successfully!'
          
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



