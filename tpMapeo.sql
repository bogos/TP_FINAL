USE [master]
GO
/****** Object:  Database [clasic_database]    Script Date: 30/04/2019 00:39:17 ******/
CREATE DATABASE [clasic_database]
GO
ALTER DATABASE [clasic_database] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [clasic_database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [clasic_database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [clasic_database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [clasic_database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [clasic_database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [clasic_database] SET ARITHABORT OFF 
GO
ALTER DATABASE [clasic_database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [clasic_database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [clasic_database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [clasic_database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [clasic_database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [clasic_database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [clasic_database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [clasic_database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [clasic_database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [clasic_database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [clasic_database] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [clasic_database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [clasic_database] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [clasic_database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [clasic_database] SET  MULTI_USER 
GO
ALTER DATABASE [clasic_database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [clasic_database] SET ENCRYPTION ON
GO
ALTER DATABASE [clasic_database] SET QUERY_STORE = ON
GO
ALTER DATABASE [clasic_database] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [clasic_database]
GO
/****** Object:  Table [dbo].[BC]    Script Date: 30/04/2019 00:39:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BC](
	[bc_id] [int] IDENTITY(1,1) NOT NULL,
	[contract_address] [varchar](50) NULL,
	[trx_hash] [varchar](100) NULL,
 CONSTRAINT [PK_BC] PRIMARY KEY CLUSTERED 
(
	[bc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CARRIER_MASTER]    Script Date: 30/04/2019 00:39:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARRIER_MASTER](
	[carrier_id] [int] NOT NULL,
	[tracking_id] [int] NULL,
	[name] [varchar](200) NULL,
	[contract_no] [int] NULL,
	[dni] [varchar](8) NULL,
	[address] [varchar](200) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_CARRIER_MASTER] PRIMARY KEY CLUSTERED 
(
	[carrier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CITY_MASTER]    Script Date: 30/04/2019 00:39:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CITY_MASTER](
	[city_id] [int] NOT NULL,
	[city_name] [varchar](100) NULL,
 CONSTRAINT [PK_CITY_MASTER] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT_MASTER]    Script Date: 30/04/2019 00:39:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT_MASTER](
	[product_id] [int] NOT NULL,
	[typproduct_id] [int] NULL,
	[product_name] [varchar](100) NULL,
	[flg_perishable] [bit] NULL,
 CONSTRAINT [PK_PRODUCT_MASTER] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTS_TRACKING]    Script Date: 30/04/2019 00:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTS_TRACKING](
	[ptracking_id] [int] NOT NULL,
	[tracking_id] [int] NULL,
	[product_id] [int] NULL,
	[units] [int] NULL,
	[metros_cub] [numeric](12, 2) NULL,
	[liters] [numeric](12, 2) NULL,
 CONSTRAINT [PK_PRODUCTS_TRACKING] PRIMARY KEY CLUSTERED 
(
	[ptracking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SENSOR_MASTER]    Script Date: 30/04/2019 00:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SENSOR_MASTER](
	[id_contrato] [varchar](100) NULL,
	[codigoseguimiento] [varchar](50) NULL,
	[temperatura] [numeric](12, 2) NULL,
	[humidity] [numeric](12, 2) NULL,
	[time] [datetime] NULL,
	[id_message] [int] NOT NULL,
	[id_sensor] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRACKING_TABLE]    Script Date: 30/04/2019 00:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRACKING_TABLE](
	[tracking_id] [varchar](200) NOT NULL,
	[expedition_date] [datetime] NULL,
	[city_id] [int] NULL,
	[address] [varchar](200) NULL,
	[destinity_address] [varchar](200) NULL,
	[ptracking_id] [int] NULL,
	[weight] [int] NULL,
	[delivery_term] [int] NULL,
	[state] [varchar](20) NULL,
	[value] [numeric](12, 2) NULL,
	[observations] [varchar](200) NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[location_id] [int] NULL,
	[id_contrato] [varchar](100) NULL,
	[carrier_id] [int] NULL,
	[user_id] [int] NULL,
	[id_sensor] [nvarchar](50) NULL,
	[product_id] [int] NULL,
	[product_name] [varchar](100) NULL,
	[product_unit] [int] NULL,
 CONSTRAINT [PK_TRACKING_TABLE] PRIMARY KEY CLUSTERED 
(
	[tracking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TYPPRODUCT_MASTER]    Script Date: 30/04/2019 00:39:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TYPPRODUCT_MASTER](
	[typproduct_id] [int] NOT NULL,
	[typ_name] [varchar](100) NULL,
 CONSTRAINT [PK_TYPPRODUCT_MASTER] PRIMARY KEY CLUSTERED 
(
	[typproduct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER_MASTER]    Script Date: 30/04/2019 00:39:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_MASTER](
	[user_id] [int] NOT NULL,
	[user_name] [varchar](20) NULL,
	[password] [varchar](20) NULL,
	[contract_no] [int] NULL,
	[user_type] [varchar](20) NULL,
	[ruc] [varchar](13) NULL,
	[razon_social] [varchar](100) NULL,
	[location] [varchar](100) NULL,
	[address] [varchar](200) NULL,
 CONSTRAINT [PK_USER_MASTER] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BC] ON 

INSERT [dbo].[BC] ([bc_id], [contract_address], [trx_hash]) VALUES (1, N'dosmdksa', N'dncskdjmfd')
INSERT [dbo].[BC] ([bc_id], [contract_address], [trx_hash]) VALUES (2, N'segundavuelta', N'segundavuelta')
SET IDENTITY_INSERT [dbo].[BC] OFF
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (1, 0, N'Carlos Diaz', 990825257, N'04032466', N'Psje. Camelias 521', N'carlosdias@gmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (2, 0, N'Nora Castillo', 990425257, N'38549873', N'Calle Orquideas 101', N'noritacast@gmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (3, 0, N'Jerson Rivas', 940872014, N'81489929', N'Calle San Felipe 304', N'jersonrivas@gmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (4, 0, N'Andre Neyra', 990567890, N'48146233', N'Av. La Molina 560', N'neyraandre@hotmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (5, 0, N'Daniela Soto', 379064362, N'42318313', N'Psje. Victoria 100', N'danielasoto@hotmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (6, 0, N'Edgar Diaz', 658177207, N'52551932', N'Calle Villaran 301', N'ediaz@hotmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (7, 0, N'Jimmy Armas', 136129087, N'15615441', N'Psje. Los frutales mz Q lote 8', N'jimmyarmas@hotmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (8, 0, N'Rosario Villalta', 109006433, N'13111942', N'Av. Brasil 301', N'rvillalta@hotmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (9, 0, N'Diego Galvez', 693500230, N'18475637', N'Calle Andres Brusco 300', N'diegogalvez08@hotmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (10, 0, N'Victor Castillo', 813436435, N'96461634', N'Av. Paseo la Castellana 550', N'vitemade@hotmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (11, 0, N'Jorge Tarazona', 813436435, N'83393851', N'Psje. Jupiter 560', N'jtarazona@hotmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (12, 0, N'Rocio Talexio', 934285219, N'85428832', N'Prolongacion Primavera 149', N'rltalexio@hotmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (13, 0, N'Milagros Castillo', 175528272, N'65625655', N'Calle Domingo Orué', N'milicastillo@hotmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (14, 0, N'Judith Tucto', 884041363, N'29734444', N'Calle Vía Lactea 123', N'jtucto@hotmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (15, 0, N'Armando Rivas', 133652283, N'34937531', N'Av. Tomas Marsano 113', N'arivas@hotmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (16, 0, N'Peter Rojas', 259711638, N'41511116', N'Av. Reducto 356', N'peterojas@hotmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (17, 0, N'Melanie Alzamora', 77582628, N'88146673', N'Psje. Parasol Mz Q lote 9', N'melaalzamora@hotmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (18, 0, N'Dalia Nuñez', 431266368, N'22237622', N'Jr. 9 470', N'dnunez@hotmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (19, 0, N'Daniel Burga', 759090766, N'36892166', N'Jr. Ricadona 430', N'danielburgad@hotmail.com')
INSERT [dbo].[CARRIER_MASTER] ([carrier_id], [tracking_id], [name], [contract_no], [dni], [address], [email]) VALUES (20, 0, N'Diego Carrasco', 153844258, N'43749332', N'Calle Dominguez Garcia 450', N'dcarrasco@hotmail.com')
INSERT [dbo].[CITY_MASTER] ([city_id], [city_name]) VALUES (1, N'Lima')
INSERT [dbo].[CITY_MASTER] ([city_id], [city_name]) VALUES (2, N'Arequipa')
INSERT [dbo].[CITY_MASTER] ([city_id], [city_name]) VALUES (3, N'Trujillo')
INSERT [dbo].[CITY_MASTER] ([city_id], [city_name]) VALUES (4, N'Chiclayo')
INSERT [dbo].[CITY_MASTER] ([city_id], [city_name]) VALUES (5, N'Piura')
INSERT [dbo].[CITY_MASTER] ([city_id], [city_name]) VALUES (6, N'Tacna')
INSERT [dbo].[CITY_MASTER] ([city_id], [city_name]) VALUES (7, N'Iquitos')
INSERT [dbo].[CITY_MASTER] ([city_id], [city_name]) VALUES (8, N'Huancayo')
INSERT [dbo].[CITY_MASTER] ([city_id], [city_name]) VALUES (9, N'Ica')
INSERT [dbo].[CITY_MASTER] ([city_id], [city_name]) VALUES (10, N'Chimbote')
INSERT [dbo].[CITY_MASTER] ([city_id], [city_name]) VALUES (11, N'Puno')
INSERT [dbo].[CITY_MASTER] ([city_id], [city_name]) VALUES (12, N'Tumbes')
INSERT [dbo].[CITY_MASTER] ([city_id], [city_name]) VALUES (13, N'Ayacucho')
INSERT [dbo].[CITY_MASTER] ([city_id], [city_name]) VALUES (14, N'Huaraz')
INSERT [dbo].[CITY_MASTER] ([city_id], [city_name]) VALUES (15, N'Callao')
INSERT [dbo].[PRODUCT_MASTER] ([product_id], [typproduct_id], [product_name], [flg_perishable]) VALUES (1, 1, N'Lomo de res', 1)
INSERT [dbo].[PRODUCT_MASTER] ([product_id], [typproduct_id], [product_name], [flg_perishable]) VALUES (2, 4, N'Leche', 1)
INSERT [dbo].[PRODUCT_MASTER] ([product_id], [typproduct_id], [product_name], [flg_perishable]) VALUES (3, 6, N'Tilapia', 1)
INSERT [dbo].[PRODUCT_MASTER] ([product_id], [typproduct_id], [product_name], [flg_perishable]) VALUES (4, 7, N'Papa', 0)
INSERT [dbo].[PRODUCT_MASTER] ([product_id], [typproduct_id], [product_name], [flg_perishable]) VALUES (5, 3, N'Fresas', 1)
INSERT [dbo].[PRODUCT_MASTER] ([product_id], [typproduct_id], [product_name], [flg_perishable]) VALUES (6, 3, N'Mango', 1)
INSERT [dbo].[PRODUCT_MASTER] ([product_id], [typproduct_id], [product_name], [flg_perishable]) VALUES (7, 4, N'Queso', 1)
INSERT [dbo].[PRODUCT_MASTER] ([product_id], [typproduct_id], [product_name], [flg_perishable]) VALUES (8, 2, N'Hot Dog', 1)
INSERT [dbo].[PRODUCT_MASTER] ([product_id], [typproduct_id], [product_name], [flg_perishable]) VALUES (9, 3, N'Lechuga', 1)
INSERT [dbo].[PRODUCT_MASTER] ([product_id], [typproduct_id], [product_name], [flg_perishable]) VALUES (10, 5, N'Frejol', 0)
INSERT [dbo].[PRODUCT_MASTER] ([product_id], [typproduct_id], [product_name], [flg_perishable]) VALUES (11, 2, N'Nuggets', 1)
INSERT [dbo].[PRODUCT_MASTER] ([product_id], [typproduct_id], [product_name], [flg_perishable]) VALUES (12, 4, N'Jamon de pavo', 1)
INSERT [dbo].[PRODUCT_MASTER] ([product_id], [typproduct_id], [product_name], [flg_perishable]) VALUES (13, 7, N'Yuca', 1)
INSERT [dbo].[PRODUCT_MASTER] ([product_id], [typproduct_id], [product_name], [flg_perishable]) VALUES (14, 1, N'Pollo', 1)
INSERT [dbo].[PRODUCT_MASTER] ([product_id], [typproduct_id], [product_name], [flg_perishable]) VALUES (15, 4, N'Huevos', 1)
INSERT [dbo].[PRODUCT_MASTER] ([product_id], [typproduct_id], [product_name], [flg_perishable]) VALUES (16, 1, N'Lomo de cerdo', 1)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(28.49 AS Numeric(12, 2)), CAST(75.34 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:16.570' AS DateTime), 36, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(29.29 AS Numeric(12, 2)), CAST(65.52 AS Numeric(12, 2)), CAST(N'2019-04-29T20:17:44.847' AS DateTime), 20, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(25.06 AS Numeric(12, 2)), CAST(66.11 AS Numeric(12, 2)), CAST(N'2019-04-29T20:17:46.743' AS DateTime), 21, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(24.99 AS Numeric(12, 2)), CAST(73.65 AS Numeric(12, 2)), CAST(N'2019-04-29T20:17:49.070' AS DateTime), 22, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(28.50 AS Numeric(12, 2)), CAST(72.20 AS Numeric(12, 2)), CAST(N'2019-04-29T20:17:50.603' AS DateTime), 23, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(22.61 AS Numeric(12, 2)), CAST(73.42 AS Numeric(12, 2)), CAST(N'2019-04-29T20:17:52.633' AS DateTime), 24, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(27.66 AS Numeric(12, 2)), CAST(73.95 AS Numeric(12, 2)), CAST(N'2019-04-29T20:17:54.790' AS DateTime), 25, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(25.44 AS Numeric(12, 2)), CAST(66.43 AS Numeric(12, 2)), CAST(N'2019-04-29T20:17:56.580' AS DateTime), 26, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(23.34 AS Numeric(12, 2)), CAST(73.31 AS Numeric(12, 2)), CAST(N'2019-04-29T20:17:58.807' AS DateTime), 27, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(31.05 AS Numeric(12, 2)), CAST(70.12 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:00.650' AS DateTime), 28, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(29.44 AS Numeric(12, 2)), CAST(79.66 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:02.697' AS DateTime), 29, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(25.01 AS Numeric(12, 2)), CAST(71.23 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:05.163' AS DateTime), 30, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(30.63 AS Numeric(12, 2)), CAST(70.53 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:06.493' AS DateTime), 31, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(31.59 AS Numeric(12, 2)), CAST(62.00 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:09.713' AS DateTime), 32, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(22.46 AS Numeric(12, 2)), CAST(75.35 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:10.820' AS DateTime), 33, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(20.64 AS Numeric(12, 2)), CAST(67.11 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:14.260' AS DateTime), 34, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(26.33 AS Numeric(12, 2)), CAST(71.70 AS Numeric(12, 2)), CAST(N'2019-04-29T20:17:29.093' AS DateTime), 12, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(26.39 AS Numeric(12, 2)), CAST(61.98 AS Numeric(12, 2)), CAST(N'2019-04-29T20:17:30.763' AS DateTime), 13, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(20.18 AS Numeric(12, 2)), CAST(77.49 AS Numeric(12, 2)), CAST(N'2019-04-29T20:17:32.803' AS DateTime), 14, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(23.95 AS Numeric(12, 2)), CAST(69.62 AS Numeric(12, 2)), CAST(N'2019-04-29T20:17:34.537' AS DateTime), 15, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(27.07 AS Numeric(12, 2)), CAST(72.56 AS Numeric(12, 2)), CAST(N'2019-04-29T20:17:36.833' AS DateTime), 16, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(20.53 AS Numeric(12, 2)), CAST(71.37 AS Numeric(12, 2)), CAST(N'2019-04-29T20:17:38.740' AS DateTime), 17, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(25.40 AS Numeric(12, 2)), CAST(63.51 AS Numeric(12, 2)), CAST(N'2019-04-29T20:17:40.707' AS DateTime), 18, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(25.01 AS Numeric(12, 2)), CAST(62.28 AS Numeric(12, 2)), CAST(N'2019-04-29T20:17:42.613' AS DateTime), 19, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(30.19 AS Numeric(12, 2)), CAST(78.50 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:14.790' AS DateTime), 35, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(21.33 AS Numeric(12, 2)), CAST(70.94 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:18.727' AS DateTime), 37, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(24.19 AS Numeric(12, 2)), CAST(77.31 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:20.680' AS DateTime), 38, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(24.41 AS Numeric(12, 2)), CAST(77.13 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:22.650' AS DateTime), 39, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(28.53 AS Numeric(12, 2)), CAST(68.03 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:24.650' AS DateTime), 40, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(20.66 AS Numeric(12, 2)), CAST(68.05 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:26.617' AS DateTime), 41, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(30.59 AS Numeric(12, 2)), CAST(79.13 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:28.680' AS DateTime), 42, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(22.40 AS Numeric(12, 2)), CAST(63.79 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:30.570' AS DateTime), 43, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(23.53 AS Numeric(12, 2)), CAST(63.84 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:32.737' AS DateTime), 44, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(23.35 AS Numeric(12, 2)), CAST(77.63 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:35.013' AS DateTime), 45, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(28.81 AS Numeric(12, 2)), CAST(61.92 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:37.313' AS DateTime), 46, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(31.60 AS Numeric(12, 2)), CAST(76.49 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:38.867' AS DateTime), 47, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(24.58 AS Numeric(12, 2)), CAST(78.98 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:40.897' AS DateTime), 48, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(27.63 AS Numeric(12, 2)), CAST(77.85 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:42.913' AS DateTime), 49, NULL)
INSERT [dbo].[SENSOR_MASTER] ([id_contrato], [codigoseguimiento], [temperatura], [humidity], [time], [id_message], [id_sensor]) VALUES (NULL, N'bf1096ec-08c0-42c2-9971-d22d43c73070', CAST(25.32 AS Numeric(12, 2)), CAST(60.96 AS Numeric(12, 2)), CAST(N'2019-04-29T20:18:44.900' AS DateTime), 50, NULL)
INSERT [dbo].[TRACKING_TABLE] ([tracking_id], [expedition_date], [city_id], [address], [destinity_address], [ptracking_id], [weight], [delivery_term], [state], [value], [observations], [start_time], [end_time], [location_id], [id_contrato], [carrier_id], [user_id], [id_sensor], [product_id], [product_name], [product_unit]) VALUES (N'hasdas22dola', CAST(N'2019-04-28T15:25:26.883' AS DateTime), 1, N'', N'', NULL, 10, NULL, N'a', CAST(10.34 AS Numeric(12, 2)), N'lili', CAST(N'2019-04-01T00:00:00.000' AS DateTime), CAST(N'2019-04-01T00:00:00.000' AS DateTime), NULL, N'lwlw', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRACKING_TABLE] ([tracking_id], [expedition_date], [city_id], [address], [destinity_address], [ptracking_id], [weight], [delivery_term], [state], [value], [observations], [start_time], [end_time], [location_id], [id_contrato], [carrier_id], [user_id], [id_sensor], [product_id], [product_name], [product_unit]) VALUES (N'hola121', CAST(N'2019-04-28T20:40:39.010' AS DateTime), 7, N'', N'', NULL, 12, NULL, N'', CAST(104.00 AS Numeric(12, 2)), N'hola2', CAST(N'2019-04-13T00:00:00.000' AS DateTime), CAST(N'2019-04-25T00:00:00.000' AS DateTime), NULL, N'', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRACKING_TABLE] ([tracking_id], [expedition_date], [city_id], [address], [destinity_address], [ptracking_id], [weight], [delivery_term], [state], [value], [observations], [start_time], [end_time], [location_id], [id_contrato], [carrier_id], [user_id], [id_sensor], [product_id], [product_name], [product_unit]) VALUES (N'hola121s1', CAST(N'2019-04-28T20:40:52.657' AS DateTime), 7, N'', N'', NULL, 12, NULL, N'', CAST(104.00 AS Numeric(12, 2)), N'hola2', CAST(N'2019-04-13T00:00:00.000' AS DateTime), CAST(N'2019-04-25T00:00:00.000' AS DateTime), NULL, N'', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRACKING_TABLE] ([tracking_id], [expedition_date], [city_id], [address], [destinity_address], [ptracking_id], [weight], [delivery_term], [state], [value], [observations], [start_time], [end_time], [location_id], [id_contrato], [carrier_id], [user_id], [id_sensor], [product_id], [product_name], [product_unit]) VALUES (N'hola123', CAST(N'2019-04-28T20:39:37.820' AS DateTime), 7, N'', N'', NULL, 10, NULL, N'', CAST(10.20 AS Numeric(12, 2)), N'hola2', CAST(N'2019-04-19T00:00:00.000' AS DateTime), CAST(N'2019-04-26T00:00:00.000' AS DateTime), NULL, N'', 7, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRACKING_TABLE] ([tracking_id], [expedition_date], [city_id], [address], [destinity_address], [ptracking_id], [weight], [delivery_term], [state], [value], [observations], [start_time], [end_time], [location_id], [id_contrato], [carrier_id], [user_id], [id_sensor], [product_id], [product_name], [product_unit]) VALUES (N'hola125', CAST(N'2019-04-28T20:39:52.760' AS DateTime), 7, N'', N'', NULL, 10, NULL, N'', CAST(104.00 AS Numeric(12, 2)), N'hola2', CAST(N'2019-04-19T00:00:00.000' AS DateTime), CAST(N'2019-04-26T00:00:00.000' AS DateTime), NULL, N'', 7, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRACKING_TABLE] ([tracking_id], [expedition_date], [city_id], [address], [destinity_address], [ptracking_id], [weight], [delivery_term], [state], [value], [observations], [start_time], [end_time], [location_id], [id_contrato], [carrier_id], [user_id], [id_sensor], [product_id], [product_name], [product_unit]) VALUES (N'test2', CAST(N'2019-04-28T15:26:30.413' AS DateTime), 5, N'', N'', NULL, 10, NULL, N'', CAST(10.00 AS Numeric(12, 2)), N'hola qe tal', CAST(N'2019-04-10T00:00:00.000' AS DateTime), CAST(N'2019-04-16T00:00:00.000' AS DateTime), NULL, N'', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TRACKING_TABLE] ([tracking_id], [expedition_date], [city_id], [address], [destinity_address], [ptracking_id], [weight], [delivery_term], [state], [value], [observations], [start_time], [end_time], [location_id], [id_contrato], [carrier_id], [user_id], [id_sensor], [product_id], [product_name], [product_unit]) VALUES (N'test24', CAST(N'2019-04-28T20:37:54.067' AS DateTime), 5, N'', N'', NULL, 10, 235, N'ni sé!', CAST(10.00 AS Numeric(12, 2)), N'hola que hace?', NULL, NULL, NULL, N'', 11, NULL, NULL, NULL, NULL, 150)
INSERT [dbo].[TYPPRODUCT_MASTER] ([typproduct_id], [typ_name]) VALUES (1, N'Carne cruda fresca')
INSERT [dbo].[TYPPRODUCT_MASTER] ([typproduct_id], [typ_name]) VALUES (2, N'Carne cruda procesada')
INSERT [dbo].[TYPPRODUCT_MASTER] ([typproduct_id], [typ_name]) VALUES (3, N'Frutas y verduras')
INSERT [dbo].[TYPPRODUCT_MASTER] ([typproduct_id], [typ_name]) VALUES (4, N'Lácteos y derivados')
INSERT [dbo].[TYPPRODUCT_MASTER] ([typproduct_id], [typ_name]) VALUES (5, N'Oleaginosas y Legumbres')
INSERT [dbo].[TYPPRODUCT_MASTER] ([typproduct_id], [typ_name]) VALUES (6, N'Pescados y Mariscos')
INSERT [dbo].[TYPPRODUCT_MASTER] ([typproduct_id], [typ_name]) VALUES (7, N'Raíces y Tuberculos')
INSERT [dbo].[USER_MASTER] ([user_id], [user_name], [password], [contract_no], [user_type], [ruc], [razon_social], [location], [address]) VALUES (1, N'polar_log', N'123', 44083301, N'Customer', N'20211614545', N'POLAR LOGISTICA EN FRIO S.A.C', N'Lima', N'Avenida de las Artes Norte 800')
INSERT [dbo].[USER_MASTER] ([user_id], [user_name], [password], [contract_no], [user_type], [ruc], [razon_social], [location], [address]) VALUES (2, N'str_log', N'456', 3867469, N'Customer', N'20602156436', N'STR DEL PERÚ S.A.C', N'Lima', N'Mz. A-1 Lt. 12  Asc. Intihuatana')
INSERT [dbo].[USER_MASTER] ([user_id], [user_name], [password], [contract_no], [user_type], [ruc], [razon_social], [location], [address]) VALUES (3, N'aries_cargo', N'678', 4786906, N'Customer', N'20508496274', N'ARIES CARGO S.A.C', N'Lima', N'Jiron Los Robles 201 Piso 2 - Urb. Alto Los Ficus')
INSERT [dbo].[USER_MASTER] ([user_id], [user_name], [password], [contract_no], [user_type], [ruc], [razon_social], [location], [address]) VALUES (4, N'ice_cargo', N'123', 962919779, N'Customer', N'20600114248', N'ICE CARGO S.A.C', N'Callao', N'Urbanizacion SESQUICENTENARIO MZA. G')
INSERT [dbo].[USER_MASTER] ([user_id], [user_name], [password], [contract_no], [user_type], [ruc], [razon_social], [location], [address]) VALUES (5, N'promar_log', N'333', 990425257, N'Customer', N'20211614567', N'PROMAR S.A.C', N'Arequipa', N'José Abelardo Quiñones E-10 - PJ Buenos Aires Zona B - Cayma')
INSERT [dbo].[USER_MASTER] ([user_id], [user_name], [password], [contract_no], [user_type], [ruc], [razon_social], [location], [address]) VALUES (6, N'orell_log', N'123', 2728344, N'Customer', N'20556233412', N'GRUPO ORELL LOGÍSTICA S.A.C', N'Lima', N'Avenida Circunvalación Mz. L Lote. 22')
INSERT [dbo].[USER_MASTER] ([user_id], [user_name], [password], [contract_no], [user_type], [ruc], [razon_social], [location], [address]) VALUES (7, N'transporte_sl', N'555', 965998053, N'Customer', N'20211614123', N'TRANSPORTE SAN LUIS J&C S.A.C', N'Lima', N'Alameda Cl Calderón de la Barca ,145 - Dpt 402 Urb. Bartolomé Herrera')
INSERT [dbo].[USER_MASTER] ([user_id], [user_name], [password], [contract_no], [user_type], [ruc], [razon_social], [location], [address]) VALUES (8, N'tiba_cargo', N'777', 990584567, N'Customer', N'20601410398', N'TIBA CARGO PERÚ S.A.C', N'Lima', N'Av. Tomas Ramsey Nro. 930 Int. 1005')
INSERT [dbo].[USER_MASTER] ([user_id], [user_name], [password], [contract_no], [user_type], [ruc], [razon_social], [location], [address]) VALUES (9, N'gens_log', N'756', 986099550, N'Customer', N'20807487034', N'LOGISTICA GENS SRL', N'Trujillo', N'Calle Las flores 457')
INSERT [dbo].[USER_MASTER] ([user_id], [user_name], [password], [contract_no], [user_type], [ruc], [razon_social], [location], [address]) VALUES (10, N'car_srl', N'563', 440765435, N'Customer', N'20565344588', N'CAR LOGISTICA PERU S.R.L.', N'Lima', N'Av. General Murillo Mza. O1 Lote. 4')
INSERT [dbo].[USER_MASTER] ([user_id], [user_name], [password], [contract_no], [user_type], [ruc], [razon_social], [location], [address]) VALUES (11, N'noract', N'123', 990425257, N'Admin', N'', N'', N'Lima', N'Av. Villaran Cuadra 7')
ALTER TABLE [dbo].[PRODUCT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_MASTER_TYPPRODUCT_MASTER] FOREIGN KEY([typproduct_id])
REFERENCES [dbo].[TYPPRODUCT_MASTER] ([typproduct_id])
GO
ALTER TABLE [dbo].[PRODUCT_MASTER] CHECK CONSTRAINT [FK_PRODUCT_MASTER_TYPPRODUCT_MASTER]
GO
ALTER TABLE [dbo].[PRODUCTS_TRACKING]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTS_TRACKING_PRODUCT_MASTER] FOREIGN KEY([product_id])
REFERENCES [dbo].[PRODUCT_MASTER] ([product_id])
GO
ALTER TABLE [dbo].[PRODUCTS_TRACKING] CHECK CONSTRAINT [FK_PRODUCTS_TRACKING_PRODUCT_MASTER]
GO
ALTER TABLE [dbo].[TRACKING_TABLE]  WITH CHECK ADD  CONSTRAINT [FK_TRACKING_TABLE_CARRIER_MASTER] FOREIGN KEY([carrier_id])
REFERENCES [dbo].[CARRIER_MASTER] ([carrier_id])
GO
ALTER TABLE [dbo].[TRACKING_TABLE] CHECK CONSTRAINT [FK_TRACKING_TABLE_CARRIER_MASTER]
GO
ALTER TABLE [dbo].[TRACKING_TABLE]  WITH CHECK ADD  CONSTRAINT [FK_TRACKING_TABLE_CITY_MASTER] FOREIGN KEY([city_id])
REFERENCES [dbo].[CITY_MASTER] ([city_id])
GO
ALTER TABLE [dbo].[TRACKING_TABLE] CHECK CONSTRAINT [FK_TRACKING_TABLE_CITY_MASTER]
GO
ALTER TABLE [dbo].[TRACKING_TABLE]  WITH CHECK ADD  CONSTRAINT [FK_TRACKING_TABLE_PRODUCTS_TRACKING] FOREIGN KEY([ptracking_id])
REFERENCES [dbo].[PRODUCTS_TRACKING] ([ptracking_id])
GO
ALTER TABLE [dbo].[TRACKING_TABLE] CHECK CONSTRAINT [FK_TRACKING_TABLE_PRODUCTS_TRACKING]
GO
ALTER TABLE [dbo].[TRACKING_TABLE]  WITH CHECK ADD  CONSTRAINT [FK_TRACKING_TABLE_USER_MASTER] FOREIGN KEY([user_id])
REFERENCES [dbo].[USER_MASTER] ([user_id])
GO
ALTER TABLE [dbo].[TRACKING_TABLE] CHECK CONSTRAINT [FK_TRACKING_TABLE_USER_MASTER]
GO
USE [master]
GO
ALTER DATABASE [clasic_database] SET  READ_WRITE 
GO
