CREATE SCHEMA dbc;

GO

--Create tables

CREATE TABLE dbc.Employee(
Employee_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
NIN varchar(9) NOT NULL UNIQUE,
First_Name varchar (255) NOT NULL,
Last_Name varchar(255) NOT NULL,
DOB date NOT NULL,
Email varchar(255) NOT NULL,
Start_Date date NOT NULL,
End_Date date NOT NULL,
Status INT NOT NULL,
);


CREATE TABLE dbc.Company (
Company_id INT IDENTITY(1,1) Primary Key NOT NULL,
Company_Name varchar(255) NOT NULL,
Company_Address varchar(255) NOT NULL,
Country varchar(255) NOT NULL,
Status INT NOT NULL,
);


CREATE TABLE dbc.Department(
Dep_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Company_id INT NOT NULL,
Department_name VARCHAR(255) NOT NULL,
Region VARCHAR(255),
Status INT NOT NULL,
CONSTRAINT Department_fk FOREIGN KEY (Company_id) REFERENCES dbc.Company(Company_id)
ON UPDATE CASCADE
);

CREATE TABLE dbc.Contract (
Contract_id INT IDENTITY(1,1) Primary Key NOT NULL,
Dep_id INT Not NULL,
Contract_StartDate Date,
Contract_EndDate Date,
Contract_Type varchar(255),
Status INT NOT NULL,
CONSTRAINT dep_id_fk FOREIGN KEY (Dep_id) REFERENCES dbc.Department(Dep_id)
ON UPDATE CASCADE, 
);

CREATE TABLE dbc.EmployeeContract(
Employee_id INT NOT NULL,
Contract_id INT NOT NULL,
NIN varchar(9) NOT NULL UNIQUE,
Contract_Hours INT NOT NULL,
Hourly_Rate numeric(7,2) NOT NULL,
CONSTRAINT employeeid_fk FOREIGN KEY (Employee_id) REFERENCES dbc.Employee(Employee_id)
ON UPDATE CASCADE,
CONSTRAINT employeeContract_fk FOREIGN KEY (Contract_id) REFERENCES dbc.Contract (Contract_id)
ON UPDATE CASCADE,
CONSTRAINT PK_Employeecontract PRIMARY KEY (Employee_id, Contract_id)
);


CREATE TABLE dbc.Timesheet(
ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Employee_id INT NOT NULL,
NIN varchar(9) NOT NULL,
Contract_id INT NOT NULL,
Date DATE not null,
Hours Numeric(7,2) NOT NULL,
Submission INT NOT NULL,
CONSTRAINT contractId_fk FOREIGN KEY (Contract_id) REFERENCES dbc.Contract(Contract_id)
ON UPDATE CASCADE,
CONSTRAINT timesheetEmployeeId_fk FOREIGN KEY (Employee_id) REFERENCES dbc.Employee(Employee_id)
);

