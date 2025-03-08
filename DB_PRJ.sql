Create database PRJ_Assignment;
Use PRJ_Assignment;

-- Table: Brand
CREATE TABLE Brands (
    bID INT PRIMARY KEY IDENTITY(1,1),
    bName NVARCHAR(100) NOT NULL UNIQUE
);

-- Table: CarOwners
CREATE TABLE CarOwners (
    ownerID INT PRIMARY KEY IDENTITY(1,1),
    ownerName NVARCHAR(100) NOT NULL,
    ownerPhone NVARCHAR(20) NOT NULL,
    ownerEmail NVARCHAR(100),
    ownerAddress NVARCHAR(255),
    ownerDescription NVARCHAR(1000)
);

-- Table: Car
CREATE TABLE Cars (
    cID INT PRIMARY KEY IDENTITY(1,1),
    cName NVARCHAR(100) NOT NULL,
    cBrandID INT NOT NULL,
    cColour NVARCHAR(30) NOT NULL,
    cForm NVARCHAR(50),
    cYear INT NOT NULL,
    cPrice DECIMAL(15, 2) NOT NULL,
    cMileage INT,
    cFuelType NVARCHAR(50),
    cTransmission NVARCHAR(50),
    cImageURL NVARCHAR(255),
    ownerID INT,
    FOREIGN KEY (cBrandID) REFERENCES Brands(bID),
    FOREIGN KEY (ownerID) REFERENCES CarOwners(ownerID)
);

-- Table: Users
CREATE TABLE [Users] (
    uID INT PRIMARY KEY IDENTITY(1,1),
    uName NVARCHAR(100) NOT NULL,
    uEmail NVARCHAR(100) NOT NULL UNIQUE,
    uPassword NVARCHAR(255) NOT NULL,
    uPhone NVARCHAR(20),
    uAddress NVARCHAR(255),
    uRole NVARCHAR(50) DEFAULT 'Customer'
);

-- Table: Orders
CREATE TABLE Orders (
    oID INT PRIMARY KEY IDENTITY(1,1),
    oUserID INT NOT NULL,
    oCarID INT NOT NULL,
    oOrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    oTotalPrice DECIMAL(15, 2) NOT NULL,
    oStatus NVARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (oUserID) REFERENCES [Users](uID),
    FOREIGN KEY (oCarID) REFERENCES Cars(cID)
);

-- Table: Images
CREATE TABLE Images (
    iID INT PRIMARY KEY IDENTITY(1,1),
    iCarID INT NOT NULL,
    iURL NVARCHAR(255) NOT NULL,
    FOREIGN KEY (iCarID) REFERENCES Cars(cID)
);


INSERT INTO Brands (bName)
VALUES 
    ('Kia'),
    ('Bentley'),
    ('Audi'),
    ('BMW'),
    ('Ford'),
    ('Mercedes'),
    ('VinFast'),
    ('Mini'),
    ('Nissan'),
    ('Lexus');


INSERT INTO Cars
	(cName, cBrandID, cColour, cForm, cYear, cPrice, cMileage, cFuelType, cTransmission, cImageURL, ownerID)
