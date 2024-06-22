-- Create the authors table if it does not exist
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[authors]') AND type in (N'U'))
BEGIN
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
END
GO

-- Create the books table if it does not exist
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[books]') AND type in (N'U'))
BEGIN
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
END
GO

-- Insert authors if they do not exist
SET IDENTITY_INSERT [dbo].[authors] ON

IF NOT EXISTS (SELECT 1 FROM [dbo].[authors] WHERE [id] = 1)
BEGIN
    INSERT [dbo].[authors] ([id], [name], [birthdate], [bio], [imageurl]) 
    VALUES (1, N'Brandon Sanderson', CAST(N'1975-12-19' AS Date), N'Brandon Winn Sanderson is an American author of high fantasy and science fiction. He is best known for the Cosmere fictional universe, in which most of his fantasy novels, most notably the Mistborn series and The Stormlight Archive, are set.', N'https://upload.wikimedia.org/wikipedia/commons/e/ef/Brandon_Sanderson_-_Lucca_Comics_%26_Games_2016.jpg')
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[authors] WHERE [id] = 2)
BEGIN
    INSERT [dbo].[authors] ([id], [name], [birthdate], [bio], [imageurl]) 
    VALUES (2, N'Pierce Brown', CAST(N'1988-01-28' AS Date), N'Pierce Brown is an American science fiction author who writes the Red Rising series, consisting of Red Rising, Golden Son, Morning Star, Iron Gold, Dark Age, and Light Bringer.', N'https://upload.wikimedia.org/wikipedia/commons/3/32/Pierce_Brown_by_Gage_Skidmore.jpg')
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[authors] WHERE [id] = 3)
BEGIN
    INSERT [dbo].[authors] ([id], [name], [birthdate], [bio], [imageurl]) 
    VALUES (3, N'Jon Skeet', CAST(N'1974-12-06' AS Date), N'Jon Skeet is a senior software engineer at Google. He studied mathematics and computer science at Cambridge, is a recognized authority in Java and C#, and maintains the position of top contributor to Stack Overflow.', N'https://buildingbruges.be/wp-content/uploads/2020/05/Cropped-hi-res-730x1024.jpg')
END

SET IDENTITY_INSERT [dbo].[authors] OFF
GO

-- Insert books if they do not exist
SET IDENTITY_INSERT [dbo].[books] ON

IF NOT EXISTS (SELECT 1 FROM [dbo].[books] WHERE [id] = 1)
BEGIN
    INSERT [dbo].[books] ([id], [title], [authorId], [genre], [publicationdate], [imageurl]) 
    VALUES (1, N'The Way of Kings', 1, N'Fantasy', CAST(N'2010-08-31' AS Date), N'https://upload.wikimedia.org/wikipedia/en/8/8b/TheWayOfKings.png')
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[books] WHERE [id] = 2)
BEGIN
    INSERT [dbo].[books] ([id], [title], [authorId], [genre], [publicationdate], [imageurl]) 
    VALUES (2, N'Red Rising', 2, N'Science Fiction', CAST(N'2014-01-28' AS Date), N'https://upload.wikimedia.org/wikipedia/en/9/9b/Red_Rising_%282014%29.jpg')
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[books] WHERE [id] = 3)
BEGIN
    INSERT [dbo].[books] ([id], [title], [authorId], [genre], [publicationdate], [imageurl]) 
    VALUES (3, N'C# in Depth', 3, N'Technology', CAST(N'2019-03-01' AS Date), N'https://i.pinimg.com/736x/ea/ba/ce/eabacee45f65cd08801c135756314cd5.jpg')
END

SET IDENTITY_INSERT [dbo].[books] OFF
GO

-- Add foreign key constraint if it does not exist
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.books_authors]') AND parent_object_id = OBJECT_ID(N'[dbo].[books]'))
BEGIN
    ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [FK_dbo.books_authors] FOREIGN KEY([authorId])
    REFERENCES [dbo].[authors] ([id])
    ON DELETE CASCADE
END
GO

ALTER TABLE [dbo].[books] CHECK CONSTRAINT [FK_dbo.books_authors]
GO