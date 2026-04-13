CREATE DATABASE GameForge;

Use GameForge;

-- Customer Table
Create Table Customer(
	CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    DateRegistered DATE,
    BirthDate DATE,
    PhoneNo VARCHAR(20),
    Email VARCHAR(100),
    Name VARCHAR(100) NOT NULL,
    Password VARCHAR(100)
);

-- Employee Table
CREATE Table Employee(
	EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Password VARCHAR(100),
    HireDate DATE,
    Name VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(20),
    Email VARCHAR(100)
);

-- Game Table
CREATE Table Game(
	GameID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(150),
    Description TEXT,
    Price DECIMAL(10, 2),
    ReleaseDate DATE,
    IsDigital BOOLEAN,
    Genre VARCHAR(100),
    Image VARCHAR(200),
    DeveloperConsole VARCHAR(100)
);

-- Order Table
CREATE Table Orders(
	OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    OrderStatus VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- OrderItem Table
CREATE Table OrderItem(
	OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    GameID INT NOT NULL,
    PriceAtPurchase DECIMAL(10, 2),
    Quantity INT,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID)
);

-- Payment Table
CREATE Table Payment(
	PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    PaymentMethod VARCHAR(50),
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentStatus VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- GameCode Table 
CREATE Table GameCode(
	CodeID INT AUTO_INCREMENT PRIMARY KEY,
    GameID INT NOT NULL,
    OrderItemID INT NOT NULL,
    CodeValue VARCHAR(100),
    IsRedeem BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (GameID) REFERENCES Game(GameID),
	FOREIGN KEY (OrderItemID) REFERENCES OrderItem (OrderItemID)
);

-- Refund Table
CREATE Table Refund(
	RefundID INT AUTO_INCREMENT PRIMARY KEY,
    OrderItemID INT NOT NULL,
    EmployeeID INT NOT NULL,
    RefundReason TEXT,
    RefundStatus VARCHAR(50),
    RefundDate DATE,
    FOREIGN KEY (OrderItemID) REFERENCES OrderItem (OrderItemID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID)
);

INSERT INTO Customer (DateRegistered, BirthDate, PhoneNo, Email, Name, Password)
VALUES
('2024-01-10','2000-05-15','555-1111','Scarbro@gmail.com','James Summer','C123'),
('2024-02-20','2006-09-12','473-4482','Singh@gmail.com','Daria Singh','C456'),
('2024-03-05','2005-12-01','483-0482','Charming@gmail.com','Chad Charming','C789');

INSERT INTO Employee (Password, HireDate, Name, ContactNumber, Email)
VALUES
('E123','2023-01-15','Sarah Lance','863-4742','Sarah@gmail.com'),
('E456','2023-06-10','Lois Hamilton','086-6431','Hamilton@gmail.com'),
('Endg@me3000','2023-06-10','Grannum john','086-0431','spider-man@gmail.com');


INSERT INTO Game (Title, Description, Price, ReleaseDate, IsDigital, Genre, Image, DeveloperConsole)
VALUES
('Resident Evil: Requiem', 'Survival horror game', 69.99, '2026-02-27', TRUE, 'Horror', 'resident_evil_requiem.jpg', 'PC'),
('Spider-Man 2', 'Action Story game', 69.99, '2026-02-27', TRUE, 'Action', 'Spider-Man2.jpg', 'PC'),
('GhostRunner', 'speedrunner hack&slash game', 69.99, '2026-02-27', TRUE, 'Action-Adventure', 'Ghostrunner.jpg', 'PC'),
('Inside', 'Puzzle horror game', 69.99, '2026-02-27', TRUE, 'Horror', 'Inside.png', 'PC'),
('God of War: Ragnarok', 'Action-adventure game', 30.00, '2022-11-11', TRUE, 'Action-Adventure', 'GodofWar.jpg', 'PlayStation'),
('Forza Horizon 6', 'Open-world racing game', 79.99, '2026-03-19', TRUE, 'Racing', 'forza_horizon_6.jpg', 'Xbox');

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, OrderStatus)
VALUES
(1,'2024-04-01',30.00,'Completed'),
(2,'2026-03-03',69.99,'Completed'),
(3,'2026-03-19',79.99,'Processing');

INSERT INTO OrderItem (OrderID, GameID, PriceAtPurchase, Quantity)
VALUES
(1, 1, 30.00, 1),  
(2, 2, 69.99, 1),   
(3, 3, 79.99, 1);   

INSERT INTO Payment (OrderID, PaymentMethod, PaymentDate, Amount, PaymentStatus)
VALUES
(1,'Credit Card','2024-04-01',30.00,'Paid'),
(2,'Debit Card','2026-03-03',69.99,'Paid'),
(3,'PayPal','2026-03-19',79.99,'Pending');

INSERT INTO GameCode (GameID, OrderItemID, CodeValue, IsRedeem)
VALUES
(1, 1, 'GOWR-123ABC', FALSE),
(2, 2, 'REQUIEM-456DEF', FALSE),
(3, 3, 'FORZA6-789GHI', FALSE);

INSERT INTO Refund (OrderItemID, EmployeeID, RefundStatus, RefundDate)
VALUES
(1, 1, 'Approved', '2024-04-02'),      
(2, 2, 'Pending', '2026-03-03'),       
(3, 1, 'Approved', '2026-03-22');      

-- 1. View all customers
SELECT * FROM Customer;

-- 2. View all employees
SELECT * FROM Employee;

-- 3. View all games
SELECT * FROM Game;

-- 4. View all orders with customer details
SELECT o.OrderID, c.Name AS CustomerName, o.OrderDate, o.TotalAmount, o.OrderStatus
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID;

-- 5. View all order items with game details
SELECT oi.OrderItemID, o.OrderID, g.Title AS GameTitle, oi.PriceAtPurchase, oi.Quantity
FROM OrderItem oi
JOIN Orders o ON oi.OrderID = o.OrderID
JOIN Game g ON oi.GameID = g.GameID;

-- 6. View all payments with order and customer details
SELECT p.PaymentID, o.OrderID, c.Name AS CustomerName, p.PaymentMethod, p.Amount, p.PaymentStatus
FROM Payment p
JOIN Orders o ON p.OrderID = o.OrderID
JOIN Customer c ON o.CustomerID = c.CustomerID;

-- 7. View all game codes with order items and game titles
SELECT gc.CodeID, g.Title AS GameTitle, gc.CodeValue, gc.IsRedeem, oi.OrderID
FROM GameCode gc
JOIN Game g ON gc.GameID = g.GameID
JOIN OrderItem oi ON gc.OrderItemID = oi.OrderItemID;

-- 8. View all refunds with employee, order, and game details
SELECT r.RefundID, e.Name AS EmployeeName, g.Title AS GameTitle, r.RefundStatus, r.RefundDate
FROM Refund r
JOIN Employee e ON r.EmployeeID = e.EmployeeID
JOIN OrderItem oi ON r.OrderItemID = oi.OrderItemID
JOIN Game g ON oi.GameID = g.GameID;

-- 9. Total sales per game
SELECT g.Title, SUM(oi.PriceAtPurchase * oi.Quantity) AS TotalSales
FROM OrderItem oi
JOIN Game g ON oi.GameID = g.GameID
GROUP BY g.Title;

-- 10. Orders pending payment
SELECT o.OrderID, c.Name AS CustomerName, p.PaymentStatus, o.TotalAmount
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN Payment p ON o.OrderID = p.OrderID
WHERE p.PaymentStatus != 'Paid';





