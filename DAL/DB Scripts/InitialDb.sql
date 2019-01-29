CREATE TABLE [dbo].[AppSettings](
	[AppSettingsID] [bigint] IDENTITY(1,1) NOT NULL,
	[SettingKey] [varchar](100) NOT NULL,
	[SettingValue] [varchar](max) NOT NULL,
	[Description] [varchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_AppSettings] PRIMARY KEY CLUSTERED 
(
	[AppSettingsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 01/01/2017 20:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](1000) NOT NULL,
	[ContactInfo] [varchar](max) NULL,
	[Email] [varchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerOrders]    Script Date: 01/01/2017 20:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerOrders](
	[OrderId] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerID] [bigint] NOT NULL,
	[Particularls] [varchar](max) NULL,
	[OrderDate] [datetime] NOT NULL,
	[DeliveryDate] [datetime] NULL,
	[Frame] [varchar](500) NULL,
	[Lenses] [varchar](500) NULL,
	[ContactLense] [varchar](500) NULL,
	[Total] [int] NULL,
	[Advance] [int] NULL,
	[Balance] [int] NULL,
	[Comments] [varchar](max) NULL,
	[RE_SPH_D] [varchar](20) NULL,
	[RE_SPH_R] [varchar](20) NULL,
	[RE_SPH_CL] [varchar](20) NULL,
	[RE_CYL_D] [varchar](20) NULL,
	[RE_CYL_R] [varchar](20) NULL,
	[RE_CYL_CL] [varchar](20) NULL,
	[RE_AXIS_D] [varchar](20) NULL,
	[RE_AXIS_R] [varchar](20) NULL,
	[RE_AXIS_CL] [varchar](20) NULL,
	[RE_VA_D] [varchar](20) NULL,
	[RE_VA_R] [varchar](20) NULL,
	[RE_VA_CL] [varchar](20) NULL,
	[LE_SPH_D] [varchar](20) NULL,
	[LE_SPH_R] [varchar](20) NULL,
	[LE_SPH_CL] [varchar](20) NULL,
	[LE_CYL_D] [varchar](20) NULL,
	[LE_CYL_R] [varchar](20) NULL,
	[LE_CYL_CL] [varchar](20) NULL,
	[LE_AXIS_D] [varchar](20) NULL,
	[LE_AXIS_R] [varchar](20) NULL,
	[LE_AXIS_CL] [varchar](20) NULL,
	[LE_VA_D] [varchar](20) NULL,
	[LE_VA_R] [varchar](20) NULL,
	[LE_VA_CL] [varchar](20) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NULL,
	[BookOrderNo] [varchar](100) NULL,
 CONSTRAINT [PK_CustomerOrders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SearchOrders]    Script Date: 01/01/2017 20:18:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec SearchOrders 'kas'
-- exec SearchOrders 'emo'
--  exec SearchOrders '','123'
--  exec SearchOrders '',''
CREATE PROCEDURE [dbo].[SearchOrders]
(
	@CustomerName varchar(max) = '',
	@CustomerContact varchar(max) = '',
	@OrderDate varchar(20) = '',
	@DeliveryDate varchar(20) = ''
)
AS
BEGIN
SELECT  CustomerOrders.OrderId, 
		CustomerOrders.CustomerID, 
		CustomerOrders.Particularls, 
		CONVERT(varchar(12), CustomerOrders.OrderDate,100) OrderDate, 
		CONVERT(varchar(12), CustomerOrders.DeliveryDate,100) DeliveryDate, 
        (CustomerOrders.Frame + ', ' + CustomerOrders.Lenses + ', ' + CustomerOrders.ContactLense) AS [F/L/C],
        CustomerOrders.Total, 
        CustomerOrders.Advance, 
        CustomerOrders.Balance, 
        Customers.Name CustomerName, 
        Customers.ContactInfo CustomerContact
FROM    CustomerOrders INNER JOIN
        Customers ON CustomerOrders.CustomerID = Customers.CustomerID
WHERE	(@CustomerName = '' OR Customers.Name like '%' + @CustomerName + '%')
		AND (@CustomerContact = '' OR Customers.ContactInfo like '%' + @CustomerContact + '%')
		order by CustomerOrders.DateCreated desc
END
GO
/****** Object:  ForeignKey [FK_CustomerOrders_Customers]    Script Date: 01/01/2017 20:18:40 ******/
ALTER TABLE [dbo].[CustomerOrders]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[CustomerOrders] CHECK CONSTRAINT [FK_CustomerOrders_Customers]
GO

INSERT [dbo].[AppSettings] ([SettingKey], [SettingValue], [Description], [IsActive]) VALUES (N'ShopName', N'AL-FAIZ OPTICS AND EYE CLINIC', N'Name Of Shop', 1)