-- Create tables
CREATE TABLE CUSTOMER (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);

CREATE TABLE PRODUCT (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(50),
    Price DECIMAL(10, 2),
    Category VARCHAR(20),
    CONSTRAINT CHK_Price CHECK (Price >= 0)
);

CREATE TABLE ORDERS (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    OrderDate DATE DEFAULT SYSDATE,
    CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    CONSTRAINT FK_Product FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID),
    CONSTRAINT CHK_Quantity CHECK (Quantity > 0)
);

-- Add column Category to the PRODUCT table
ALTER TABLE PRODUCT
ADD Category VARCHAR(20);

-- Add column OrderDate to the ORDERS table with default value SYSDATE
ALTER TABLE ORDERS
ADD OrderDate DATE DEFAULT SYSDATE;
