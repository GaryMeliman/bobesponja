USE [master]
GO
/****** Object:  Database [autos]    Script Date: 15-05-2017 14:01:18 ******/
CREATE DATABASE [autos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'autos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\autos.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'autos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\autos_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [autos] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [autos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [autos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [autos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [autos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [autos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [autos] SET ARITHABORT OFF 
GO
ALTER DATABASE [autos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [autos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [autos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [autos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [autos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [autos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [autos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [autos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [autos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [autos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [autos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [autos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [autos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [autos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [autos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [autos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [autos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [autos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [autos] SET  MULTI_USER 
GO
ALTER DATABASE [autos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [autos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [autos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [autos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [autos] SET DELAYED_DURABILITY = DISABLED 
GO
USE [autos]
GO
/****** Object:  Table [dbo].[car]    Script Date: 15-05-2017 14:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[car](
	[id_car] [int] IDENTITY(1,1) NOT NULL,
	[id_marca] [int] NOT NULL,
	[id_modelo] [int] NOT NULL,
	[precio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_car] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[compra]    Script Date: 15-05-2017 14:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra](
	[id_compra] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_car] [int] NOT NULL,
	[total] [int] NOT NULL,
	[fecha_compra] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marca]    Script Date: 15-05-2017 14:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[marca](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[nombre_marca] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[modelo]    Script Date: 15-05-2017 14:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[modelo](
	[id_modelo] [int] IDENTITY(1,1) NOT NULL,
	[id_marcar] [int] NOT NULL,
	[nombre_modelo] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_modelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[perfil]    Script Date: 15-05-2017 14:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[perfil](
	[id_perfil] [int] IDENTITY(1,1) NOT NULL,
	[perfil] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[promocion]    Script Date: 15-05-2017 14:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promocion](
	[id_promocion] [int] IDENTITY(1,1) NOT NULL,
	[promocion] [int] NOT NULL,
	[id_car] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_promocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuario]    Script Date: 15-05-2017 14:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[correo] [varchar](40) NOT NULL,
	[psw] [varchar](100) NOT NULL,
	[id_perfil] [int] NOT NULL,
	[credito] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[reporte]    Script Date: 15-05-2017 14:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[reporte]
AS 
SELECT compra.total, compra.fecha_compra, usuario.correo, marca.nombre_marca, modelo.nombre_modelo FROM compra JOIN usuario ON compra.id_usuario = usuario.id_usuario JOIN car ON car.id_car = compra.id_car JOIN marca ON marca.id_marca = car.id_marca JOIN modelo ON modelo.id_modelo = car.id_modelo
GO
ALTER TABLE [dbo].[car]  WITH CHECK ADD FOREIGN KEY([id_marca])
REFERENCES [dbo].[marca] ([id_marca])
GO
ALTER TABLE [dbo].[car]  WITH CHECK ADD FOREIGN KEY([id_modelo])
REFERENCES [dbo].[modelo] ([id_modelo])
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[modelo]  WITH CHECK ADD FOREIGN KEY([id_marcar])
REFERENCES [dbo].[marca] ([id_marca])
GO
ALTER TABLE [dbo].[promocion]  WITH CHECK ADD FOREIGN KEY([id_car])
REFERENCES [dbo].[car] ([id_car])
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD FOREIGN KEY([id_perfil])
REFERENCES [dbo].[perfil] ([id_perfil])
GO
/****** Object:  StoredProcedure [dbo].[comprar]    Script Date: 15-05-2017 14:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[comprar]
	@id_car int,
	@id_usuario int,
	@total int
AS
	INSERT INTO compra values(@id_usuario, @id_car, @total,GETDATE());
	UPDATE usuario SET credito = credito - @total WHERE id_usuario = @id_usuario;

GO
/****** Object:  StoredProcedure [dbo].[Validate_User]    Script Date: 15-05-2017 14:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Validate_User]
      @Correo NVARCHAR(20),
      @Password NVARCHAR(20),
	  @UserId INT output,
	  @Tipo VARCHAR(20) output
AS
BEGIN
      SET NOCOUNT ON;
     
      SELECT @UserId = usuario.id_usuario, @Tipo = perfil.perfil
      FROM usuario 
	  JOIN perfil ON perfil.id_perfil = usuario.id_perfil
	  WHERE correo = @Correo AND psw = @Password
     
      IF @UserId IS NOT NULL
      BEGIN
            SELECT @UserId,@Tipo -- Credenciales buenas
      END
      ELSE
      BEGIN
            SELECT @UserId = 0, @Tipo = '' -- Credenciales malas
      END
END
GO
USE [master]
GO
ALTER DATABASE [autos] SET  READ_WRITE 
GO
