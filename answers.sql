-- answers.sql

-- Question 1: Achieving 1NF (First Normal Form) 🛠️
-- The original table has a multi-valued column (Products), which violates 1NF.
-- We transform the data so each product is in a separate row.

-- Step 1: Create a new normalized table
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Step 2: Insert individual product rows (assuming manual transformation from comma-separated values)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Question 2: Achieving 2NF (Second Normal Form) 🧩
-- The original table has a partial dependency (CustomerName depends only on OrderID).
-- We split the table into two: one for orders (OrderID → CustomerName), and one for order items (OrderID + Product → Quantity)

-- Step 1: Create a new Orders table with OrderID as primary key
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Create a new OrderItems table with a composite primary key (OrderID, Product)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 3: Insert data into Orders
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 4: Insert data into OrderItems
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
