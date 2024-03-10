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
