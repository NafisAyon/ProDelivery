CREATE TABLE [dbo]. [Receiver]
(
  [Rec_Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Rec_Email] NVARCHAR(50) NOT NULL UNIQUE,
  [Rec_Password] NVARCHAR(50) NOT NULL,
  [Rec_Phone] NVARCHAR(20) NOT NULL UNIQUE,
  [Rec_Name] NVARCHAR(50),
  [Rec_Address] NVARCHAR(50),
)
CREATE TABLE [dbo]. [Sender]
(
  [Sender_Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Sender_Email] NVARCHAR(50) NOT NULL UNIQUE,
  [Sender_Password] NVARCHAR(50) NOT NULL,
  [Sender_Phone] NVARCHAR(15) NOT NULL UNIQUE,
  [Sender_Name] NVARCHAR(50),
  [Sender_Address] NVARCHAR(50),
)
CREATE TABLE [dbo]. [Admins]
(
  [Admin_Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Admin_Email] NVARCHAR(50) NOT NULL UNIQUE,
  [Admin_Password] NVARCHAR(50) NOT NULL,
  [Admin_Name] NVARCHAR(50),
)
CREATE TABLE [dbo].[Branch]
(
  [Branch_Id] INT IDENTITY(1,1) PRIMARY KEY,
  [Branch_Name] NVARCHAR(50),
  [Branch_Address] NVARCHAR(50),
  [Branch_Phone] NVARCHAR(20),
  [Pincode] NVARCHAR(10),
  [Request_Id] NVARCHAR(10) NOT NULL,
  [Rec_Id] INT NOT NULL FOREIGN KEY REFERENCES Receiver(Rec_Id),
  [Sender_Id] INT NOT NULL FOREIGN KEY REFERENCES Sender(Sender_Id),
  [Admin_Id] INT NOT NULL FOREIGN KEY REFERENCES Admins(Admin_Id),
)
CREATE TABLE [dbo]. [Dealership]
(
  [Dealership_Id] INT IDENTITY(1,1) PRIMARY KEY,
  [Sender_Name] NVARCHAR(50),
  [Branch_Address] NVARCHAR(50),
  [Date_Of_Apply] DATE,
  [Money_Deposited] DECIMAL(18,2) NOT NULL,
  [Sender_Id] INT NOT NULL FOREIGN KEY REFERENCES Sender(Sender_Id),
  [Admin_Id] INT NOT NULL FOREIGN KEY REFERENCES Admins(Admin_Id),
)
CREATE TABLE [dbo]. [Dispatcher]
( 
  [Dispatcher_Id] INT IDENTITY(1,1) PRIMARY KEY,
  [Rec_Name] NVARCHAR(50),
  [Sender_Name] NVARCHAR(50),
  [Branch_Name] NVARCHAR(50),
  [Description] TEXT NULL,
  [Rec_Id] INT NOT NULL FOREIGN KEY REFERENCES Receiver(Rec_Id),
  [Sender_Id] INT NOT NULL FOREIGN KEY REFERENCES Sender(Sender_Id),
  [Admin_Id] INT NOT NULL FOREIGN KEY REFERENCES Admins(Admin_Id),
)
CREATE TABLE [dbo]. [Consignment]
(  
  [Shipper_Name] NVARCHAR(50),
  [Shipper_Phone] NVARCHAR(20) NOT NULL PRIMARY KEY,
  [Total_Weight] DECIMAL(10,2),
  [Category] NVARCHAR(15),
  [No_Of_Items] INT NOT NULL,
  [Description] TEXT NULL,
  [Branch_Name] NVARCHAR(50),
  [Branch_Address] NVARCHAR(50),
  [Rec_Name] NVARCHAR(50),
  [Rec_Address] NVARCHAR(50),
  [Branch_Id] INT NOT NULL FOREIGN KEY REFERENCES Branch(Branch_Id),
  [Rec_Id] INT NOT NULL FOREIGN KEY REFERENCES Receiver(Rec_Id),
)
INSERT INTO [dbo]. [Admins]([Admin_Email],[Admin_Password],[Admin_Name])
VALUES('tausif@gmail.com',1234567,'Tausif'),
      ('rahim@gmail.com',4566,'Rahim'),
      ('karim@gmail.com',4596,'karim'),
	  ('a@gmail.com',1234567,'Ayon'),
      ('b@gmail.com',1234567,'Nafis')

CREATE TABLE [dbo]. [Aboutus]
(
  [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [Title] NVARCHAR(200) NOT NULL ,
  [Image] NVARCHAR(200) NOT NULL ,
  [Description] NVARCHAR(500) NOT NULL
)

CREATE TABLE [dbo]. [Services]
( 
  [Services_Id] INT IDENTITY(1,1) PRIMARY KEY,
  [p2p_title] TEXT,
  [p2p_description] TEXT,
  [air_title] TEXT,
  [air_description] TEXT,
  [corporate_title] TEXT,
  [corporate_description] TEXT
)
INSERT INTO [dbo]. [Services]([p2p_title],[p2p_description],[air_title],[air_description],[corporate_title],[corporate_description])
VALUES ('Person 2 Person Delivery (P2P)','In a generation where everything happens in an instant, delivery services also need to level up their game. Whether you need to send your father’s reading glasses or surprise your mom with a handwoven shawl, we’ll make sure everything moves with flexibility, speed, and accuracy.<br>With our presence across the nation, we bring your essentials at the speed of light, making your life hassle-free. We are there to bring respite to an anxious wife waiting at the door or a mother waiting for a sweet surprise. Don’t worry, for we are here to deliver the memories of a lifetime.',
        'Air Parcel','When things can’t wait to be sent the next day or the coming week, and you desperately want to send or receive something that very day, we hear you. We understand the anticipation for those documents from your potential employer, or the joy your child feels when his birthday gift comes well in advance.<br>Every parcel that we carry comes bundled with real-time tracking so you know where it is headed. Our dedicated team works 24*7 to ensure fastest delivery and minimize cancelation ratio so that we, as a business partner, can ensure your parcel always reaches its destination in record time. And, it matters a great degree because while moving things that are so close to you, we also intend to move a part of you.',
        'Corporate & SME Delivery','A business is built on promises. When you promise a potential customer swift delivery, allow us to help you fulfil it. When you promise your partners scalability, we can help you with that as well.<br>From providing a hassle-free end-to-end delivery to making sure we accelerate your company’s efficiency, we help your business a great deal with each delivery. Our delivery solutions can be customised for big and small corporations. Powered by advanced tracking systems, you can track your orders just like you track your company’s growth every quarter.')


INSERT INTO [dbo]. [Aboutus]([Title],[Image],[Description])
VALUES('Person to Person','~/Content/images/aboutus1.jpg','From personal belonging to important notes, we deliver with high accuracy and speed.'),
      ('Air Parcel','~/Content/images/aboutus2.jpeg','If you want to instant delivery and cannot wait for long then air parcel is a best option.'),
      ('Merchant Delivery','~/Content/images/aboutus3.jpg','Hassle free and hand to hand delivery are ensured for our client for your companys progress.')