VALUES
    (
	'Kia Morning GT-Line', 1, 'Trắng', 'Hatchback', 2024, 424000000.00, 8639, 
    'Xăng 1.25L', 'Số tự động', 'https://s.bonbanh.com/uploads/users/37124/car/6111290/m_1740905586.204.jpg', 1
	),
	(
	'Bentley Continental GT S V8', 2, 'Xanh', 'Coupe', 2023, 16950000000.00, 4000,
	'Xăng 4.0 L', 'Số tự động', 'https://s.bonbanh.com/uploads/users/67314/car/5977057/m_1733812795.532.jpg', 2
	),
	(
	'Audi A6 S Line 40 TFSI', 3, 'Trắng', 'Sedan', 2025, 2286000000.00, 0, 
	'Xăng 2.0L', 'Số tự động', 'https://s.bonbanh.com/uploads/users/754708/car/6120194/m_1741313520.485.jpg', 3
	),
	(
	'BMW X3 sDrive20i M Sport', 4, 'Trắng', 'SUV', 2024, 2079000000.00, 16000,
	'Xăng 2.0L', 'Số tự động', 'https://s.bonbanh.com/uploads/users/807624/car/6106255/m_1740645068.840.jpg', 4
	),
	(
	'Ford Ranger Raptor 2.0L 4x4 AT', 5, 'Đen', 'Bán tải / Pickup', 2025, 1149000000.00, 0,
	'Dầu 2.0L', 'Số tự động', 'https://s.bonbanh.com/uploads/users/807624/car/6106255/m_1740645068.840.jpg', 5
	),
	(
	'Mercedes Benz Maybach S450 4Matic', 6, 'Trắng', 'Sedan', 2022, 7250000000.00, 8000,
	'Xăng 3.9L', 'Số tự động', 'https://s.bonbanh.com/uploads/users/543668/car/6088235/m_1739783215.933.jpg', 6
	),
	(
	'VinFast VF5 Plus', 7, 'Xanh', 'SUV', 2025, 440000000.00, 0,
	'Điện', 'Số tự động', 'https://s.bonbanh.com/uploads/users/807379/car/6102777/m_1740478069.604.jpg', 7
	),
	(
	'Mini Cooper S 3 Door All New', 8, 'Đen', 'Hatchback', 2025, 2099000000.00, 0,
	'Xăng', 'Số tự động', 'https://s.bonbanh.com/uploads/users/547806/car/6063026/m_1738481632.149.jpg', 8
	),
	(
	'Nissan Almera V 1.0 CVT', 9, 'Đỏ', 'Sedan', 2024, 495000000.00, 0,
	'Xăng 1.0L', 'Số tự động', 'https://s.bonbanh.com/uploads/users/231383/car/5982477/m_1734058071.944.jpg', 9
	),
	(
	'Lexus RX 350 Premium', 10, 'Xanh', 'SUV', 2025, 3430000000.00, 0,
	'Xăng 2.4L', 'Số tự động', 'https://s.bonbanh.com/uploads/users/738413/car/5826821/m_1726545017.463.jpg', 10);


INSERT INTO [Users] (uName, uEmail, uPassword, uPhone, uAddress, uRole)
VALUES 
    ('Hải', 'lol@gmail.com', 'Admin1', '0359797703', 'Hoà Lạc, Hà Nội', 'Admin'),
    ('Duy', 'csgo@gmail.com', 'Admin2', '0123456789', 'Hoà Lạc, Hà Nội', 'Admin'),
    ('Hiếu', 'valorant@gmail.com', 'Admin3', '0987654321', 'Hoà Lạc, Hà Nội', 'Admin'),
    ('Thích', 'ImLike@gmail.com', 'Seller1', '0147258369', 'Hoà Lạc, Hà Nội', 'Seller'),
    ('Khoan', 'HimariDang@gmail.com', 'Seller2', '0963852741', 'Hoà Lạc, Hà Nội', 'Seller'),
    ('Tú', 'ToDu@gmail.com', 'Cus1', '01597538624', 'Hoà Lạc, Hà Nội', 'Customer');


INSERT INTO Orders (oUserID, oCarID, oTotalPrice, oStatus)
VALUES 
    (6, 1, 424000000, 'Pending'),
    (6, 3, 2286000000, 'Completed'),
    (5, 5, 1149000000, 'Pending'),
    (4, 7, 440000000, 'Completed');



INSERT INTO CarOwners (ownerName, ownerPhone, ownerEmail, ownerAddress, ownerDescription)
VALUES 
    ('Mr. Thái Anh', '09876543210', 'thaianh@example.com', 'Long Biên, Hà Nội', NULL),
    ('Phùng Định', '09876543210', 'phungdinh@example.com', '114 Trần Thái Tông, p. Yên Thanh, Tp. Uông Bí, Quảng Ninh', NULL),
    ('MINI Lê Văn Lương', '0985695622', 'minilevanluong@example.com', '68 Lê Văn Lương, P. Nhân Chính, Q. Thanh Xuân, Hà Nội', NULL),
    ('Nissan Phạm Văn Đồng', '0967798836', 'nissanphamvandong@example.com', '26 Phạm Văn Đồng, Phường Xuân Đỉnh, Quận Bắc Từ Liêm, Hà Nội', NULL),
    ('Mr Văn', '0854763333', 'mrvan@example.com', 'Số 1 Dương Đình Nghệ, Nam Từ Liêm, Hà Nội', NULL);




INSERT INTO Images (iCarID, iURL)
VALUES 
-- Ảnh cho cID = 1
    (1, 'https://s.bonbanh.com/uploads/users/37124/car/6111290/m_1740905597.238.jpg'),
    (1, 'https://s.bonbanh.com/uploads/users/37124/car/6111290/m_1740905598.709.jpg'),
    (1, 'https://s.bonbanh.com/uploads/users/37124/car/6111290/m_1740905599.377.jpg'),
    (1, 'https://s.bonbanh.com/uploads/users/37124/car/6111290/m_1740905600.525.jpg'),

