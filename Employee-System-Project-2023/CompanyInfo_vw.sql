CREATE VIEW dbc.CompanyInfo_vw
AS 
SELECT 
c.Company_id,
c.Company_Name,
c.Company_Address,
COUNT(ct.Company_id) AS NumberOfContracts
FROM
dbc.ContractType ct 
LEFT JOIN
dbc.Company c
ON
c.Company_id = ct.Company_id
GROUP BY c.Company_id,
c.Company_Name,
c.Company_Address;