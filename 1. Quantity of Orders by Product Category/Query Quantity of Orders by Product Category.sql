SELECT   
	Categories.CategoryName,
	Products.ProductName,
	Orders.OrderDate,
	Customers.CompanyName,
	[Order Details].Quantity as Quantity,
	Count(*) as count
FROM Categories
	JOIN Products ON Products.CategoryID = Categories.CategoryID
	JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
	JOIN Orders ON [Order Details].OrderID = Orders.OrderID
	JOIN Customers ON Orders.CustomerID = Customers.CustomerID
	WHERE Categories.CategoryID IN (1, 4, 3, 8, 2)
		AND (YEAR(Orders.OrderDate) != 1998 OR MONTH(Orders.OrderDate) != 5) 
		AND (YEAR(Orders.OrderDate) != 1996 OR MONTH(Orders.OrderDate) != 7)
	GROUP BY 	Categories.CategoryName,
	Products.ProductName,
	Orders.OrderDate,
	Customers.CompanyName,
	[Order Details].Quantity
	ORDER BY Orders.OrderDate ASC