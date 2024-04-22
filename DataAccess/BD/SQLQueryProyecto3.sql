USE [master]
GO
/****** Object:  Database [ACME]    Script Date: 22/4/2024 14:54:45 ******/
CREATE DATABASE [ACME]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ACME', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ACME.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ACME_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ACME_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ACME] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ACME].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ACME] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ACME] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ACME] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ACME] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ACME] SET ARITHABORT OFF 
GO
ALTER DATABASE [ACME] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ACME] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ACME] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ACME] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ACME] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ACME] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ACME] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ACME] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ACME] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ACME] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ACME] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ACME] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ACME] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ACME] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ACME] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ACME] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ACME] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ACME] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ACME] SET  MULTI_USER 
GO
ALTER DATABASE [ACME] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ACME] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ACME] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ACME] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ACME] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ACME] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ACME] SET QUERY_STORE = ON
GO
ALTER DATABASE [ACME] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ACME]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 22/4/2024 14:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[IDEmpresa] [int] NOT NULL,
	[IDTipoEmpresa] [int] NOT NULL,
	[Empresa] [varchar](50) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[RUC] [varchar](15) NOT NULL,
	[FechaCreacion] [date] NOT NULL,
	[Presupuesto] [decimal](18, 2) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[IDEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpresa]    Script Date: 22/4/2024 14:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEmpresa](
	[IDTipoEmpresa] [int] NOT NULL,
	[TipoEmpresa] [varchar](100) NULL,
	[Descripcion] [varchar](1000) NULL,
	[Sigla] [varchar](10) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_TipoEmpresa] PRIMARY KEY CLUSTERED 
(
	[IDTipoEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AnularEmpresa]    Script Date: 22/4/2024 14:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Aquí comienza la creación del nuevo procedimiento almacenado
CREATE PROCEDURE [dbo].[AnularEmpresa]
    @IDEmpresa int
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
    SET NOCOUNT ON;

    UPDATE [dbo].[Empresa]
    SET [Activo] = 0
    WHERE IDEmpresa = @IDEmpresa
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarEmpresa]    Script Date: 22/4/2024 14:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarEmpresa]
    @IDEmpresa int
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [IDEmpresa]
          ,[IDTipoEmpresa]
          ,[Empresa]
          ,[Direccion]
          ,[RUC]
          ,[FechaCreacion]
          ,[Presupuesto]
          ,[Activo]
    FROM [dbo].[Empresa]
    WHERE IDEmpresa = @IDEmpresa
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarEmpresa]    Script Date: 22/4/2024 14:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertarEmpresa]
    @IDTipoEmpresa int,
    @Empresa varchar(50),
    @Direccion varchar(100),
    @RUC varchar(15),
    @FechaCreacion date,
    @Presupuesto decimal(18, 3),
    @Activo bit,
    @IDEmpresa int OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Empresa] (
           [IDTipoEmpresa],
           [Empresa],
           [Direccion],
           [RUC],
           [FechaCreacion],
           [Presupuesto],
           [Activo])
    VALUES (
           @IDTipoEmpresa,
           @Empresa,
           @Direccion,
           @RUC,
           @FechaCreacion,
           @Presupuesto,
           @Activo);

    SELECT @IDEmpresa = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[ListarEmpresa]    Script Date: 22/4/2024 14:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ListarEmpresa]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
    SET NOCOUNT ON;

    SELECT [IDEmpresa]
          ,[IDTipoEmpresa]
          ,[Empresa]
          ,[Direccion]
          ,[RUC]
          ,[FechaCreacion]
          ,[Presupuesto]
          ,[Activo]
    FROM [dbo].[Empresa]
END
GO
/****** Object:  StoredProcedure [dbo].[ModificarEmpresa]    Script Date: 22/4/2024 14:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ModificarEmpresa]
    @IDEmpresa int,
    @IDTipoEmpresa int,
    @Empresa varchar(50),
    @Direccion varchar(100),
    @RUC varchar(15),
    @FechaCreacion date,
    @Presupuesto decimal(18, 2),
    @Activo bit
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.Empresa
    SET IDTipoEmpresa = @IDTipoEmpresa,
        Empresa = @Empresa,
        Direccion = @Direccion,
        RUC = @RUC,
        FechaCreacion = @FechaCreacion,
        Presupuesto = @Presupuesto,
        Activo = @Activo
    WHERE IDEmpresa = @IDEmpresa;
END
GO
USE [master]
GO
ALTER DATABASE [ACME] SET  READ_WRITE 
GO
