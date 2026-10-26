--Delete Employee:
CREATE PROCEDURE Delete_Employee(
@NIN VARCHAR(7)
)
AS BEGIN
DELETE dbc.EmployeeContract 
FROM dbc.EmployeeContract ec
WHERE ec.NIN=@NIN;

DELETE dbc.Employee
FROM dbc.Employee e
WHERE e.NIN=@NIN;

END 
GO

--Delete Company:
CREATE PROCEDURE Delete_Company(
@CompanyId VARCHAR(5)
)
AS
BEGIN
DELETE dbc.ContractType 
FROM dbc.ContractType ct
WHERE ct.Company_id=@Companyid;

DELETE dbc.Company
FROM dbc.Company c
WHERE c.Company_id=@CompanyId;

END 
GO


--Delete Contract:
CREATE PROCEDURE Delete_Contract(
@ContractId varchar(6)
)
AS BEGIN
DELETE dbc.EmployeeContract 
FROM dbc.EmployeeContract ec
WHERE ec.Contract_id=@ContractId;

DELETE dbc.ContractType 
FROM dbc.ContractType ct
WHERE ct.Contract_id=@ContractId;

END GO
