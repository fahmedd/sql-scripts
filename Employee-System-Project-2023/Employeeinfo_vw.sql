CREATE VIEW dbc.Employeeinfo_vw
AS 
SELECT
e.NIN,
e.First_Name AS FirstName,
e.Last_Name AS LastName,
e.DOB,
e.Email,
e.Start_Date AS StartDate,
ec.Contract_Hours As ContractHours,
ct.Hourly_Rate AS HourlyRate,
c.Company_Name AS CompanyName,
c.Company_Address AS Address
FROM dbc.Employee e
LEFT JOIN
dbc.EmployeeContract ec
ON 
e.NIN= ec.NIN
LEFT JOIN 
dbc.ContractType ct
ON 
ec.Contract_id= ct.Contract_id
LEFT JOIN
dbc.Company c
ON 
ct.Company_id = c.Company_id;