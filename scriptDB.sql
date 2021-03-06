USE [master]
GO
/****** Object:  Database [Assignment2-NguyenPhamThanhLong]    Script Date: 4/11/2021 4:52:03 PM ******/
CREATE DATABASE [Assignment2-NguyenPhamThanhLong]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment2-NguyenPhamThanhLong', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Assignment2-NguyenPhamThanhLong.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Assignment2-NguyenPhamThanhLong_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Assignment2-NguyenPhamThanhLong_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment2-NguyenPhamThanhLong].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assignment2-NguyenPhamThanhLong', N'ON'
GO
USE [Assignment2-NguyenPhamThanhLong]
GO
/****** Object:  Table [dbo].[tblHistory]    Script Date: 4/11/2021 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHistory](
	[idHistory] [int] IDENTITY(1,1) NOT NULL,
	[id] [nchar](50) NOT NULL,
	[idSubject] [int] NOT NULL,
	[startTime] [nchar](20) NOT NULL,
	[endTime] [nchar](20) NOT NULL,
	[numOfCorrect] [int] NOT NULL,
	[totalPoint] [float] NOT NULL,
 CONSTRAINT [PK_tblHistory] PRIMARY KEY CLUSTERED 
(
	[idHistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblQuestion]    Script Date: 4/11/2021 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestion](
	[idQuestion] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](2000) NOT NULL,
	[answer] [nvarchar](255) NOT NULL,
	[createDate] [date] NOT NULL,
	[idSubject] [int] NOT NULL,
	[status] [nvarchar](20) NOT NULL,
	[point] [int] NOT NULL,
 CONSTRAINT [PK_tblQuestion] PRIMARY KEY CLUSTERED 
(
	[idQuestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSubject]    Script Date: 4/11/2021 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubject](
	[idSubject] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[numberOfQuestions] [int] NOT NULL,
	[timeToDo] [int] NOT NULL,
 CONSTRAINT [PK_tblSubject] PRIMARY KEY CLUSTERED 
(
	[idSubject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTmpAnswer]    Script Date: 4/11/2021 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTmpAnswer](
	[idChoice] [int] IDENTITY(1,1) NOT NULL,
	[id] [nchar](50) NOT NULL,
	[idSubject] [int] NOT NULL,
 CONSTRAINT [PK_tblTmpAnswer] PRIMARY KEY CLUSTERED 
(
	[idChoice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTmpAnswerDetail]    Script Date: 4/11/2021 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTmpAnswerDetail](
	[idChoice] [int] NOT NULL,
	[question] [nvarchar](2000) NOT NULL,
	[answer] [nvarchar](255) NOT NULL,
	[choice] [nvarchar](20) NULL,
	[isCorrect] [bit] NULL,
	[idQuestion] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 4/11/2021 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[id] [nchar](50) NOT NULL,
	[name] [nchar](20) NOT NULL,
	[password] [nchar](255) NOT NULL,
	[role] [nchar](10) NOT NULL,
	[status] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblHistory] ON 

INSERT [dbo].[tblHistory] ([idHistory], [id], [idSubject], [startTime], [endTime], [numOfCorrect], [totalPoint]) VALUES (1, N'2                                                 ', 2, N'20:43:53            ', N'20:44:06            ', 1, 0.19999999)
INSERT [dbo].[tblHistory] ([idHistory], [id], [idSubject], [startTime], [endTime], [numOfCorrect], [totalPoint]) VALUES (2, N'2                                                 ', 1, N'22:44:02            ', N'22:44:04            ', 0, 0)
INSERT [dbo].[tblHistory] ([idHistory], [id], [idSubject], [startTime], [endTime], [numOfCorrect], [totalPoint]) VALUES (3, N'2                                                 ', 1, N'22:44:57            ', N'22:44:59            ', 0, 0)
INSERT [dbo].[tblHistory] ([idHistory], [id], [idSubject], [startTime], [endTime], [numOfCorrect], [totalPoint]) VALUES (4, N'2                                                 ', 1, N'22:46:45            ', N'22:46:47            ', 0, 0)
INSERT [dbo].[tblHistory] ([idHistory], [id], [idSubject], [startTime], [endTime], [numOfCorrect], [totalPoint]) VALUES (5, N'2                                                 ', 1, N'22:49:43            ', N'22:49:45            ', 0, 0)
INSERT [dbo].[tblHistory] ([idHistory], [id], [idSubject], [startTime], [endTime], [numOfCorrect], [totalPoint]) VALUES (6, N'2                                                 ', 1, N'23:01:24            ', N'23:01:25            ', 0, 0)
INSERT [dbo].[tblHistory] ([idHistory], [id], [idSubject], [startTime], [endTime], [numOfCorrect], [totalPoint]) VALUES (7, N'2                                                 ', 1, N'23:03:47            ', N'23:03:48            ', 0, 0)
INSERT [dbo].[tblHistory] ([idHistory], [id], [idSubject], [startTime], [endTime], [numOfCorrect], [totalPoint]) VALUES (8, N'2                                                 ', 1, N'23:27:20            ', N'23:27:22            ', 0, 0)
INSERT [dbo].[tblHistory] ([idHistory], [id], [idSubject], [startTime], [endTime], [numOfCorrect], [totalPoint]) VALUES (9, N'2                                                 ', 1, N'15:43:43            ', N'15:44:05            ', 0, 0)
INSERT [dbo].[tblHistory] ([idHistory], [id], [idSubject], [startTime], [endTime], [numOfCorrect], [totalPoint]) VALUES (10, N'2                                                 ', 1, N'15:48:22            ', N'15:50:08            ', 0, 0)
INSERT [dbo].[tblHistory] ([idHistory], [id], [idSubject], [startTime], [endTime], [numOfCorrect], [totalPoint]) VALUES (12, N'2                                                 ', 1, N'16:05:41            ', N'16:06:06            ', 0, 0)
INSERT [dbo].[tblHistory] ([idHistory], [id], [idSubject], [startTime], [endTime], [numOfCorrect], [totalPoint]) VALUES (13, N'2                                                 ', 1, N'16:14:38            ', N'16:14:40            ', 0, 0)
INSERT [dbo].[tblHistory] ([idHistory], [id], [idSubject], [startTime], [endTime], [numOfCorrect], [totalPoint]) VALUES (16, N'2                                                 ', 1, N'16:35:02            ', N'16:36:03            ', 0, 0)
INSERT [dbo].[tblHistory] ([idHistory], [id], [idSubject], [startTime], [endTime], [numOfCorrect], [totalPoint]) VALUES (17, N'2                                                 ', 1, N'16:37:44            ', N'16:37:45            ', 0, 0)
INSERT [dbo].[tblHistory] ([idHistory], [id], [idSubject], [startTime], [endTime], [numOfCorrect], [totalPoint]) VALUES (18, N'2                                                 ', 1, N'16:46:25            ', N'16:46:30            ', 0, 0)
SET IDENTITY_INSERT [dbo].[tblHistory] OFF
SET IDENTITY_INSERT [dbo].[tblQuestion] ON 

INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (3, N'aaa', N'a', CAST(N'2021-03-18' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (5, N'In 332 terms of JDBC API, what does the Statement.executeUpdate() method return? <br>a. An integer value indicates the number of records that have been executed successfully. <br>b. A Boolean value indicates if the specified query is executed successfully or not.<br>c. A string value indicates the number of records that have been executed successfully. <br>d. A float value indicates if the specified query is executed successfully or not', N'a', CAST(N'2020-02-02' AS Date), 1, N'True', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (6, N'What does a Locale object represent? <br>a. country  <br>b. All of the others  <br>c. cultural region  <br>d. a specific geographical', N'b', CAST(N'2020-01-25' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (7, N'Consider the following overridden method in a JFrame class? <br>a. g.drawChars(s, 5, 4, 60, 90); <br>b. g.drawChars(s[4], 60, 90); <br>c. g.drawChars(s, 4, 5, 60, 90); <br>d. g.drawChars(s, 4, 5, 6, 90);', N'c', CAST(N'2021-02-09' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (8, N'Localization is the process of not only changing the language interaction?<br>a. All of the others <br>b. Data formats<br>c. Number formats<br>d. Currency formats', N'a', CAST(N'2020-06-05' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (9, N'
Which method is used to get graphic object of a component?<br>a. None of the others<br>b. Component.getGraphics()<br>c.Component.referGraphics()<br>d. Component.setGraphics()', N'd', CAST(N'2019-02-02' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (10, N'In terms of JDBC API, in order to execute a SQL Insert query, which method in the Statement class should be used?<br>a. executeSelect()<br>b. performQuery()<br>c. executeUpdate()<br>d. executeQuery()', N'a', CAST(N'2019-06-03' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (11, N'In the package java.awt.image.*, which of the following class manages images in memory and provides methods for storing, interpreting, and obtaining pixel data?<br>Select one:<br>a. Image<br>b. IOImage<br>c. Images<br>d. BufferedImage', N'a', CAST(N'2019-09-19' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (12, N'In terms of LineMetrics and FontMetrics, what is ascent?<br>a. It is the recommended distance from the bottom of the descender line to the top of the next line.<br>b. t is the distance from the baseline to the descender line<br>c. It is the distance from the baseline to the ascender line', N'b', CAST(N'2020-01-08' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (13, N'In the package java.awt.*, which of the following class represents graphical images as rectangular arrays of pixels?<br>a. IOImage<br>b. BufferedImage<br>c. Image<br>d. Images', N'c', CAST(N'2020-06-21' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (14, N'Which of the following method in the Graphics class can be used to render an image on a component?<br>a. Graphics.drawImage()<br>b. Graphics.paintImage()<br>c. Graphics.showImage()<br>d. Graphics.renderImage()', N'b', CAST(N'2020-09-27' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (15, N'Which of the following JDBC driver Type uses the JDBC-ODBC bridge?<br>a. Type 4<br>b. Type 2<br>c. Type 1<br>d. Type 3', N'd', CAST(N'2020-12-03' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (16, N'In terms of RMI architecture, when a client invokes a method, which object is the method invocation first forwarded to?<br>a. Skeleton<br>b. Remote object<br>c. RMI Registry<br>d. Stub', N'd', CAST(N'2020-08-16' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (18, N'In terms of Socket communication, which the following method the server should call to wait for and accept a request connection from clients?<br>a. java.net.Socket.accept()<br>b. java.net.Socket.wait()<br>c. java.net.Socket.waitClient()<br>d. java.net.Socket.acceptClients()', N'a', CAST(N'2021-01-19' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (19, N'In terms of RMI architecture, which of the following is the valid way to create RMI registry on port 1098?<br>a. LocateRegistry.createRegistry(1098);<br>b. Registry.createRegistry(1098);<br>c. RMIRegistry.createOnPort(1098);<br>d.Registry.createRegistry(1000);', N'c', CAST(N'2020-08-19' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (20, N'
What method in the Graphics class can be used to draw a filled oval?<br>a. fullOval()<br>b. drawOval()<br>c. None of the others<br>d. fillOval()', N'd', CAST(N'2020-03-03' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (21, N'Which method is used to get graphic object of a component?<br>a. None of the others<br>b. Component.getGraphics()<br>c.Component.referGraphics()<br>d. Component.setGraphics()', N'a', CAST(N'2020-06-05' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (24, N'Which line of code should be placed at Line 1 to start aThread as a thread?<br>a. aThread.startThread();<br>b. aThread.runThread();<br>c. aThread.run();<br>d. aThread.start();', N'c', CAST(N'2020-01-21' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (25, N'In terms of RMI architecture, which object is responsible for opening a socket to the remote server, marshalling the object parameters, and forwarding the data stream to the skeleton?<br>a. Stub<br>b. RMI Registry<br>c. Skeleton<br>d. Remote object
', N'a', CAST(N'2020-01-01' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (26, N'In terms of JDBC API, in order to execute a SQL Select query, which method in the Statement class should be used?<br>a. executeSelect()<br>b. executeUpdate()<br>c. performQuery()<br>d. executeQuery()', N'b', CAST(N'2018-03-01' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (27, N'The above interface will be used as a remote interface for a Remote Method Invocation (RMI) communication, what interface(s) the Calculator interface should inherit from?<br>a. java.remote.Invoke<br>b. None of the others<br>c. java.rmi.Remote<br>d. java.Remote', N'c', CAST(N'2020-03-10' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (28, N'Which of the following is a physical font and does not depend on the hosting operating system?<br>a. PostScript<br>b. TrueType<br>c. Lucida<br>d. Dialog', N'd', CAST(N'2020-02-24' AS Date), 1, N'false', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (29, N'Which of the following method in the Graphics class can be used to draw a filled rectangle at the coordinate (left, top) with the width (w) and the height (h)?<br>a. fullRect(left, top, w, h);<br>b. rectFilled(left, top, w, h);<br>c. fillRect(left, top, w, h);<br>d. fillRect(left, top, w, w);', N'd', CAST(N'2020-02-22' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (30, N'Suppose all required classes are imported, which line of code should be place at Line 1 to bind the service name to the remote object?<br>a. Naming.rebind(serviceName, c);<br>b. serviceName.rebind(c);<br>c. c.rebind(serviceName);<br>c. d.rebind(serviceName, c);
', N'b', CAST(N'2020-07-14' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (31, N'Suppose a connection object connection has been made successfully to database. There is a table named Inventory with columns: CarID, Make, Color, and PetName.<br>Which line of code should be placed at Line 1 so that all data in the Inventory table can be printed out?<br>a. ResultSet rs = st.executeUpdate("Select * from Inventory");<br>b. ResultSet rs = st.executeQuery("Select * from Inventory");<br>c. ResultSet rs = st.query("Select from Inventory");<br>d. ResultSet rs = st.query("from Inventory");', N'c', CAST(N'2020-08-14' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (32, N'A socket is one endpoint of a two-way communication link between two programs running on the network. It contains information that allow ....<br>a. All of the other.<br>b. determining where data will be received.<br>c. a propram on this computer identifies an application running on the other.<br>d. determining where received data has been sent from.', N'a', CAST(N'2020-01-12' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (34, N'To get a connection to a database, the getConnection(...) method of the .....class should be called.<br>a. DriverManager<br>b. Drivers<br>c. DatabaseConnection<br>d. Connection', N'b', CAST(N'2020-01-31' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (35, N'..... is (are) used to specify an application running on a computer in a network.<br>a. IP and port<br>b. Hostname<br>c. IP<br>d. ID of the CPU', N'b', CAST(N'2020-01-17' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (36, N'The first step in a RMI implementation is ..........<br>a. Create a client program.<br>b. Create a server program.<br>c. Create a class for server object.<br>d. Create a remote interface.
', N'a', CAST(N'2020-05-12' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (37, N'... is a build-in exception that will be thrown in networking using Java RMI technology.<br>a. NetworkException<br>b. RemoteException<br>c. None of the others.<br>d. ClientException', N'a', CAST(N'2020-01-01' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (38, N'With respect to a Statement object, which method will return an integer specifying the number of infected rows.<br>a. executeUpdate()<br>b. execute()<br>c. executeQuery()<br>d. getAffectedRows()', N'a', CAST(N'2020-12-01' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (39, N'Supose that the rs result set contains no row. The following statement will return ...rs.next();<br>a. None of the others<br>b. -1<br>c. true<br>d. null
', N'c', CAST(N'2020-01-28' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (41, N'The string which specifies the JDBC-ODBC Bridge driver is ....<br>a. sun.odbc.jdbc.JdbcOdbcDriver<br>b. None of the above.<br>c. sun.jdbc.odbc.JdbcOdbcDriver<br>d. sun.odbc.jdbc.OdbcJdbcDriver
', N'd', CAST(N'2020-08-12' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (42, N'Suppose that a database was registered the datasource name KK in ODBC of a system. To specify this database, the string ........ should be used.<br>a. "sun.jdbc.odbc.KK"<br>b. "sun:odbc:jdbc:KK"<br>c. None of the others.<br>d. "jdbc:odbc:KK"', N'c', CAST(N'2020-12-19' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (43, N'The .......... method of the java.net.ServerSocket class will wait for a connection from a client.<br>a. None of the others.<br>b. wait()<br>c. accept()<br>d. available()', N'c', CAST(N'2019-02-09' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (44, N'The right order to create objects in JDBC is .....<br>a. ResultSet-Connection-Statement<br>b. Statement - Connection - ResultSet<br>c. Connection - Statement - ResultSet<br>d. Statement-ResultSet-Connection', N'c', CAST(N'2018-04-04' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (45, N'Serialization is .............<br>a. a process waiting for a connection.<br>b. None of the others.<br>c. a process that will convert data of an object to byte stream<br>d. a process in which a called method of a class waiting for it''s execution.
', N'b', CAST(N'2020-04-01' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (46, N'Two streams of a socket:<br>(1) Output stream contains .............<br>(2) Input stream contains ...............<br>a. data has been received, data will be sent.<br>b. data processed, data waiting for processing<br>c. data will be sent, data has been received.<br>d. data will be printed out, data can be written to a file.', N'c', CAST(N'2020-01-09' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (47, N'An active process ..............<br>a. is a program which was loaded to the memory.<br>b. can not contain any thread.<br>c. has a self-contained execution environment.<br>d. contains at least one thread.
', N'd', CAST(N'2020-02-20' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (48, N'Thread supports in Java are ...............<br>a. The java.lang.Thread class<br>b. The java.io.Runnable interface.<br>c. java.threads.Thread class<br>d. The java.lang.Runnable interface', N'd', CAST(N'2020-01-04' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (49, N'States of a thread:<br>a. runb. sleeping<br>c. escaping<br>d. ready', N'c', CAST(N'2020-01-01' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (50, N'The javax.swing..... allows user entering some lines of data.<br>a. JComboBox<br>b. JTextField<br>c. JTextArea<br>d. TextArea', N'd', CAST(N'2020-01-07' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (51, N'The javax.swing..... allows user seclect one data item in a group.<br>a. JTextArea<br>b. JCheckBox<br>c. JTextField<br>d. JRadioButton', N'a', CAST(N'2020-06-05' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (52, N'The javax.swing..... allows user seclect one or some data items in a group.<br>a. JTextArea<br>b. JTextField<br>c. TextArea<br>d. JComboBox', N'a', CAST(N'2019-01-04' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (53, N'There are some hierarchical data. The javax.swing........ class should be used.<br>a. JTable<br>b. JComboBox<br>c. JTree<br>d. JListBox', N'd', CAST(N'2021-01-04' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (54, N'There are flat data need to be shown on the GUI. The ....... class should be used.<br>a. javax.swing.JTable<br>b. java.util.Vector<br>c. javax.swing.JTree<br>d. java.util.ArrayList', N'b', CAST(N'2019-02-05' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (55, N'The ...... is default layout manager of .............<br>a. BorderLayout, JFrame<br>b. BorderLayout, JPanel<br>c. FlowLayout, JPanel<br>d. FlowLayout, JFrame', N'b', CAST(N'2019-02-04' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (56, N'The .......... layout puts components of a container in a row, sized at their preferred size.<br>a. Grid<br>b. GridBag<br>c. Flow<br>d. Card', N'd', CAST(N'2019-08-09' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (57, N'The ......... class will puts all components of a container in the same size.<br>a. FlowLayout<br>b. GridLayout<br>c. GridBagLayout<br>d. CardLayout', N'a', CAST(N'2018-07-09' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (58, N'With respect to the MVC architecture, when a Swing component is a view of an object, data is seen by user is the result of the ...... method of the object.<br>a. toString()<br>b. getData()<br>c. getObject()<br>d. getDataForView()
', N'd', CAST(N'2019-01-02' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (59, N'In terms of LineMetrics and FontMetrics, what is ascent?<br>a. It is the recommended distance from the bottom of the descender line to the top of the next line.<br>b. t is the distance from the baseline to the descender line<br>c. It is the distance from the baseline to the ascender line', N'd', CAST(N'2019-01-01' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (60, N'In the package java.awt.*, which of the following class represents graphical images as rectangular arrays of pixels?<br>a. IOImage<br>b. BufferedImage<br>c. Image<br>d. Images', N'b', CAST(N'2018-02-01' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (61, N'Which of the following method in the Graphics class can be used to render an image on a component?<br>a. Graphics.drawImage()<br>b. Graphics.paintImage()<br>c. Graphics.showImage()<br>d. Graphics.renderImage()
', N'd', CAST(N'2019-02-01' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (62, N'Which of the following JDBC driver Type uses the JDBC-ODBC bridge?<br>a. Type 4<br>b. Type 2<br>c. Type 1<br>d. Type 3', N'c', CAST(N'2018-01-05' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (63, N'Which line of code should be placed at Line 1 to start aThread as a thread?<br>a. aThread.startThread();<br>b. aThread.runThread();<br>c. aThread.run();<br>d. aThread.start();
', N'b', CAST(N'2020-01-07' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (64, N'Which method is used to get graphic object of a component?<br>a. None of the others<br>b. Component.getGraphics()<br>c.Component.referGraphics()<br>d. Component.setGraphics()
', N'c', CAST(N'2019-01-02' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (65, N'Which of the following is a physical font and does not depend on the hosting operating system?<br>a. PostScript<br>b. TrueType<br>c. Lucida<br>d. Dialog', N'a', CAST(N'2020-08-08' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (66, N'The method getWriter returns an object of type PrintWriter. This class has println methods to generate output. Which of these classes define the getWriter method?<br>A. HttpServletRequest<br>B. HttpServletResponse<br>C. ServletConfig<br>D. ServletContext', N'a', CAST(N'2020-01-04' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (67, N'For application and session JSP scopes, what class of object is used to store the attributes? <br>A. ServletContext and HttpSession respectively.<br>B. HttpSession for both.<br>C. ServletContext for both.<br>D. HttpSession and ServletContext respectively', N'b', CAST(N'2020-01-04' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (68, N'Standard Java EE web applications are deployed as:<br>A. WAR files<br>B. JAR files<br>C. DLL files<br>D. CLASS files', N'a', CAST(N'2020-09-03' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (69, N'What JDBC stands for?<br>A. Java Driver for Basic Connection<br>B. Java Database Connectivity<br>C. Joint Database Connectivity<br>D. Joint Driver for Basic Connection
', N'c', CAST(N'2018-02-04' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (70, N'What are the components of Java Web Application?<br>A. Servlets<br>B. Jsps<br>C. Html<br>D. Media files
', N'd', CAST(N'2018-02-03' AS Date), 2, N'false', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (71, N'The HttpServletRequest has methods by which you can find out about incoming information such as:<br>A. form data<br>B. HTTP request headers<br>C. the client''s hostname<br>D. cookies
', N'd', CAST(N'2020-02-21' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (72, N'Java web application contains<br>A. Dynamic web pages<br>B. Static web pages<br>C. Media resources<br>D. All answers are correct
', N'a', CAST(N'2019-04-02' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (73, N'Which of the following constitute valid ways of importing Java classes into JSP page source?<br>A. <%! import java.util.*; %><br>B. <%@ import java.util.* %><br>C. <%@ page import="java.util.*" %><br>D. None of them
', N'a', CAST(N'2019-02-01' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (74, N'A JSP page uses the java.util.ArrayList class many times. Instead of referring the class by its complete package name each time, we want to just use ArrayList. Which attribute of page directive must be specified to achieve this?<br>A. Extends<br>B. import <@page import="java.util.ArrayList"/><br>C. include<br>D. package
', N'b', CAST(N'2019-02-19' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (75, N'What would be the session timeout interval for the sessions created in this web application?<br>A. 300 minutes<br>B. 300 seconds<br>C. 300 milli seconds<br>D. 300 hours
', N'c', CAST(N'2020-02-01' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (76, N'Which class that includes the getSession method that is used to get the HttpSession object?<br>A. HttpServletRequest<br>B. HttpServletResponse<br>C. SessionContext<br>D. SessionConfig
', N'd', CAST(N'2019-02-20' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (77, N'Name the implicit variable is available to JSP pages that may be used to access all the other implicit objects.<br>A. Request<br>B. Response<br>C. pageContext<br>D. out
', N'a', CAST(N'2018-01-01' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (78, N'Which is NOT the main type of JSP constructs that you embed in a page?<br>A. Directives<br>B. Actions<br>C. scripting elements<br>D. HTML code
', N'a', CAST(N'2020-02-01' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (79, N'Given that a user enters the following into her browser, which (if any) of the mapped servlets will execute? <br>A. ServletA<br>B. ServletB<br>C. ServletC<br>D. ServletD
', N'd', CAST(N'2018-02-05' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (80, N'What are the components of Java Web Application?<br>A. Servlets<br>B. Jsps<br>. Filters<br>D. Listeners
', N'b', CAST(N'2020-07-05' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (81, N'You do not want the user to see the data and the format being passed to your server when the user tries to submit the information for registering with your site. Which HTTP method would you use?<br>A. GET<br>B. POST<br>C.PUT<br>D. HIDDEN', N'b', CAST(N'2018-02-18' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (82, N'Which of the following feature is present in Struts 2?<br>A. POJO forms and POJO actions<br>B. Tag support<br>C. AJAX support<br>D. All of the others.
', N'd', CAST(N'2018-04-29' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (83, N'Which of these is legal return type of the doStartTag method defined in a class that extends TagSupport class?<br>A. EVAL_PAGE<br>B. EVAL_BODY<br>C. EVAL_PAGE_INCLUDE<br>D. EVAL_BODY_INCLUDE
', N'a', CAST(N'2018-03-03' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (84, N'What kind of activities should NOT be done by a filter: <br>A. Authentication<br>B. Encryption<br>C. Logging and Auditing<br>D. CRUD actions for an Entity', N'b', CAST(N'2017-02-04' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (85, N'In MVC 2 architecture, which component receives all the request for the application and is responsible for taking appropriate action in response to each request.<br>A. Controller<br>B. View<br>C. Model<br>D. No answer is correct
', N'd', CAST(N'2019-09-18' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (86, N'What will happen when a servlet makes the following call within its doGet() method?<br>
getServletContext().setAttribute("userid", userid);<br>A. The userid attribute is placed in application scope.<br>B. The code in complied error<br>C. A SessionContextListener will be invoked.<br>D. Nothing happend
', N'd', CAST(N'2018-02-01' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (87, N'Regarding URL rewriting for session support, which of the following is true?<br>A. Every URL that the client uses must include jsessionid.<br>B. Only the first request that the client makes must include jsessionid.<br>C. All the URLs should include IP address in the URL.<br>D. Both, IP and machine name should be included in all the URLs.
', N'b', CAST(N'2019-02-09' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (88, N'Which interface and method should be used to retrieve a servlet initialization parameter value? <br>A. ServletConfig : getInitParameter(String name)<br>B. ServletConfig : getParameter(String name)<br>C. ServletContext : getInitParameter(String name))<br>D. ServletConfig : getInitParameterNames(String name)
', N'd', CAST(N'2019-02-18' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (89, N'Which of the following defines the class name of a tag in a TLD?<br>A. tag-class-name<br>B. tag-class<br>C. class-name<br>D. class
', N'c', CAST(N'2018-07-29' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (90, N'How to create your own user custom Filter?<br>A. Extends Filter<br>B. Implements Filter<br>C. Extends ServletFilter<br>D. Implements ServletFilter
', N'b', CAST(N'2018-08-01' AS Date), 2, N'false', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (91, N'How to read parameter id in query string?<br>A. Inside doGet method: request.getParameter("id");<br>B. Inside doPost method: request.getParameter("id");<br>C. Inside doGet method: request.getAttribute("id");<br>D. Inside doPost method: param.getAttribute ("id");
', N'c', CAST(N'2018-08-18' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (92, N'How to access a parameter named student by using the expression language?<br>A. ${param. student }<br>B. ${param["student "]}<br>C. ${ student }<br>D. $[" student"]
', N'a', CAST(N'2019-01-01' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (93, N'Servlet Filters are Java classes that can be used in Servlet Programming for the following purposes: <br>A. To intercept requests from a client before they access a resource at back end.<br>B. To manipulate responses from server before they are sent back to the client.<br>C. Both A and B are correct.<br>D. None of A or B is correct.
', N'b', CAST(N'2020-01-04' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (94, N'When a Web server responds to a request from a browser or other Web client, the response typically consists of: <br>A. a status line, some response headers, a blank line, and the document.<br>B. a status line, a blank line, and the document.<br>C. a blank line, a status line, some response headers and the document.<br>D. a status line, some response headers, and the document.
', N'b', CAST(N'2019-03-05' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (95, N'Which of the following is a valid standard action that can be used by a jsp page to import content generated by another JSP file named another.jsp?<br>A. <jsp:include page=''another.jsp''/><br>B. <jsp:import page=''another.jsp''/><br>C. <jsp:include file=''another.jsp''/><br>D. <jsp:import file=''another.jsp''/>
', N'a', CAST(N'2020-01-02' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (96, N'Which of the following executes the any kind of SQL statement?<br>A. boolean execute()<br>B. ResultSet executeQuery()<br>C. int executeUpdate()<br>D. None of the above.
', N'c', CAST(N'2018-08-19' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (97, N'What are servlet filter method:<br>A. public void doFilter (ServletRequest, ServletResponse, FilterChain)<br>B. public void init(FilterConfig filterConfig)<br>C. public void destroy()<br>D. All of answers are correct
', N'd', CAST(N'2021-01-21' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (98, N'
What JDBC stands for?<br>A. Java Driver for Basic Connection<br>B. Java Database Connectivity<br>C. Joint Database Connectivity<br>D. Joint Driver for Basic Connection
', N'd', CAST(N'2021-02-18' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (99, N'The EL provides a way to use simple expressions to perform the following tasks:<br>A. Dynamically read application data stored in JavaBeans components, various data structures, and implicit objects<br>B. Dynamically write data, such as user input into forms, to JavaBeans components<br>C. Invoke arbitrary static and public methods<br>D. Dynamically perform arithmetic operations', N'a', CAST(N'2021-01-19' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (100, N'Which of the following holds data retrieved from a database after you execute an SQL query using Statement objects?<br>A. ResultSet<br>B. JDBC driver<br>C. Connection<br>D. Statement
', N'a', CAST(N'2018-02-01' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (101, N'Which of the following statement is true about servlet filter ?<br>A. A filter is a reusable piece of code that can transform the content of HTTP requests, responses, and header information<br>B. Filters do not generally create a response or respond to a request as servlets do.<br>C. Filters can act on dynamic or static content.<br>D. All of the above
', N'a', CAST(N'2018-08-10' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (102, N'Servlet Container calls the init method on a servlet instance ____<br>A. Only once in the life time of the servlet instance.<br>B. For each request to the servlet.<br>C. If the request is from the user whose session has expired.<br>D. For each request to the servlet that causes a new thread to be created.
', N'c', CAST(N'2019-09-02' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (103, N'Which of the following element of web.xml defines a mapping between a servlet and a URL pattern? <br>A. servlet-mapping<br>B. mapping<br>C. url_mapping<br>D. servlet-url
', N'd', CAST(N'2019-04-03' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (104, N'Classes HttpServlet and GenericServlet implement the ___ interface.<br>A. Servlet<br>B. Http<br>C. HttpServletRequest<br>D. HttpServletResponse
 ', N'a', CAST(N'2020-09-09' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (105, N'You have to send a gif image to the client as a response to a request. Which of the following calls will you have to make? <br>A. response.setContentType("image/gif");<br>B. response.setType("application/gif");<br>C. response.setContentType("application/bin");<br>D. response.setType("image/gif");
', N'a', CAST(N'2021-01-06' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (106, N'Following is the code for doGet() and doPost() methods of TestServlet.<br>A. This will only work for HTTP GET requests<br>B. This will only work for HTTP POST requests<br>C. This will work for HTTP GET as well as POST requests.<br>D. It''ll throw an exception at runtime, as you cannot call doGet() from doPost().
', N'b', CAST(N'2020-04-03' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (107, N'Which of the following is indicated by URL, which is used on the Internet? <br>A. Information resources(sources) on the Internet<br>B. E-mail addresses for use in the Internet<br>C. IP addresses of servers connected to the Internet<br>D. Owners of PCs connected to the Internet', N'b', CAST(N'2018-03-04' AS Date), 2, N'true', 1)
GO
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (108, N'Identify correct statement about a WAR file.<br>A. It is an XML document.<br>B. It cannot be unpackaged by the container.<br>C. It is used by web application developer to deliver the web application in a single unit.<br>D. It contains web components such as servlets as well as EJBs.
', N'b', CAST(N'2020-02-26' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (109, N'A parameter is defined in a <context-param> element of the deployment descriptor for a web application. Which of the following statements is correct? <br>A. It is accessible to all the servlets of the webapp.<br>B. It is accessible to all the servlets of all the webapps of the container.<br>C. It is accessible only to the servlet it is defined for.<br>D.It is accessible to all the servlets of all the webapps of the container.
', N'd', CAST(N'2017-08-08' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (110, N'A .................... manages the threading for the servlets and JSPs and provides the necessary interface with the Web server. <br>A. Web Container<br>B. EJB Container<br>C. Servlets<br>D. Applets', N'b', CAST(N'2020-04-08' AS Date), 2, N'false', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (111, N'A ________has a name, a single value, and optional attributes such as a comment, path and domain qualifiers, a maximum age, and a version number.<br>A. Cookie<br>B. Session<br>C. Request<br>D. Response
', N'd', CAST(N'2019-04-07' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (112, N'Which of the following method calls can be used to retrieve an object from the session that was stored using the name "roleName"?<br>A. getObject("roleName");<br>B. getValue("roleName");<br>C. get("roleName");<br>D. getAttribute("roleName");
', N'a', CAST(N'2020-04-02' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (113, N'Which is NOT a standard technique for a session be definitely invalidated?<br>A. The container is shutdown and brought up again.<br>B. No request comes from the client for more than "session timeout" period.<br>C. A servlet explicitly calls invalidate() on a session object.<br>D. If the session time out is set to 0 using setMaxInactiveInterval() method.
', N'a', CAST(N'2020-03-03' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (114, N'Which method can be invoked on a session object so that it is never invalidated by the servlet container automatically?<br>A. setMaxInactiveInterval(-1)<br>B. setTimeOut(Integer.MAX_INT)<br>C. setMaxInactiveInterval(Integer.MAX_INT)<br>D. setTimeOut(-1)', N'a', CAST(N'2019-02-01' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (116, N'Java web application contains<br>A. Dynamic web pages<br>B. Static web pages<br>C. Media resources<br>D. All answers are correct
', N'b', CAST(N'2020-02-01' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (117, N'Which class that includes the getSession method that is used to get the HttpSession object?<br>A. HttpServletRequest<br>B. HttpServletResponse<br>C. SessionContext<br>D. SessionConfig
', N'c', CAST(N'2020-06-07' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (118, N'Name the implicit variable is available to JSP pages that may be used to access all the other implicit objects.<br>A. Request<br>B. Response<br>C. pageContext<br>D. out
', N'd', CAST(N'2020-05-03' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (119, N'Given that a user enters the following into her browser, which (if any) of the mapped servlets will execute? <br>A. ServletA<br>B. ServletB<br>C. ServletC<br>D. ServletD
', N'd', CAST(N'2019-08-04' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (120, N'Standard Java EE web applications are deployed as:<br>A. WAR files<br>B. JAR files<br>C. DLL files<br>D. CLASS files
', N'b', CAST(N'2020-01-05' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (121, N'What are the components of Java Web Application?<br>A. Servlets<br>B. Jsps<br>. Filters<br>D. Listeners
', N'c', CAST(N'2019-02-08' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (122, N'You do not want the user to see the data and the format being passed to your server when the user tries to submit the information for registering with your site. Which HTTP method would you use?<br>A. GET<br>B. POST<br>C.PUT<br>D. HIDDEN
', N'd', CAST(N'2019-02-04' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (123, N'In MVC 2 architecture, which component receives all the request for the application and is responsible for taking appropriate action in response to each request.<br>A. Controller<br>B. View<br>C. Model<br>D. No answer is correct
', N'd', CAST(N'2020-03-04' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (124, N'Which of the following defines the class name of a tag in a TLD?<br>A. tag-class-name<br>B. tag-class<br>C. class-name<br>D. class
', N'c', CAST(N'2019-04-03' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (125, N'How to create your own user custom Filter?<br>A. Extends Filter<br>B. Implements Filter<br>C. Extends ServletFilter<br>D. Implements ServletFilter
', N'a', CAST(N'2018-09-02' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (126, N'Which of the following executes the any kind of SQL statement?<br>A. boolean execute()<br>B. ResultSet executeQuery()<br>C. int executeUpdate()<br>D. None of the above.
', N'a', CAST(N'2019-02-04' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (127, N'What kind of activities should NOT be done by a filter: <br>A. Authentication<br>B. Encryption<br>C. Logging and Auditing<br>D. CRUD actions for an Entity', N'b', CAST(N'2019-02-07' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (128, N'a', N'a', CAST(N'2020-02-02' AS Date), 2, N'false', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (129, N'a', N'a', CAST(N'2009-02-02' AS Date), 2, N'false', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (130, N'a', N'b', CAST(N'2020-02-02' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (131, N'c', N'c', CAST(N'2021-03-17' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (132, N'fff', N'd', CAST(N'2021-03-18' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (133, N'zxc', N'a', CAST(N'2021-03-18' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (134, N'111', N'a', CAST(N'2021-03-18' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (135, N'111', N'a', CAST(N'2021-03-18' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (137, N'zzz', N'a', CAST(N'2021-03-18' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (138, N'long', N'a', CAST(N'2021-03-18' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (139, N'son', N'a', CAST(N'2021-03-23' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (140, N'truong', N'a', CAST(N'2021-03-23' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (141, N'truong', N'a', CAST(N'2021-03-23' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (142, N'truong', N'a', CAST(N'2021-03-23' AS Date), 2, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (143, N'han', N'a', CAST(N'2021-03-23' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (144, N'khang', N'a', CAST(N'2021-03-23' AS Date), 1, N'true', 1)
INSERT [dbo].[tblQuestion] ([idQuestion], [question], [answer], [createDate], [idSubject], [status], [point]) VALUES (145, N'con bo', N'a', CAST(N'2021-03-23' AS Date), 1, N'true', 1)
SET IDENTITY_INSERT [dbo].[tblQuestion] OFF
SET IDENTITY_INSERT [dbo].[tblSubject] ON 

INSERT [dbo].[tblSubject] ([idSubject], [name], [numberOfQuestions], [timeToDo]) VALUES (1, N'Java Desktop', 40, 60)
INSERT [dbo].[tblSubject] ([idSubject], [name], [numberOfQuestions], [timeToDo]) VALUES (2, N'Java Web', 50, 80)
SET IDENTITY_INSERT [dbo].[tblSubject] OFF
SET IDENTITY_INSERT [dbo].[tblTmpAnswer] ON 

INSERT [dbo].[tblTmpAnswer] ([idChoice], [id], [idSubject]) VALUES (1, N'2                                                 ', 1)
SET IDENTITY_INSERT [dbo].[tblTmpAnswer] OFF
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'Thread supports in Java are ...............<br>a. The java.lang.Thread class<br>b. The java.io.Runnable interface.<br>c. java.threads.Thread class<br>d. The java.lang.Runnable interface', N'd', N'', 0, 48)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'In terms of RMI architecture, which of the following is the valid way to create RMI registry on port 1098?<br>a. LocateRegistry.createRegistry(1098);<br>b. Registry.createRegistry(1098);<br>c. RMIRegistry.createOnPort(1098);<br>d.Registry.createRegistry(1000);', N'c', N'', 0, 19)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'Which of the following is a physical font and does not depend on the hosting operating system?<br>a. PostScript<br>b. TrueType<br>c. Lucida<br>d. Dialog', N'a', N'', 0, 65)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'The .......... layout puts components of a container in a row, sized at their preferred size.<br>a. Grid<br>b. GridBag<br>c. Flow<br>d. Card', N'd', N'', 0, 56)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'With respect to the MVC architecture, when a Swing component is a view of an object, data is seen by user is the result of the ...... method of the object.<br>a. toString()<br>b. getData()<br>c. getObject()<br>d. getDataForView()
', N'd', N'', 0, 58)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'In the package java.awt.*, which of the following class represents graphical images as rectangular arrays of pixels?<br>a. IOImage<br>b. BufferedImage<br>c. Image<br>d. Images', N'c', N'', 0, 13)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'Two streams of a socket:<br>(1) Output stream contains .............<br>(2) Input stream contains ...............<br>a. data has been received, data will be sent.<br>b. data processed, data waiting for processing<br>c. data will be sent, data has been received.<br>d. data will be printed out, data can be written to a file.', N'c', N'', 0, 46)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'The ...... is default layout manager of .............<br>a. BorderLayout, JFrame<br>b. BorderLayout, JPanel<br>c. FlowLayout, JPanel<br>d. FlowLayout, JFrame', N'b', N'', 0, 55)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'Which method is used to get graphic object of a component?<br>a. None of the others<br>b. Component.getGraphics()<br>c.Component.referGraphics()<br>d. Component.setGraphics()
', N'c', N'', 0, 64)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'Suppose a connection object connection has been made successfully to database. There is a table named Inventory with columns: CarID, Make, Color, and PetName.<br>Which line of code should be placed at Line 1 so that all data in the Inventory table can be printed out?<br>a. ResultSet rs = st.executeUpdate("Select * from Inventory");<br>b. ResultSet rs = st.executeQuery("Select * from Inventory");<br>c. ResultSet rs = st.query("Select from Inventory");<br>d. ResultSet rs = st.query("from Inventory");', N'c', N'', 0, 31)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'The first step in a RMI implementation is ..........<br>a. Create a client program.<br>b. Create a server program.<br>c. Create a class for server object.<br>d. Create a remote interface.
', N'a', N'', 0, 36)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'Which of the following method in the Graphics class can be used to render an image on a component?<br>a. Graphics.drawImage()<br>b. Graphics.paintImage()<br>c. Graphics.showImage()<br>d. Graphics.renderImage()', N'b', N'', 0, 14)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'The ......... class will puts all components of a container in the same size.<br>a. FlowLayout<br>b. GridLayout<br>c. GridBagLayout<br>d. CardLayout', N'a', N'', 0, 57)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'An active process ..............<br>a. is a program which was loaded to the memory.<br>b. can not contain any thread.<br>c. has a self-contained execution environment.<br>d. contains at least one thread.
', N'd', N'', 0, 47)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'There are flat data need to be shown on the GUI. The ....... class should be used.<br>a. javax.swing.JTable<br>b. java.util.Vector<br>c. javax.swing.JTree<br>d. java.util.ArrayList', N'b', N'', 0, 54)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'Localization is the process of not only changing the language interaction?<br>a. All of the others <br>b. Data formats<br>c. Number formats<br>d. Currency formats', N'a', N'', 0, 8)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'Which line of code should be placed at Line 1 to start aThread as a thread?<br>a. aThread.startThread();<br>b. aThread.runThread();<br>c. aThread.run();<br>d. aThread.start();', N'c', N'', 0, 24)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'..... is (are) used to specify an application running on a computer in a network.<br>a. IP and port<br>b. Hostname<br>c. IP<br>d. ID of the CPU', N'b', N'', 0, 35)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'Consider the following overridden method in a JFrame class? <br>a. g.drawChars(s, 5, 4, 60, 90); <br>b. g.drawChars(s[4], 60, 90); <br>c. g.drawChars(s, 4, 5, 60, 90); <br>d. g.drawChars(s, 4, 5, 6, 90);', N'c', N'', 0, 7)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'In 332 terms of JDBC API, what does the Statement.executeUpdate() method return? <br>a. An integer value indicates the number of records that have been executed successfully. <br>b. A Boolean value indicates if the specified query is executed successfully or not.<br>c. A string value indicates the number of records that have been executed successfully. <br>d. A float value indicates if the specified query is executed successfully or not', N'a', N'', 0, 5)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'In terms of JDBC API, in order to execute a SQL Insert query, which method in the Statement class should be used?<br>a. executeSelect()<br>b. performQuery()<br>c. executeUpdate()<br>d. executeQuery()', N'a', N'', 0, 10)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'Which of the following method in the Graphics class can be used to render an image on a component?<br>a. Graphics.drawImage()<br>b. Graphics.paintImage()<br>c. Graphics.showImage()<br>d. Graphics.renderImage()
', N'd', N'', 0, 61)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'In terms of RMI architecture, which object is responsible for opening a socket to the remote server, marshalling the object parameters, and forwarding the data stream to the skeleton?<br>a. Stub<br>b. RMI Registry<br>c. Skeleton<br>d. Remote object
', N'a', N'', 0, 25)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'... is a build-in exception that will be thrown in networking using Java RMI technology.<br>a. NetworkException<br>b. RemoteException<br>c. None of the others.<br>d. ClientException', N'a', N'', 0, 37)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'Which of the following JDBC driver Type uses the JDBC-ODBC bridge?<br>a. Type 4<br>b. Type 2<br>c. Type 1<br>d. Type 3', N'c', N'', 0, 62)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'Which of the following method in the Graphics class can be used to draw a filled rectangle at the coordinate (left, top) with the width (w) and the height (h)?<br>a. fullRect(left, top, w, h);<br>b. rectFilled(left, top, w, h);<br>c. fillRect(left, top, w, h);<br>d. fillRect(left, top, w, w);', N'd', N'', 0, 29)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'Supose that the rs result set contains no row. The following statement will return ...rs.next();<br>a. None of the others<br>b. -1<br>c. true<br>d. null
', N'c', N'', 0, 39)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'The .......... method of the java.net.ServerSocket class will wait for a connection from a client.<br>a. None of the others.<br>b. wait()<br>c. accept()<br>d. available()', N'c', N'', 0, 43)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'In the package java.awt.image.*, which of the following class manages images in memory and provides methods for storing, interpreting, and obtaining pixel data?<br>Select one:<br>a. Image<br>b. IOImage<br>c. Images<br>d. BufferedImage', N'a', N'', 0, 11)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'In terms of Socket communication, which the following method the server should call to wait for and accept a request connection from clients?<br>a. java.net.Socket.accept()<br>b. java.net.Socket.wait()<br>c. java.net.Socket.waitClient()<br>d. java.net.Socket.acceptClients()', N'a', N'', 0, 18)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'Which method is used to get graphic object of a component?<br>a. None of the others<br>b. Component.getGraphics()<br>c.Component.referGraphics()<br>d. Component.setGraphics()', N'a', N'', 0, 21)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'
Which method is used to get graphic object of a component?<br>a. None of the others<br>b. Component.getGraphics()<br>c.Component.referGraphics()<br>d. Component.setGraphics()', N'd', N'', 0, 9)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'To get a connection to a database, the getConnection(...) method of the .....class should be called.<br>a. DriverManager<br>b. Drivers<br>c. DatabaseConnection<br>d. Connection', N'b', N'', 0, 34)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'Suppose all required classes are imported, which line of code should be place at Line 1 to bind the service name to the remote object?<br>a. Naming.rebind(serviceName, c);<br>b. serviceName.rebind(c);<br>c. c.rebind(serviceName);<br>c. d.rebind(serviceName, c);
', N'b', N'', 0, 30)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'In terms of JDBC API, in order to execute a SQL Select query, which method in the Statement class should be used?<br>a. executeSelect()<br>b. executeUpdate()<br>c. performQuery()<br>d. executeQuery()', N'b', N'', 0, 26)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'A socket is one endpoint of a two-way communication link between two programs running on the network. It contains information that allow ....<br>a. All of the other.<br>b. determining where data will be received.<br>c. a propram on this computer identifies an application running on the other.<br>d. determining where received data has been sent from.', N'a', N'', 0, 32)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'Which of the following JDBC driver Type uses the JDBC-ODBC bridge?<br>a. Type 4<br>b. Type 2<br>c. Type 1<br>d. Type 3', N'd', N'', 0, 15)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'States of a thread:<br>a. runb. sleeping<br>c. escaping<br>d. ready', N'c', N'', 0, 49)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'Suppose that a database was registered the datasource name KK in ODBC of a system. To specify this database, the string ........ should be used.<br>a. "sun.jdbc.odbc.KK"<br>b. "sun:odbc:jdbc:KK"<br>c. None of the others.<br>d. "jdbc:odbc:KK"', N'c', N'', 0, 42)
INSERT [dbo].[tblTmpAnswerDetail] ([idChoice], [question], [answer], [choice], [isCorrect], [idQuestion]) VALUES (1, N'a', N'b', N'', 0, 130)
INSERT [dbo].[tblUser] ([id], [name], [password], [role], [status]) VALUES (N'1                                                 ', N'1                   ', N'1                                                                                                                                                                                                                                                              ', N'admin     ', N'1')
INSERT [dbo].[tblUser] ([id], [name], [password], [role], [status]) VALUES (N'2                                                 ', N'2                   ', N'd4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35                                                                                                                                                                                               ', N'member    ', N'true')
INSERT [dbo].[tblUser] ([id], [name], [password], [role], [status]) VALUES (N'3                                                 ', N'test                ', N'4e07408562bedb8b60ce05c1decfe3ad16b72230967de01f640b7e4729b49fce                                                                                                                                                                                               ', N'admin     ', N'new')
INSERT [dbo].[tblUser] ([id], [name], [password], [role], [status]) VALUES (N'cu                                                ', N'Son Ba              ', N'2                                                                                                                                                                                                                                                              ', N'admin     ', N'1')
INSERT [dbo].[tblUser] ([id], [name], [password], [role], [status]) VALUES (N'lo                                                ', N'Thanh Long          ', N'1                                                                                                                                                                                                                                                              ', N'member    ', N'1')
ALTER TABLE [dbo].[tblHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblHistory_tblSubject] FOREIGN KEY([idSubject])
REFERENCES [dbo].[tblSubject] ([idSubject])
GO
ALTER TABLE [dbo].[tblHistory] CHECK CONSTRAINT [FK_tblHistory_tblSubject]
GO
ALTER TABLE [dbo].[tblHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblHistory_tblUser] FOREIGN KEY([id])
REFERENCES [dbo].[tblUser] ([id])
GO
ALTER TABLE [dbo].[tblHistory] CHECK CONSTRAINT [FK_tblHistory_tblUser]
GO
ALTER TABLE [dbo].[tblQuestion]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestion_tblSubject] FOREIGN KEY([idSubject])
REFERENCES [dbo].[tblSubject] ([idSubject])
GO
ALTER TABLE [dbo].[tblQuestion] CHECK CONSTRAINT [FK_tblQuestion_tblSubject]
GO
ALTER TABLE [dbo].[tblTmpAnswer]  WITH CHECK ADD  CONSTRAINT [FK_tblTmpAnswer_tblSubject] FOREIGN KEY([idSubject])
REFERENCES [dbo].[tblSubject] ([idSubject])
GO
ALTER TABLE [dbo].[tblTmpAnswer] CHECK CONSTRAINT [FK_tblTmpAnswer_tblSubject]
GO
ALTER TABLE [dbo].[tblTmpAnswer]  WITH CHECK ADD  CONSTRAINT [FK_tblTmpAnswer_tblUser] FOREIGN KEY([id])
REFERENCES [dbo].[tblUser] ([id])
GO
ALTER TABLE [dbo].[tblTmpAnswer] CHECK CONSTRAINT [FK_tblTmpAnswer_tblUser]
GO
ALTER TABLE [dbo].[tblTmpAnswerDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblTmpAnswerDetail_tblQuestion] FOREIGN KEY([idQuestion])
REFERENCES [dbo].[tblQuestion] ([idQuestion])
GO
ALTER TABLE [dbo].[tblTmpAnswerDetail] CHECK CONSTRAINT [FK_tblTmpAnswerDetail_tblQuestion]
GO
ALTER TABLE [dbo].[tblTmpAnswerDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblTmpAnswerDetail_tblTmpAnswer] FOREIGN KEY([idChoice])
REFERENCES [dbo].[tblTmpAnswer] ([idChoice])
GO
ALTER TABLE [dbo].[tblTmpAnswerDetail] CHECK CONSTRAINT [FK_tblTmpAnswerDetail_tblTmpAnswer]
GO
USE [master]
GO
ALTER DATABASE [Assignment2-NguyenPhamThanhLong] SET  READ_WRITE 
GO
