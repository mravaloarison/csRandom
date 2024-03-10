CREATE TABLE Shipping_Companies ( 
  shipping_id VARCHAR2(10) PRIMARY KEY, 
  company_name VARCHAR2(100) NOT NULL, 
  phone_number VARCHAR2(20), 
  address VARCHAR2(100) 
)


CREATE TABLE Sales ( 
  sale_id NUMBER PRIMARY KEY, 
  car_id NUMBER NOT NULL, 
  customer_id VARCHAR2(10) NOT NULL, 
  sale_date DATE, 
  salesperson_id VARCHAR2(10) REFERENCES Employees(employee_id),
  price NUMBER(10,2), 
  CONSTRAINT fk_sale_car FOREIGN KEY (car_id) REFERENCES Cars(car_id), 
  CONSTRAINT fk_sale_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) 
)


CREATE TABLE Features ( 
  feature_id NUMBER PRIMARY KEY, 
  feature_name VARCHAR2(50) NOT NULL 
)


CREATE TABLE Customer_Preferences ( 
  customer_id VARCHAR2(10) NOT NULL, 
  feature_id NUMBER NOT NULL, 
  CONSTRAINT fk_customer_pref_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id), 
  CONSTRAINT fk_customer_pref_feature FOREIGN KEY (feature_id) REFERENCES Features(feature_id), 
  CONSTRAINT pk_customer_pref PRIMARY KEY (customer_id, feature_id) 
)


CREATE TABLE Cars ( 
  car_id NUMBER PRIMARY KEY, 
  model_id NUMBER NOT NULL, 
  year NUMBER(4) CHECK (year >= 2000), -- Ensures year is 2000 or later 
  color VARCHAR2(20), 
  transmission VARCHAR2(10), 
  engine_type VARCHAR2(20), 
  CONSTRAINT fk_car_model FOREIGN KEY (model_id) REFERENCES Models(model_id) 
)


CREATE TABLE Models ( 
  model_id NUMBER PRIMARY KEY, 
  maker_id NUMBER NOT NULL, 
  model_name VARCHAR2(50) NOT NULL, 
  CONSTRAINT fk_model_maker FOREIGN KEY (maker_id) REFERENCES Car_Makers(maker_id) 
)


CREATE TABLE Car_Makers ( 
  maker_id NUMBER PRIMARY KEY, 
  maker_name VARCHAR2(50) NOT NULL 
)

CREATE TABLE Employees ( 
  employee_id VARCHAR2(10) PRIMARY KEY,  
  first_name VARCHAR2(50) NOT NULL, 
  last_name VARCHAR2(50) NOT NULL, 
  email VARCHAR2(100) UNIQUE, 
  role VARCHAR2(50) 
)


CREATE TABLE Customers ( 
  customer_id VARCHAR2(10) PRIMARY KEY, 
  first_name VARCHAR2(50) NOT NULL, 
  last_name VARCHAR2(50) NOT NULL, 
  address VARCHAR2(100), 
  email VARCHAR2(100) UNIQUE, 
  phone_number VARCHAR2(20) 
)


