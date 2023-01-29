SELECT Shippers.CompanyName, Orders.ShipCity, 
	CASE
		WHEN COUNT(*) BETWEEN 1 AND 4 THEN '1 - 4'
		WHEN COUNT(*) BETWEEN 5 AND 8 THEN '5 - 8'
		WHEN COUNT(*) BETWEEN 9 AND 12 THEN '9 - 12'
		WHEN COUNT(*) BETWEEN 13 AND 16 THEN '13 - 16'
	END AS Range,
	COUNT(*) AS Count
FROM Shippers
JOIN Orders ON Orders.ShipVia = Shippers.ShipperID
GROUP BY Shippers.ShipperID, Orders.ShipCity, Shippers.CompanyName
ORDER BY Shippers.ShipperID ASC, Count DESC