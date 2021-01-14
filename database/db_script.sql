USE [employee_management]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 1/8/2021 3:17:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](max) NULL,
	[last_name] [varchar](max) NULL,
	[email] [varchar](max) NULL,
	[password] [varchar](max) NULL,
	[contact] [varchar](max) NULL,
	[address] [varchar](max) NULL,
	[created_at] [date] NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[client]    Script Date: 1/8/2021 3:17:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[client](
	[client_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](max) NULL,
	[last_name] [varchar](max) NULL,
	[email] [varchar](max) NULL,
	[password] [varchar](max) NULL,
	[contact] [varchar](max) NULL,
	[address] [varchar](max) NULL,
	[created_at] [date] NULL,
 CONSTRAINT [PK_client] PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employee]    Script Date: 1/8/2021 3:17:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employee](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](max) NULL,
	[last_name] [varchar](max) NULL,
	[email] [varchar](max) NULL,
	[password] [varchar](max) NULL,
	[contact] [varchar](max) NULL,
	[address] [varchar](max) NULL,
	[skill] [varchar](max) NULL,
	[NIF] [varchar](max) NULL,
	[NISS] [varchar](max) NULL,
	[passport] [varchar](max) NULL,
	[visa] [varchar](max) NULL,
	[residence_card] [varchar](max) NULL,
	[SEF] [varchar](max) NULL,
	[boarding_pass] [varchar](max) NULL,
	[bank_account_number] [varchar](max) NULL,
	[working_shift] [varchar](max) NULL,
	[status] [varchar](max) NULL,
	[created_at] [date] NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 1/8/2021 3:17:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jobs](
	[job_id] [int] IDENTITY(1,1) NOT NULL,
	[job_title] [varchar](max) NULL,
	[job_details] [text] NULL,
	[job_start_date] [date] NULL,
	[job_end_date] [date] NULL,
	[job_duration] [varchar](max) NULL,
	[job_type] [varchar](max) NULL,
	[job_status] [varchar](max) NULL,
	[client_id] [int] NULL,
	[created_at] [date] NULL,
 CONSTRAINT [PK_jobs] PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[jobs_log]    Script Date: 1/8/2021 3:17:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobs_log](
	[id] [int] NOT NULL,
	[employee_id] [int] NULL,
	[job_id] [int] NULL,
	[payslip] [text] NULL,
 CONSTRAINT [PK_jobs_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([employee_id], [first_name], [last_name], [email], [password], [contact], [address], [skill], [NIF], [NISS], [passport], [visa], [residence_card], [SEF], [boarding_pass], [bank_account_number], [working_shift], [status], [created_at]) VALUES (2, N'Farooq234', N'Aziz', N'sdf@gmail.com', N'jUeMMDMm', N'sdf', N'sdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'day', NULL, NULL)
INSERT [dbo].[employee] ([employee_id], [first_name], [last_name], [email], [password], [contact], [address], [skill], [NIF], [NISS], [passport], [visa], [residence_card], [SEF], [boarding_pass], [bank_account_number], [working_shift], [status], [created_at]) VALUES (1002, N'Hassam', N'Saleem', N'hassamsaleem55@gmail.com', N'CxFc44$b', N'03070117297', N'Faisalabad', NULL, N'/Uploads/employee_documents/WhatsApp Image 2020-12-28 at 11_2021-01-08_01-13-04-PM.jpeg', N'/Uploads/employee_documents/131958740_1785024738329249_7994765635201030868_n_2021-01-08_12-59-15-AM.jpg', N'/Uploads/employee_documents/average-sales-report-dur_2021-01-08_12-59-16-AM.pdf', N'/Uploads/employee_documents/Jaun-Elia-with-his-Wife-and-Child_2021-01-08_12-59-17-AM.jpg', N'/Uploads/employee_documents/23561477_10155323926908422_6964011019121130846_n_2021-01-08_12-59-18-AM.jpg', N'/Uploads/employee_documents/Hassam Saleem Full Stack Developer Resume(2)_2021-01-08_12-59-19-AM.pdf', N'/Uploads/employee_documents/Hassam Saleem Full Stack Developer Resume_2021-01-08_12-59-23-AM.pdf', NULL, N'night', NULL, NULL)
SET IDENTITY_INSERT [dbo].[employee] OFF