-- FILLING DB
INSERT INTO Sales (sale_id, car_id, customer_id, sale_date, salesperson_id, price) 
VALUES (2, 3, 'CUST002', SYSDATE, NULL, 32000.50)
1 row(s) inserted.
Statement 64
INSERT INTO Sales (sale_id, car_id, customer_id, sale_date, salesperson_id, price) 
VALUES (1, 1, 'CUST001', SYSDATE, 'EMP002', 25000.00)
1 row(s) inserted.
Statement 63
INSERT INTO Employees (employee_id, first_name, last_name, email, role) 
VALUES ('EMP003', 'Service', 'Johnson', 'service.johnson@company.com', 'Service Representative')
1 row(s) inserted.
Statement 62
INSERT INTO Employees (employee_id, first_name, last_name, email, role) 
VALUES ('EMP002', 'Sales', 'Smith', 'sales.smith@company.com', 'Salesperson')
1 row(s) inserted.
Statement 61
INSERT INTO Employees (employee_id, first_name, last_name, email, role) 
VALUES ('EMP001', 'Manager', 'Jones', 'manager.jones@company.com', 'Manager')
1 row(s) inserted.
Statement 60
INSERT INTO Customers (customer_id, first_name, last_name, address, email, phone_number) 
VALUES ('CUST003', 'Customer', 'Three', '789 Oak Ln, Smalltown, TX 54321', 'customer.three@example.com', '+1 (777) 777-9012')
1 row(s) inserted.
Statement 59
INSERT INTO Customers (customer_id, first_name, last_name, address, email, phone_number) 
VALUES ('CUST002', 'Customer', 'Two', '456 Elm St, Big City, NY 98765', 'customer.two@example.com', '+1 (888) 888-5678')
1 row(s) inserted.
Statement 58
INSERT INTO Customers (customer_id, first_name, last_name, address, email, phone_number) 
VALUES ('CUST001', 'Customer', 'One', '123 Main St, Anytown, CA 12345', 'customer.one@example.com', '+1 (555) 555-1234')
1 row(s) inserted.
Statement 57
INSERT INTO Cars (car_id, model_id, year, color, transmission, engine_type) 
VALUES (5, 5, 2020, 'Blue', 'Automatic', '2.0L Turbo I4')
1 row(s) inserted.
Statement 56
INSERT INTO Cars (car_id, model_id, year, color, transmission, engine_type) 
VALUES (4, 4, 2021, 'White', 'Automatic', '5.3L V8')
1 row(s) inserted.
Statement 55
INSERT INTO Cars (car_id, model_id, year, color, transmission, engine_type) 
VALUES (3, 3, 2024, 'Red', 'Automatic', '3.5L V6')
1 row(s) inserted.
Statement 54
INSERT INTO Cars (car_id, model_id, year, color, transmission, engine_type) 
VALUES (2, 2, 2022, 'Black', 'Automatic', '2.0L I4')
1 row(s) inserted.
Statement 53
INSERT INTO Cars (car_id, model_id, year, color, transmission, engine_type) 
VALUES (1, 1, 2023, 'Silver', 'Automatic', '2.5L I4')
1 row(s) inserted.
Statement 52
INSERT INTO Models (model_id, maker_id, model_name) 
VALUES (5, 5, 'X3')
1 row(s) inserted.
Statement 51
INSERT INTO Models (model_id, maker_id, model_name) 
VALUES (4, 4, 'Silverado')
1 row(s) inserted.
Statement 50
INSERT INTO Models (model_id, maker_id, model_name) 
VALUES (3, 3, 'F-150')
1 row(s) inserted.
Statement 49
INSERT INTO Models (model_id, maker_id, model_name) 
VALUES (2, 2, 'Accord')
1 row(s) inserted.
Statement 48
INSERT INTO Models (model_id, maker_id, model_name) 
VALUES (1, 1, 'Camry')
1 row(s) inserted.
Statement 47
INSERT INTO Car_Makers (maker_id, maker_name) 
VALUES (5, 'BMW')
1 row(s) inserted.
Statement 46
INSERT INTO Car_Makers (maker_id, maker_name) 
VALUES (4, 'Chevrolet')
1 row(s) inserted.
Statement 45
INSERT INTO Car_Makers (maker_id, maker_name) 
VALUES (3, 'Ford')
1 row(s) inserted.
Statement 44
INSERT INTO Car_Makers (maker_id, maker_name) 
VALUES (2, 'Honda')
1 row(s) inserted.
Statement 43
INSERT INTO Car_Makers (maker_id, maker_name) 
VALUES (1, 'Toyota')
INSERT INTO Features (feature_id, feature_name) 
VALUES (3, 'Navigation System')
1 row(s) inserted.
Statement 34
INSERT INTO Features (feature_id, feature_name) 
VALUES (2, 'Leather Seats')
1 row(s) inserted.
Statement 33
INSERT INTO Features (feature_id, feature_name) 
VALUES (1, 'Sunroof')
1 row(s) inserted.
Statement 32
INSERT INTO Shipping_Companies (shipping_id, company_name, phone_number, address) 
VALUES ('SHP003', 'Fast Track Express', '+1 (777) 777-9012', '200 Delivery Rd, Smalltown, TX 54321')
1 row(s) inserted.
Statement 31
INSERT INTO Shipping_Companies (shipping_id, company_name, phone_number, address) 
VALUES ('SHP002', 'Global Couriers', '+1 (888) 888-5678', '100 Shipping Lane, Big City, NY 98765')
1 row(s) inserted.
Statement 30
INSERT INTO Shipping_Companies (shipping_id, company_name, phone_number, address) 
VALUES ('SHP001', 'Acme Delivery Services', '+1 (555) 555-1234', '1 Main St, Anytown, CA 12345')
1 row(s) inserted.
