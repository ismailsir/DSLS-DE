SELECT 
	Employees.FirstName, 
	Employees.Title,
	Employees.Country,
	Orders.OrderDate,
	Orders.ShipCountry,
	COUNT(*) AS Count
FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID 
WHERE YEAR(Orders.OrderDate) = 1997
GROUP BY Employees.FirstName, Employees.Title,Employees.Country, Orders.OrderDate, Orders.ShipCountry
ORDER BY Count DESC
