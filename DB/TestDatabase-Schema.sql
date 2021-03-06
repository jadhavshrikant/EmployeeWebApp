USE [Shrikant.Jadhav]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 7/12/2019 7:11:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Thread] [varchar](255) NOT NULL,
	[Level] [varchar](50) NOT NULL,
	[Logger] [varchar](255) NOT NULL,
	[Message] [varchar](4000) NOT NULL,
	[Exception] [varchar](2000) NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAddress]    Script Date: 7/12/2019 7:11:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAddress](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[EmpID] [int] NOT NULL,
 CONSTRAINT [PK_tblAddress] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 7/12/2019 7:11:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [nvarchar](50) NULL,
	[Designation] [nvarchar](50) NULL,
	[EmailID] [nvarchar](50) NULL,
	[Salary] [int] NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tblAddress]  WITH CHECK ADD  CONSTRAINT [FK_tblAddress_tblEmployee] FOREIGN KEY([EmpID])
REFERENCES [dbo].[tblEmployee] ([EmpID])
GO
ALTER TABLE [dbo].[tblAddress] CHECK CONSTRAINT [FK_tblAddress_tblEmployee]
GO
/****** Object:  StoredProcedure [dbo].[Usp_InsertUpdateDelete_Employee1]    Script Date: 7/12/2019 7:11:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usp_InsertUpdateDelete_Employee1]
	-- Add the parameters for the stored procedure here
@EmpID INT=NULL,
@EmpName NVARCHAR(10) = NULL,
@EmpDesignation NVARCHAR(10)= NULL,
@EmpEmail NVARCHAR(40)=NULL,
@EmpAddress NVARCHAR(50)=NULL, 
@Query INT
AS
BEGIN
	BEGIN TRY

	BEGIN TRANSACTION;

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;
	-- coder here which fails
	IF(@Query=1)
	BEGIN 
			INSERT INTO tblEmployee(EmpName,Designation,EmailID)
			VALUES (@EmpName,@EmpDesignation,@EmpEmail)
		
			SET @EmpID = (SELECT SCOPE_IDENTITY())

			INSERT INTO tblAddress([Address],EmpID)VALUES (@EmpAddress,@EmpID) 
			
		IF(@@ROWCOUNT > 0)
		BEGIN 
			SELECT 'Insert'
		END
	END

	IF(@Query=2)
	BEGIN
		UPDATE tblEmployee 
		SET 
			EmpName = @EmpName,
			Designation = @EmpDesignation,
			EmailID=@EmpEmail
		WHERE tblEmployee.EmpID = @EmpID

		UPDATE tblAddress 
		SET 
			[Address] = @EmpAddress
		where EmpID = @EmpID		
		
		SELECT 'Update'
	END
	
	
   IF (@Query = 4)  
	BEGIN  
		SELECT EmpID,EmpName,Designation,EmailID  
		FROM tblEmployee  

		SELECT [Address] 
		FROM tblAddress
	END  
	  

	IF (@Query = 5)  
	BEGIN  
		SELECT e.EmpID, e.EmpName, e.Designation,e.EmailID ,a.[Address] 
		FROM tblEmployee e  
		inner join tblAddress a on e.EmpID = a.EmpID  		
		WHERE e.EmpID = @EmpID
	END

	COMMIT TRANSACTION;

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		DECLARE @ErrorNumber INT = ERROR_NUMBER();
		DECLARE @ErrorLine INT = ERROR_LINE();
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
		DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
		DECLARE @ErrorState INT = ERROR_STATE();
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
END


GO