-- Ảnh cho cID = 2
    (2, 'https://s.bonbanh.com/uploads/users/67314/car/5977057/m_1733812795.134.jpg'),
    (2, 'https://s.bonbanh.com/uploads/users/67314/car/5977057/m_1733812796.521.jpg'),
    (2, 'https://s.bonbanh.com/uploads/users/67314/car/5977057/m_1733812794.881.jpg'),
    (2, 'https://s.bonbanh.com/uploads/users/67314/car/5977057/m_1733812793.272.jpg'),

-- Ảnh cho cID = 3
    (3, 'https://s.bonbanh.com/uploads/users/754708/car/6120194/m_1741313521.464.jpg'),
    (3, 'https://s.bonbanh.com/uploads/users/754708/car/6120194/m_1741313522.400.jpg'),
    (3, 'https://s.bonbanh.com/uploads/users/754708/car/6120194/m_1741313523.732.jpg'),
    (3, 'https://s.bonbanh.com/uploads/users/754708/car/6120194/m_1741313524.652.jpg'),
    (3, 'https://s.bonbanh.com/uploads/users/754708/car/6120194/m_1741313525.593.jpg'),
    (3, 'https://s.bonbanh.com/uploads/users/754708/car/6120194/m_1741313526.561.jpg'),

-- Ảnh cho cID = 4
    (4, 'https://s.bonbanh.com/uploads/users/676778/car/6068962/m_1738831676.554.jpg'),
    (4, 'https://s.bonbanh.com/uploads/users/676778/car/6068962/m_1738831680.349.jpg'),
    (4, 'https://s.bonbanh.com/uploads/users/676778/car/6068962/m_1738831677.858.jpg'),
    (4, 'https://s.bonbanh.com/uploads/users/676778/car/6068962/m_1738831680.148.jpg'),
    (4, 'https://s.bonbanh.com/uploads/users/676778/car/6068962/m_1738831677.268.jpg'),

-- Ảnh cho cID = 5
    (5, 'https://s.bonbanh.com/uploads/users/807382/car/6102563/m_1740474385.702.jpg'),
    (5, 'https://s.bonbanh.com/uploads/users/807382/car/6102563/m_1740474387.851.jpg'),
    (5, 'https://s.bonbanh.com/uploads/users/807382/car/6102563/m_1740474389.466.jpg'),
    (5, 'https://s.bonbanh.com/uploads/users/807382/car/6102563/m_1740474390.579.jpg'),

-- Ảnh cho cID = 6
    (6, 'https://s.bonbanh.com/uploads/users/543668/car/6088235/m_1739783216.859.jpg'),
    (6, 'https://s.bonbanh.com/uploads/users/543668/car/6088235/m_1739783217.464.jpg'),
    (6, 'https://s.bonbanh.com/uploads/users/543668/car/6088235/m_1739783218.881.jpg'),
    (6, 'https://s.bonbanh.com/uploads/users/543668/car/6088235/m_1739783219.617.jpg'),
    (6, 'https://s.bonbanh.com/uploads/users/543668/car/6088235/m_1739783219.965.jpg'),

-- Ảnh cho cID = 7
    (7, 'https://s.bonbanh.com/uploads/users/807379/car/6102777/m_1740478069.105.jpg'),
    (7, 'https://s.bonbanh.com/uploads/users/807379/car/6102777/m_1740478070.567.jpg'),
    (7, 'https://s.bonbanh.com/uploads/users/807379/car/6102777/m_1740478070.627.jpg'),

-- Ảnh cho cID = 8
	(8, 'https://s.bonbanh.com/uploads/users/547806/car/6063026/m_1738481647.571.jpg'),
    (8, 'https://s.bonbanh.com/uploads/users/547806/car/6063026/m_1738481665.468.jpg'),
    (8, 'https://s.bonbanh.com/uploads/users/547806/car/6063026/m_1738481670.178.jpg'),

-- Ảnh cho cID = 9
    (9, 'https://s.bonbanh.com/uploads/users/231383/car/5982477/m_1734058073.479.jpg'),
    (9, 'https://s.bonbanh.com/uploads/users/231383/car/5982477/m_1734058071.195.jpg'),
    (9, 'https://s.bonbanh.com/uploads/users/231383/car/5982477/m_1734058074.647.jpg'),
    (9, 'https://s.bonbanh.com/uploads/users/231383/car/5982477/m_1734058070.601.jpg'),

-- Ảnh cho cID = 10
    (10, 'https://s.bonbanh.com/uploads/users/738413/car/5826821/m_1726545017.163.jpg'),
    (10, 'https://s.bonbanh.com/uploads/users/738413/car/5826821/m_1726545021.332.jpg')

