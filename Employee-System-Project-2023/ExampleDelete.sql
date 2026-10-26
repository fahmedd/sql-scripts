-ExampleDelete 
DELETE dbc.EmployeeContract
FROM dbc.EmployeeContract ec
JOIN
dbc.ContractType ct
ON 
ec.Contract_id = ct.Contract_id
WHERE ct.Contract_id LIKE 'SC2845';