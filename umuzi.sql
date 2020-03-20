CREATE SCHEMA information;
CREATE TABLE "information".Customers(
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR,
    Address VARCHAR(200),
    Phone INT,
    Email VARCHAR(100),
    City VARCHAR(20),
    Country VARCHAR(50)
);
CREATE TABLE "information".Employees(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    JobTitle VARCHAR(20)
);
CREATE TABLE "information".Orders(
    OrderID INT PRIMARY KEY,
    ProductID INT, 
    PaymentID INT,
    FulfilledByEmployeeID INT,
    DateRequired DATE,
    DateShipped DATE,
    Status VARCHAR(20)
);
CREATE TABLE "information".Payments(
    PaymentID INT PRIMARY KEY,
    CustomerID INT,
    PaymentDate DATE,
    Amount DECIMAL
);
CREATE TABLE "information".Products(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description VARCHAR(300),
    BuyPrice DECIMAL
);
INSERT INTO Customers VALUES (1, 'John', 'Hilbert', 'Male', '284 chaucer st', 084789651, 'john@gmail.com','Johannesburg', 'South Africa');
INSERT INTO Customers VALUES (2, 'Thando', 'Sithole', 'Female', '240 Sect 1', 0794445584, 'thando@gmail.com', 'Cape Town', 'South Africa' );
INSERT INTO Customers VALUES (3, 'Leon', 'Glen', 'Male', '81 Everton Rd, Gillits', 082083830, 'Leon@gmail.com', 'Durban', 'South Africa');
INSERT INTO Customers VALUES (4, 'Charl', 'Muller', 'Male', '290A Dorset Ecke', 0485687255, 'Charl.muller@yahoo.com', 'Berlin', 'Germany');
INSERT INTO Customers VALUES (5, 'Julia', 'Stein', 'Female', '2 Wernerring', 0486724450, 'Js234@yahoo.com', 'Frankfurt', 'Germany');

INSERT INTO "information".Employees VALUES (1, 'Kani', 'Matthew', 'mat@gmail.com', 'Manager');
INSERT INTO "information".Employees VALUES (2, 'Lesly', 'Cronje', 'LesC@gmail.com', 'Clerk');
INSERT INTO "information".Employees VALUES (3, 'Gideon', 'Maduku', 'm@gmail.com', 'Accountant');

INSERT INTO "information".Products VALUES (1, 'Harley Davidson Chopper', 'This replica features working kickstand, front suspension, gear-shift lever', 150.75), 
(2, 'Classic Car', 'Turnable front wheels, steering function', 550.75),
(3, 'Sports car', 'Turnable front wheels, steering function', 700.60);

ALTER TABLE "information".Payments ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

INSERT INTO "information".Payments VALUES (1, 1, '01-09-2018', 150.75), (2,5, '03-09-2018', 150.75), (3, 4, '03-09-2018', 700.60);

ALTER TABLE "information".Orders ADD FOREIGN KEY (ProductID) REFERENCES "information".Products(ProductID);
ALTER TABLE "information".Orders ADD FOREIGN KEY (PaymentID) REFERENCES "information".Payments(PaymentID);
ALTER TABLE "information".Orders ADD FOREIGN KEY (FulfilledByEmployeeID) REFERENCES "information".Employees(EmployeeID);

INSERT INTO "information".Orders (OrderID, ProductID, PaymentID, FulfilledByEmployeeID, DateRequired, Status) VALUES (1, 1, 1, 2, '05-09-2018', 'Not shipped');
INSERT INTO "information".Orders VALUES (2, 1, 2, 2, '04-09-2018', '03-09-2018', 'Shipped'); 
INSERT INTO "information".Orders (OrderID, ProductID, PaymentID, FulfilledByEmployeeID, DateRequired, Status) VALUES (3, 3, 3, 3, '   06-09-2018', 'Not shipped');

1. SELECT * FROM Customers;
2. SELECT FirstName FROM Customers;
3. SELECT FirstName FROM Customers WHERE CustomerID =1;
4. UPDATE Customers SET FirstName = 'Lerato' WHERE CustomerID = 1;
   UPDATE Customers SET LastName = 'Mabitso' WHERE CustomerID = 1;
5. DELETE FROM Customers WHERE CustomerID = 2;
6. SELECT COUNT (DISTINCT Status) FROM "information".Orders;
7. SELECT MAX(Amount) FROM "information".Payments;
8. SELECT * FROM Customers ORDER BY Country;
9. SELECT * FROM "information".Products WHERE BuyPrice BETWEEN 100 AND 600;
10. SELECT * FROM Customers WHERE Country = 'Germany' AND City ='Berlin';
11. SELECT * FROM Customers WHERE City = 'Cape Town' OR City = 'Durban';
12. SELECT * FROM "information".Products WHERE BuyPrice > 500;
13. SELECT SUM(Amount) FROM "information".Payments;
14. SELECT COUNT(Status) FROM "information".Orders WHERE Status = 'Shipped';
15. SELECT AVG(BuyPrice) FROM "information".Products;
16. SELECT * FROM "information".Payments INNER JOIN Customers ON Customers.CustomerID = Payments.PaymentID;
17. SELECT * FROM "information".Products WHERE Description = 'Turnable front wheels, steering function';


