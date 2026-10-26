--Display total number of contracts and total of NINs that have contracts:
SELECT
COUNT (DISTINCT NIN) AS NIN,
COUNT (Contract_id) AS ContractId
FROM
dbc.EmployeeContract;


--List Employees with only one contract or less in DESCEDING ORDER
SELECT 
NIN,
COUNT (e.NIN) AS AmountOfContracts
FROM dbc.EmployeeContract ec
GROUP BY ec.NIN
HAVING COUNT(ec.NIN)<=1
ORDER BY COUNT(ec.NIN) DESC;

--List Employees who have more than 1 contract- in descending order
SELECT 
NIN,
COUNT(ec.NIN) AS AmountOfContracts
FROM dbc.EmployeeContract ec
GROUP BY ec.NIN
HAVING COUNT(ec.NIN)>1
ORDER BY COUNT(ec.NIN) DESC);
