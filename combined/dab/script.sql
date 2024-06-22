/****** Object:  Table [dbo].[authors]    Script Date: 1/12/2023 6:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[birthdate] [date] NULL,
	[bio] [text] NULL,
	[imageurl] [varchar](max) NULL,
 CONSTRAINT [PK__authors__3213E83FD792F176] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[books]    Script Date: 1/12/2023 6:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NULL,
	[authorId] [int] NOT NULL,
	[genre] [varchar](255) NULL,
	[publicationdate] [date] NULL,
	[imageurl] [varchar](max) NULL,
 CONSTRAINT [PK__books__3213E83F850352E7] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[authors] ON 

INSERT [dbo].[authors] ([id], [name], [birthdate], [bio], [imageurl]) VALUES (1, N'Brandon Sanderson', CAST(N'1975-12-19' AS Date), N'Brandon Winn Sanderson is an American author of high fantasy and science fiction. He is best known for the Cosmere fictional universe, in which most of his fantasy novels, most notably the Mistborn series and The Stormlight Archive, are set.', N'https://upload.wikimedia.org/wikipedia/commons/e/ef/Brandon_Sanderson_-_Lucca_Comics_%26_Games_2016.jpg')
INSERT [dbo].[authors] ([id], [name], [birthdate], [bio], [imageurl]) VALUES (2, N'Pierce Brown', CAST(N'1988-01-28' AS Date), N'Pierce Brown is an American science fiction author who writes the Red Rising series, consisting of Red Rising, Golden Son, Morning Star, Iron Gold, Dark Age, and Light Bringer.', N'https://upload.wikimedia.org/wikipedia/commons/3/32/Pierce_Brown_by_Gage_Skidmore.jpg')
INSERT [dbo].[authors] ([id], [name], [birthdate], [bio], [imageurl]) VALUES (3, N'Jon Skeet', CAST(N'1974-12-06' AS Date), N'Jon Skeet is a senior software engineer at Google. He studied mathematics and computer science at Cambridge, is a recognized authority in Java and C#, and maintains the position of top contributor to Stack Overflow.', N'https://it-ebooks.info/images/ebooks/5/csharp_in_depth_4th_edition.jpg')
SET IDENTITY_INSERT [dbo].[authors] OFF
GO
SET IDENTITY_INSERT [dbo].[books] ON 

INSERT [dbo].[books] ([id], [title], [authorId], [genre], [publicationdate], [imageurl]) VALUES (1, N'The Way of Kings', 1, N'Fantasy', CAST(N'2010-08-31' AS Date), N'https://upload.wikimedia.org/wikipedia/en/8/8b/TheWayOfKings.png')
INSERT [dbo].[books] ([id], [title], [authorId], [genre], [publicationdate], [imageurl]) VALUES (2, N'Red Rising', 2, N'Science Fiction', CAST(N'2014-01-28' AS Date), N'https://upload.wikimedia.org/wikipedia/en/9/9b/Red_Rising_%282014%29.jpg')
INSERT [dbo].[books] ([id], [title], [authorId], [genre], [publicationdate], [imageurl]) VALUES (3, N'C# in Depth', 3, N'Technology', CAST(N'2019-03-01' AS Date), N'https://i.pinimg.com/736x/ea/ba/ce/eabacee45f65cd08801c135756314cd5.jpg')
SET IDENTITY_INSERT [dbo].[books] OFF
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [FK_dbo.books_authors] FOREIGN KEY([authorId])
REFERENCES [dbo].[authors] ([id])
GO
ALTER TABLE [dbo].[books] CHECK CONSTRAINT [FK_dbo.books_authors]
GO
