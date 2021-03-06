/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2016
    Target Database Engine Edition : Microsoft SQL Server Express Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [BasicCrm]    Script Date: 14.11.2020 21:25:38 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'BasicCrm')
BEGIN
CREATE DATABASE [BasicCrm]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BasicCrm', FILENAME = N'C:\Users\ilknur\BasicCrm.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BasicCrm_log', FILENAME = N'C:\Users\ilknur\BasicCrm_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE SQL_Latin1_General_CP1_CI_AS
END
GO
ALTER DATABASE [BasicCrm] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BasicCrm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BasicCrm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BasicCrm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BasicCrm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BasicCrm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BasicCrm] SET ARITHABORT OFF 
GO
ALTER DATABASE [BasicCrm] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BasicCrm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BasicCrm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BasicCrm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BasicCrm] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BasicCrm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BasicCrm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BasicCrm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BasicCrm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BasicCrm] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BasicCrm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BasicCrm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BasicCrm] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BasicCrm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BasicCrm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BasicCrm] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BasicCrm] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BasicCrm] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BasicCrm] SET  MULTI_USER 
GO
ALTER DATABASE [BasicCrm] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BasicCrm] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BasicCrm] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BasicCrm] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BasicCrm] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BasicCrm] SET QUERY_STORE = OFF
GO
USE [BasicCrm]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 14.11.2020 21:25:39 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLWriter')
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [limit]    Script Date: 14.11.2020 21:25:39 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'limit')
CREATE LOGIN [limit] WITH PASSWORD=N'Sp1fjFN5Lj0WiQK+9J8NFkPH9BpwwEjUdBamx6YY2dQ=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [limit] DISABLE
GO
/****** Object:  Login [ILKNUR\ilknur]    Script Date: 14.11.2020 21:25:39 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'ILKNUR\ilknur')
CREATE LOGIN [ILKNUR\ilknur] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 14.11.2020 21:25:39 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'n0mfICGVNF/A+/ou3A+/RkkuZRTkxEKwTYRC9AEXnfk=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 14.11.2020 21:25:39 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'cC0SomUFsNi8rjcdv8g9TYSNTR1N8u09d7VF13zFVjk=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER AUTHORIZATION ON DATABASE::[BasicCrm] TO [ILKNUR\ilknur]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [limit]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [ILKNUR\ilknur]
GO
USE [BasicCrm]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
/****** Object:  Table [dbo].[CustomerDetails]    Script Date: 14.11.2020 21:25:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerDetails](
	[CustomerDetailID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerType] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_CustomerDetails] PRIMARY KEY CLUSTERED 
(
	[CustomerDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[CustomerDetails] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 14.11.2020 21:25:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerDetailID] [int] NOT NULL,
	[CompanyName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ContactName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactTitle] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Mail] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Customers] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.11.2020 21:25:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Password] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Users] TO  SCHEMA OWNER 
GO
SET IDENTITY_INSERT [dbo].[CustomerDetails] ON 

INSERT [dbo].[CustomerDetails] ([CustomerDetailID], [CustomerType]) VALUES (1, N'Commercial')
INSERT [dbo].[CustomerDetails] ([CustomerDetailID], [CustomerType]) VALUES (2, N'Corporate')
SET IDENTITY_INSERT [dbo].[CustomerDetails] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [CustomerDetailID], [CompanyName], [ContactName], [ContactTitle], [Address], [Country], [Mail]) VALUES (1002, 2, N'Alfreds Futterkiste', N'Maria Anders', N'Sales Representative', N'Obere Str. 57', N'Germany', N'Maria@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [CustomerDetailID], [CompanyName], [ContactName], [ContactTitle], [Address], [Country], [Mail]) VALUES (1003, 1, N'Ana Trujillo Emparedados y helados', N'Ana Trujillo', N'Marketing Manager', N'24, place Kléber', N'Germany', N'ana@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [CustomerDetailID], [CompanyName], [ContactName], [ContactTitle], [Address], [Country], [Mail]) VALUES (1004, 1, N'Berglunds snabbköp', N'Christina Berglund', N'Order Administrator', N'Berguvsvägen  8', N'UK', N'x@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [CustomerDetailID], [CompanyName], [ContactName], [ContactTitle], [Address], [Country], [Mail]) VALUES (1005, 1, N'Chop-suey Chinese', N'Yang Wang', N'Owner', N'Hauptstr. 29', N'UK', N'yan@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [CustomerDetailID], [CompanyName], [ContactName], [ContactTitle], [Address], [Country], [Mail]) VALUES (1006, 2, N'Drachenblut Delikatessen', N'Sven Ottlieb', NULL, N'Order Administrator', N'France', N'sven@gmail.com')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [Password]) VALUES (1, N'Admin', N'123456')
SET IDENTITY_INSERT [dbo].[Users] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customers_CustomerDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customers]'))
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_CustomerDetails] FOREIGN KEY([CustomerDetailID])
REFERENCES [dbo].[CustomerDetails] ([CustomerDetailID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customers_CustomerDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customers]'))
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_CustomerDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCusDetail]    Script Date: 14.11.2020 21:25:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DeleteCusDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_DeleteCusDetail] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_DeleteCusDetail]
	@CustomerDetailID [int]
WITH EXECUTE AS CALLER
AS
begin
Delete from CustomerDetails  
where  CustomerDetailID=@CustomerDetailID

End
GO
ALTER AUTHORIZATION ON [dbo].[sp_DeleteCusDetail] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[sp_DeleteCusDetail] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCustomer]    Script Date: 14.11.2020 21:25:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DeleteCustomer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_DeleteCustomer] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_DeleteCustomer]
	@CustomerID [int],
	@CustomerDetailID [int]
WITH EXECUTE AS CALLER
AS
begin
Delete from CustomerDetails
where CustomerDetailID=@CustomerDetailID
Delete from Customers
where CustomerID=@CustomerID
End
GO
ALTER AUTHORIZATION ON [dbo].[sp_DeleteCustomer] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[sp_DeleteCustomer] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteUser]    Script Date: 14.11.2020 21:25:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DeleteUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_DeleteUser] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_DeleteUser]
	@UserID [int]
WITH EXECUTE AS CALLER
AS
begin
 Delete From Users Where UserID=@UserID
 
 End
GO
ALTER AUTHORIZATION ON [dbo].[sp_DeleteUser] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[sp_DeleteUser] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCusDetail]    Script Date: 14.11.2020 21:25:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertCusDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_InsertCusDetail] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_InsertCusDetail]
	@CustomerType [nvarchar](50)
WITH EXECUTE AS CALLER
AS
begin
Insert Into CustomerDetails (CustomerType)
values (@CustomerType)
End
GO
ALTER AUTHORIZATION ON [dbo].[sp_InsertCusDetail] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[sp_InsertCusDetail] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCustomer]    Script Date: 14.11.2020 21:25:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertCustomer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_InsertCustomer] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_InsertCustomer]
	@CustomerDetailID [int],
	@CompanyName [nvarchar](50),
	@ContactName [nvarchar](50),
	@ContactTitle [nvarchar](30),
	@Address [nvarchar](100),
	@Country [nvarchar](50),
	@Mail [nvarchar](20)
WITH EXECUTE AS CALLER
AS
begin
Insert Into Customers(CustomerDetailID,CompanyName,ContactName,ContactTitle,Address,Country,Mail) values(@CustomerDetailID,@CompanyName,@ContactName,@ContactTitle,@Address,@Country,@Mail)


End
GO
ALTER AUTHORIZATION ON [dbo].[sp_InsertCustomer] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[sp_InsertCustomer] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUser]    Script Date: 14.11.2020 21:25:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_InsertUser] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_InsertUser]
	@UserName [nvarchar](20),
	@Password [nvarchar](10)
WITH EXECUTE AS CALLER
AS
begin
 Insert Into Users (UserName,Password)
 values (@UserName,@Password)
 End
GO
ALTER AUTHORIZATION ON [dbo].[sp_InsertUser] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[sp_InsertUser] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectCusDetail]    Script Date: 14.11.2020 21:25:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SelectCusDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_SelectCusDetail] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_SelectCusDetail]
WITH EXECUTE AS CALLER
AS
begin
Select* from CustomerDetails  


End
GO
ALTER AUTHORIZATION ON [dbo].[sp_SelectCusDetail] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[sp_SelectCusDetail] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectCustomer]    Script Date: 14.11.2020 21:25:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SelectCustomer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_SelectCustomer] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_SelectCustomer]
WITH EXECUTE AS CALLER
AS
begin
Select* from Customers  


End
GO
ALTER AUTHORIZATION ON [dbo].[sp_SelectCustomer] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[sp_SelectCustomer] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectUser]    Script Date: 14.11.2020 21:25:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SelectUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_SelectUser] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_SelectUser]
WITH EXECUTE AS CALLER
AS
begin
 Select*From Users
 
 End
GO
ALTER AUTHORIZATION ON [dbo].[sp_SelectUser] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[sp_SelectUser] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCustomer]    Script Date: 14.11.2020 21:25:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateCustomer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_UpdateCustomer] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_UpdateCustomer]
	@CustomerID [int],
	@CustomerDetailID [int],
	@CompanyName [nvarchar](50),
	@ContactName [nvarchar](50),
	@ContactTitle [nvarchar](30),
	@Address [nvarchar](100),
	@Country [nvarchar](50),
	@Mail [nvarchar](20)
WITH EXECUTE AS CALLER
AS
begin
Update Customers set CustomerDetailID=@CustomerDetailID,CompanyName=@CompanyName,ContactName=@ContactName,ContactTitle=@ContactTitle,Address=@Address,Country=@Country,Mail=@Mail
where CustomerID=@CustomerID
End
GO
ALTER AUTHORIZATION ON [dbo].[sp_UpdateCustomer] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[sp_UpdateCustomer] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUser]    Script Date: 14.11.2020 21:25:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpdateUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_UpdateUser] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_UpdateUser]
	@UserID [int],
	@UserName [nvarchar](20),
	@Password [nvarchar](10)
WITH EXECUTE AS CALLER
AS
begin
 Update Users set UserName=@UserName, Password=@Password
 Where UserID=@UserID
 
 End
GO
ALTER AUTHORIZATION ON [dbo].[sp_UpdateUser] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[sp_UpdateUser] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[sp_UpddateCusDetail]    Script Date: 14.11.2020 21:25:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_UpddateCusDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_UpddateCusDetail] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_UpddateCusDetail]
	@CustomerDetailID [int],
	@CustomerType [nvarchar](50)
WITH EXECUTE AS CALLER
AS
begin
Update CustomerDetails set CustomerType=@CustomerType 
where  CustomerDetailID=@CustomerDetailID

End
GO
ALTER AUTHORIZATION ON [dbo].[sp_UpddateCusDetail] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[sp_UpddateCusDetail] TO  SCHEMA OWNER 
GO
USE [master]
GO
ALTER DATABASE [BasicCrm] SET  READ_WRITE 
GO
