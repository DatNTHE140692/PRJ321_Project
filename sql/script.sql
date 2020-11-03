USE [Furniture]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/3/2020 14:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 11/3/2020 14:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[ctid] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [varchar](150) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[subject] [varchar](150) NOT NULL,
	[message] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ctid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_Categories]    Script Date: 11/3/2020 14:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Categories](
	[pid] [int] NOT NULL,
	[cid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC,
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Comments]    Script Date: 11/3/2020 14:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_Comments](
	[cmtid] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NULL,
	[uid] [int] NULL,
	[cdate] [datetime] NULL,
	[comment] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cmtid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_Images]    Script Date: 11/3/2020 14:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_Images](
	[imgid] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NULL,
	[imageURL] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[imgid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/3/2020 14:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[pname] [varchar](max) NOT NULL,
	[price] [float] NOT NULL,
	[pshortdesc] [varchar](max) NOT NULL,
	[pdesc] [varchar](max) NOT NULL,
	[available] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/3/2020 14:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[fullname] [varchar](150) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[address] [varchar](150) NOT NULL,
	[phonenumber] [varchar](150) NOT NULL,
	[avatarURL] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([cid], [cname]) VALUES (1, N'Sofa')
INSERT [dbo].[Categories] ([cid], [cname]) VALUES (2, N'Table')
INSERT [dbo].[Categories] ([cid], [cname]) VALUES (3, N'Chair')
INSERT [dbo].[Categories] ([cid], [cname]) VALUES (4, N'Decore')
SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[Product_Categories] ([pid], [cid]) VALUES (3, 1)
SET IDENTITY_INSERT [dbo].[Product_Comments] ON 

INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (5, 3, 1, CAST(N'2020-11-02 13:11:45.637' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam metus nisi, interdum eu nibh ac, faucibus vehicula lorem. Ut aliquet condimentum lectus. Ut ullamcorper rhoncus felis, in sodales dui dapibus ut. Phasellus consequat ipsum ut urna pulvinar, et porta eros tempor. Aliquam egestas, dolor ac vulputate rutrum, nisl quam fermentum ante, feugiat pharetra odio purus vel ante. Aliquam erat volutpat. Donec feugiat, lorem id luctus porta, odio metus ullamcorper ligula, vel aliquam ex ante vel mi. Donec bibendum facilisis nunc, in feugiat magna pellentesque id. Etiam luctus, ipsum feugiat placerat gravida, tellus tortor facilisis velit, nec consequat nibh sapien sit amet tortor.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (6, 3, 1, CAST(N'2020-11-02 13:11:59.853' AS DateTime), N'Nullam nunc nunc, ornare ut aliquet vel, cursus at libero. Etiam a erat nunc. Fusce blandit orci vel venenatis venenatis. Phasellus eu ultricies sapien. Cras turpis tellus, ornare ut nibh sed, feugiat pretium ex. Cras lobortis enim tempus leo viverra tristique. Mauris mattis mollis ligula, eget blandit tortor molestie et. Mauris libero dolor, pretium sed arcu at, lobortis rutrum lorem. Aenean eget luctus elit. Sed aliquet augue libero, sit amet pharetra nibh accumsan vitae. Nunc interdum dignissim lacus quis finibus. Fusce vitae orci eros. Sed pellentesque, lectus non varius malesuada, justo lacus molestie tortor, a fermentum justo eros vel eros. Ut luctus sem ut risus congue dapibus. Donec luctus tortor a laoreet lobortis. Suspendisse erat eros, venenatis placerat pretium eu, posuere quis erat.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (7, 3, 1, CAST(N'2020-11-02 13:12:13.283' AS DateTime), N'Aenean dictum dapibus nibh, varius fermentum quam placerat et. Etiam molestie nulla nisi, vel vestibulum nunc pulvinar a. Nulla magna urna, eleifend nec tellus quis, dictum vulputate mauris. Quisque scelerisque, diam sit amet placerat blandit, orci erat tincidunt est, eu aliquam sem libero at odio. Duis pellentesque libero et ex scelerisque rutrum. Suspendisse in congue ligula. Donec maximus elementum ultrices. Nam porta rutrum nulla, sit amet sagittis diam malesuada lobortis. Curabitur eleifend velit venenatis, accumsan nulla vel, porta massa. Mauris dapibus tincidunt malesuada. Donec non purus maximus, porttitor libero vel, placerat lorem. Maecenas posuere pretium sem quis fermentum. Aliquam a convallis ex. Duis venenatis, ante sit amet egestas vulputate, nunc enim imperdiet nulla, eu eleifend orci augue nec erat. Maecenas eu nisl vel risus vehicula porta eu ullamcorper urna. Integer quam mauris, laoreet in condimentum ut, commodo vel neque.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (8, 3, 6, CAST(N'2020-11-02 13:13:09.020' AS DateTime), N'Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque vitae molestie ipsum, non suscipit enim. Praesent imperdiet viverra quam in aliquam. In efficitur diam velit, eget placerat ex egestas id. Nam facilisis, tortor eu convallis venenatis, dui nibh commodo mauris, vel efficitur arcu massa ac ante. Pellentesque ornare urna sed elit facilisis viverra. Vestibulum ac consectetur diam, non rutrum dui. Integer lacinia lacus tortor, id mattis lectus viverra in. Aliquam erat volutpat.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (9, 3, 7, CAST(N'2020-11-02 13:16:07.283' AS DateTime), N'Aliquam tempor nulla nec elit ultricies scelerisque. Nulla bibendum massa a enim cursus, vel tincidunt leo condimentum. Nulla nulla ante, eleifend ut vestibulum at, faucibus non sapien. Quisque malesuada purus ac diam aliquet, at vehicula nibh egestas. Vestibulum finibus laoreet ultricies. Vestibulum ac magna quis ex rutrum aliquam. Phasellus facilisis dolor in sapien bibendum, non molestie est dictum. Ut in est gravida libero hendrerit faucibus vitae at quam. Suspendisse vehicula dapibus dui ac suscipit. Vestibulum feugiat velit at diam vestibulum interdum in eu velit. Suspendisse elementum mi tortor, in cursus augue dignissim vitae. Proin sit amet efficitur tortor. Morbi ipsum urna, interdum ac faucibus eget, tristique sed lectus. In rhoncus accumsan lacus rutrum ultricies. Pellentesque eget velit sit amet neque pellentesque lacinia. Suspendisse semper felis sed urna sagittis porta.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (10, 3, 1, CAST(N'2020-11-02 22:08:01.890' AS DateTime), N'Aenean dictum dapibus nibh, varius fermentum quam placerat et. Etiam molestie nulla nisi, vel vestibulum nunc pulvinar a. Nulla magna urna, eleifend nec tellus quis, dictum vulputate mauris. Quisque scelerisque, diam sit amet placerat blandit, orci erat tincidunt est, eu aliquam sem libero at odio. Duis pellentesque libero et ex scelerisque rutrum. Suspendisse in congue ligula. Donec maximus elementum ultrices. Nam porta rutrum nulla, sit amet sagittis diam malesuada lobortis. Curabitur eleifend velit venenatis, accumsan nulla vel, porta massa. Mauris dapibus tincidunt malesuada. Donec non purus maximus, porttitor libero vel, placerat lorem. Maecenas posuere pretium sem quis fermentum. Aliquam a convallis ex. Duis venenatis, ante sit amet egestas vulputate, nunc enim imperdiet nulla, eu eleifend orci augue nec erat. Maecenas eu nisl vel risus vehicula porta eu ullamcorper urna. Integer quam mauris, laoreet in condimentum ut, commodo vel neque.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (11, 3, 1, CAST(N'2020-11-03 12:41:14.760' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam metus nisi, interdum eu nibh ac, faucibus vehicula lorem. Ut aliquet condimentum lectus. Ut ullamcorper rhoncus felis, in sodales dui dapibus ut. Phasellus consequat ipsum ut urna pulvinar, et porta eros tempor. Aliquam egestas, dolor ac vulputate rutrum, nisl quam fermentum ante, feugiat pharetra odio purus vel ante. Aliquam erat volutpat. Donec feugiat, lorem id luctus porta, odio metus ullamcorper ligula, vel aliquam ex ante vel mi. Donec bibendum facilisis nunc, in feugiat magna pellentesque id. Etiam luctus, ipsum feugiat placerat gravida, tellus tortor facilisis velit, nec consequat nibh sapien sit amet tortor.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (12, 3, 1, CAST(N'2020-11-03 12:41:18.507' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam metus nisi, interdum eu nibh ac, faucibus vehicula lorem. Ut aliquet condimentum lectus. Ut ullamcorper rhoncus felis, in sodales dui dapibus ut. Phasellus consequat ipsum ut urna pulvinar, et porta eros tempor. Aliquam egestas, dolor ac vulputate rutrum, nisl quam fermentum ante, feugiat pharetra odio purus vel ante. Aliquam erat volutpat. Donec feugiat, lorem id luctus porta, odio metus ullamcorper ligula, vel aliquam ex ante vel mi. Donec bibendum facilisis nunc, in feugiat magna pellentesque id. Etiam luctus, ipsum feugiat placerat gravida, tellus tortor facilisis velit, nec consequat nibh sapien sit amet tortor.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (13, 3, 1, CAST(N'2020-11-03 12:41:24.197' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam metus nisi, interdum eu nibh ac, faucibus vehicula lorem. Ut aliquet condimentum lectus. Ut ullamcorper rhoncus felis, in sodales dui dapibus ut. Phasellus consequat ipsum ut urna pulvinar, et porta eros tempor. Aliquam egestas, dolor ac vulputate rutrum, nisl quam fermentum ante, feugiat pharetra odio purus vel ante. Aliquam erat volutpat. Donec feugiat, lorem id luctus porta, odio metus ullamcorper ligula, vel aliquam ex ante vel mi. Donec bibendum facilisis nunc, in feugiat magna pellentesque id. Etiam luctus, ipsum feugiat placerat gravida, tellus tortor facilisis velit, nec consequat nibh sapien sit amet tortor.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (14, 3, 1, CAST(N'2020-11-03 12:41:30.907' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam metus nisi, interdum eu nibh ac, faucibus vehicula lorem. Ut aliquet condimentum lectus. Ut ullamcorper rhoncus felis, in sodales dui dapibus ut. Phasellus consequat ipsum ut urna pulvinar, et porta eros tempor. Aliquam egestas, dolor ac vulputate rutrum, nisl quam fermentum ante, feugiat pharetra odio purus vel ante. Aliquam erat volutpat. Donec feugiat, lorem id luctus porta, odio metus ullamcorper ligula, vel aliquam ex ante vel mi. Donec bibendum facilisis nunc, in feugiat magna pellentesque id. Etiam luctus, ipsum feugiat placerat gravida, tellus tortor facilisis velit, nec consequat nibh sapien sit amet tortor.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (15, 3, 1, CAST(N'2020-11-03 12:41:34.907' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam metus nisi, interdum eu nibh ac, faucibus vehicula lorem. Ut aliquet condimentum lectus. Ut ullamcorper rhoncus felis, in sodales dui dapibus ut. Phasellus consequat ipsum ut urna pulvinar, et porta eros tempor. Aliquam egestas, dolor ac vulputate rutrum, nisl quam fermentum ante, feugiat pharetra odio purus vel ante. Aliquam erat volutpat. Donec feugiat, lorem id luctus porta, odio metus ullamcorper ligula, vel aliquam ex ante vel mi. Donec bibendum facilisis nunc, in feugiat magna pellentesque id. Etiam luctus, ipsum feugiat placerat gravida, tellus tortor facilisis velit, nec consequat nibh sapien sit amet tortor.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (16, 3, 1, CAST(N'2020-11-03 12:41:37.740' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam metus nisi, interdum eu nibh ac, faucibus vehicula lorem. Ut aliquet condimentum lectus. Ut ullamcorper rhoncus felis, in sodales dui dapibus ut. Phasellus consequat ipsum ut urna pulvinar, et porta eros tempor. Aliquam egestas, dolor ac vulputate rutrum, nisl quam fermentum ante, feugiat pharetra odio purus vel ante. Aliquam erat volutpat. Donec feugiat, lorem id luctus porta, odio metus ullamcorper ligula, vel aliquam ex ante vel mi. Donec bibendum facilisis nunc, in feugiat magna pellentesque id. Etiam luctus, ipsum feugiat placerat gravida, tellus tortor facilisis velit, nec consequat nibh sapien sit amet tortor.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (17, 3, 1, CAST(N'2020-11-03 12:41:40.617' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam metus nisi, interdum eu nibh ac, faucibus vehicula lorem. Ut aliquet condimentum lectus. Ut ullamcorper rhoncus felis, in sodales dui dapibus ut. Phasellus consequat ipsum ut urna pulvinar, et porta eros tempor. Aliquam egestas, dolor ac vulputate rutrum, nisl quam fermentum ante, feugiat pharetra odio purus vel ante. Aliquam erat volutpat. Donec feugiat, lorem id luctus porta, odio metus ullamcorper ligula, vel aliquam ex ante vel mi. Donec bibendum facilisis nunc, in feugiat magna pellentesque id. Etiam luctus, ipsum feugiat placerat gravida, tellus tortor facilisis velit, nec consequat nibh sapien sit amet tortor.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (18, 3, 1, CAST(N'2020-11-03 12:41:43.443' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam metus nisi, interdum eu nibh ac, faucibus vehicula lorem. Ut aliquet condimentum lectus. Ut ullamcorper rhoncus felis, in sodales dui dapibus ut. Phasellus consequat ipsum ut urna pulvinar, et porta eros tempor. Aliquam egestas, dolor ac vulputate rutrum, nisl quam fermentum ante, feugiat pharetra odio purus vel ante. Aliquam erat volutpat. Donec feugiat, lorem id luctus porta, odio metus ullamcorper ligula, vel aliquam ex ante vel mi. Donec bibendum facilisis nunc, in feugiat magna pellentesque id. Etiam luctus, ipsum feugiat placerat gravida, tellus tortor facilisis velit, nec consequat nibh sapien sit amet tortor.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (19, 3, 1, CAST(N'2020-11-03 12:41:46.273' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam metus nisi, interdum eu nibh ac, faucibus vehicula lorem. Ut aliquet condimentum lectus. Ut ullamcorper rhoncus felis, in sodales dui dapibus ut. Phasellus consequat ipsum ut urna pulvinar, et porta eros tempor. Aliquam egestas, dolor ac vulputate rutrum, nisl quam fermentum ante, feugiat pharetra odio purus vel ante. Aliquam erat volutpat. Donec feugiat, lorem id luctus porta, odio metus ullamcorper ligula, vel aliquam ex ante vel mi. Donec bibendum facilisis nunc, in feugiat magna pellentesque id. Etiam luctus, ipsum feugiat placerat gravida, tellus tortor facilisis velit, nec consequat nibh sapien sit amet tortor.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (20, 3, 1, CAST(N'2020-11-03 12:41:52.727' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam metus nisi, interdum eu nibh ac, faucibus vehicula lorem. Ut aliquet condimentum lectus. Ut ullamcorper rhoncus felis, in sodales dui dapibus ut. Phasellus consequat ipsum ut urna pulvinar, et porta eros tempor. Aliquam egestas, dolor ac vulputate rutrum, nisl quam fermentum ante, feugiat pharetra odio purus vel ante. Aliquam erat volutpat. Donec feugiat, lorem id luctus porta, odio metus ullamcorper ligula, vel aliquam ex ante vel mi. Donec bibendum facilisis nunc, in feugiat magna pellentesque id. Etiam luctus, ipsum feugiat placerat gravida, tellus tortor facilisis velit, nec consequat nibh sapien sit amet tortor.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (21, 3, 7, CAST(N'2020-11-03 13:00:58.530' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam metus nisi, interdum eu nibh ac, faucibus vehicula lorem. Ut aliquet condimentum lectus. Ut ullamcorper rhoncus felis, in sodales dui dapibus ut. Phasellus consequat ipsum ut urna pulvinar, et porta eros tempor. Aliquam egestas, dolor ac vulputate rutrum, nisl quam fermentum ante, feugiat pharetra odio purus vel ante. Aliquam erat volutpat. Donec feugiat, lorem id luctus porta, odio metus ullamcorper ligula, vel aliquam ex ante vel mi. Donec bibendum facilisis nunc, in feugiat magna pellentesque id. Etiam luctus, ipsum feugiat placerat gravida, tellus tortor facilisis velit, nec consequat nibh sapien sit amet tortor.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (22, 3, 7, CAST(N'2020-11-03 13:01:35.550' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam metus nisi, interdum eu nibh ac, faucibus vehicula lorem. Ut aliquet condimentum lectus. Ut ullamcorper rhoncus felis, in sodales dui dapibus ut. Phasellus consequat ipsum ut urna pulvinar, et porta eros tempor. Aliquam egestas, dolor ac vulputate rutrum, nisl quam fermentum ante, feugiat pharetra odio purus vel ante. Aliquam erat volutpat. Donec feugiat, lorem id luctus porta, odio metus ullamcorper ligula, vel aliquam ex ante vel mi. Donec bibendum facilisis nunc, in feugiat magna pellentesque id. Etiam luctus, ipsum feugiat placerat gravida, tellus tortor facilisis velit, nec consequat nibh sapien sit amet tortor.')
INSERT [dbo].[Product_Comments] ([cmtid], [pid], [uid], [cdate], [comment]) VALUES (23, 3, 7, CAST(N'2020-11-03 13:02:33.753' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam metus nisi, interdum eu nibh ac, faucibus vehicula lorem. Ut aliquet condimentum lectus. Ut ullamcorper rhoncus felis, in sodales dui dapibus ut. Phasellus consequat ipsum ut urna pulvinar, et porta eros tempor. Aliquam egestas, dolor ac vulputate rutrum, nisl quam fermentum ante, feugiat pharetra odio purus vel ante. Aliquam erat volutpat. Donec feugiat, lorem id luctus porta, odio metus ullamcorper ligula, vel aliquam ex ante vel mi. Donec bibendum facilisis nunc, in feugiat magna pellentesque id. Etiam luctus, ipsum feugiat placerat gravida, tellus tortor facilisis velit, nec consequat nibh sapien sit amet tortor.')
SET IDENTITY_INSERT [dbo].[Product_Comments] OFF
SET IDENTITY_INSERT [dbo].[Product_Images] ON 

INSERT [dbo].[Product_Images] ([imgid], [pid], [imageURL]) VALUES (1, 3, N'assets/img/gallery/product-details1.png')
INSERT [dbo].[Product_Images] ([imgid], [pid], [imageURL]) VALUES (2, 3, N'assets/img/gallery/product-details2.png')
INSERT [dbo].[Product_Images] ([imgid], [pid], [imageURL]) VALUES (3, 3, N'assets/img/gallery/product-details3.png')
INSERT [dbo].[Product_Images] ([imgid], [pid], [imageURL]) VALUES (4, 3, N'assets/img/gallery/product-details4.png')
SET IDENTITY_INSERT [dbo].[Product_Images] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([pid], [pname], [price], [pshortdesc], [pdesc], [available]) VALUES (3, N'Lorem Ipsum', 199.99, N'"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
', N'<p>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nulla tellus, finibus in auctor in, lacinia quis ipsum. Praesent nibh ipsum, feugiat ut porta vitae, aliquet volutpat nulla. Suspendisse eu nulla nulla. Sed volutpat sem viverra, suscipit diam nec, cursus tellus. Duis consequat justo consequat mi aliquam, in convallis tellus commodo. Quisque euismod eleifend ultricies. Vestibulum viverra sit amet lectus vitae sodales. Suspendisse mattis sit amet lacus sit amet posuere. Cras vestibulum, enim vel gravida cursus, mi dolor auctor tortor, eget vehicula nibh velit et arcu. Nam blandit egestas felis at vulputate. Vivamus commodo ligula enim, eget consequat turpis lacinia sit amet. In suscipit suscipit lectus non egestas. Praesent aliquam dignissim accumsan. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi ac vehicula erat, et ullamcorper lacus.
</p><p>
Nullam id rutrum eros. Vestibulum volutpat in risus nec dignissim. Vestibulum arcu sapien, porttitor et egestas vitae, ultricies id odio. Praesent efficitur sollicitudin ultricies. Aliquam vel scelerisque leo. Ut et massa quam. Proin posuere dapibus quam, et dapibus elit tempus sit amet. Morbi malesuada at mauris ut volutpat. Vestibulum cursus, mi a venenatis eleifend, leo risus porta nunc, ut dictum magna velit id sem. Vestibulum et lacus rhoncus lacus consectetur malesuada. Donec aliquet libero vel quam auctor fringilla. Mauris dictum magna non condimentum tristique. Aliquam tempus ante nisi, eu tincidunt eros eleifend eu. Nullam facilisis diam nibh, sit amet vestibulum augue sagittis vitae. Sed eget tempus leo.
</p>', 1)
INSERT [dbo].[Products] ([pid], [pname], [price], [pshortdesc], [pdesc], [available]) VALUES (4, N'Nullam id rutrum eros', 99.99, N'"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..."
', N'Sed at lacinia elit. Ut vitae sapien elit. Ut vitae faucibus justo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer ut nibh ipsum. Integer fermentum efficitur aliquet. Sed elit purus, laoreet ut convallis vel, condimentum sit amet massa. Maecenas rutrum tincidunt quam et suscipit. Phasellus rhoncus sollicitudin aliquet. Aenean id laoreet eros. Aliquam hendrerit, leo id finibus feugiat, dui erat suscipit purus, ut finibus arcu turpis id enim. In sed viverra nisi, et tincidunt erat. Aliquam eu fermentum turpis. Aliquam convallis odio vitae malesuada varius.

Pellentesque ac sem elementum, mollis odio dapibus, aliquet orci. Suspendisse vitae scelerisque neque. Nullam quis tortor eros. Duis molestie ante eu eros rhoncus, nec posuere orci porta. Nulla nunc felis, tempor quis sollicitudin a, iaculis quis tellus. Pellentesque risus dolor, tincidunt et pretium tempor, sodales eu lectus. Quisque at tempus tortor. Morbi bibendum, felis non porttitor scelerisque, velit dui tempus quam, sit amet dictum sapien erat sed turpis. Proin eget viverra tortor, eu molestie lectus. Etiam ullamcorper metus nunc.

', 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([uid], [username], [password], [fullname], [email], [address], [phonenumber], [avatarURL]) VALUES (1, N'admin', N'admin', N'Nguyen Tien Dat', N'datnthe140692@fpt.edu.vn', N'Thon 12 - Hoa Dong - Thuy Nguyen - Hai Phong', N'0352500406', N'https://icons.iconarchive.com/icons/goescat/macaron/1024/atom-icon.png')
INSERT [dbo].[Users] ([uid], [username], [password], [fullname], [email], [address], [phonenumber], [avatarURL]) VALUES (6, N'test', N'test', N'Nguyen Van A', N'test@test', N'adsadsada', N'0123566', N'assets/img/icon/avatar.png')
INSERT [dbo].[Users] ([uid], [username], [password], [fullname], [email], [address], [phonenumber], [avatarURL]) VALUES (7, N'dummy', N'dummy', N'Dummy', N'dummy@dummy.com', N'dummy', N'0123456789', N'assets/img/icon/avatar.png')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__622BF0C25C322EA7]    Script Date: 11/3/2020 14:54:20 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[phonenumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__AB6E6164B751CABA]    Script Date: 11/3/2020 14:54:20 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__F3DBC5722CF7C0A2]    Script Date: 11/3/2020 14:54:20 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product_Categories]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Categories] ([cid])
GO
ALTER TABLE [dbo].[Product_Categories]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Products] ([pid])
GO
ALTER TABLE [dbo].[Product_Comments]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Products] ([pid])
GO
ALTER TABLE [dbo].[Product_Comments]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([uid])
GO
ALTER TABLE [dbo].[Product_Images]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Products] ([pid])
GO
