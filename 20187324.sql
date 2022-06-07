--1. Hiển thị chi tiết của tất cả mọi người từ bảng Person.Person
Select* From Person.Person
--2. Hiển thị Title, FirstName, MiddleName, LastName và EmailAddress từ bảng 
--Person.Contact 
Select Title, FirstName, MiddleName, LastName
From Person.Person
--3. Hiển thị Title, FirstName, LastName như là một chuỗi nối nhằm dễ đọc và cung 
--cấp tiêu đề cho cột tên (PersonName). 
Select CONCAT(Title,FirstName,MiddleName) as PersonName From Person.Person
--4. Hiển thị chi tiết địa chỉ của tất cả các nhân viên trong bảng Person.Address 
Select *From Person.Address
Select distinct City from Person.Address
Select * into cityindex from Person.Address--Tạo bảng mới có tên cityindex

CREATE INDEX idcityindex ON cityindex(City)--đánh chỉ số index cho trường city
--5. Liệt kê tên của các thành phố từ bảng Person.Address và bỏ đi phần lặp lại.
SELECT DISTINCT City FROM Person.Address
--6. Hiển thị chi tiết của 10 bảng ghi đầu tiên của bảng Person.Address. 
SELECT TOP 10 * FROM Person.Address
--7.Hiển thị trung bình của tỷ giá (Rate) từ bảng HumanResources.EmployeePayHistory. 
SELECT AVG(Rate) FROM HumanResources.EmployeePayHistory
--8. Hiển thị tổng số nhân viên từ bảng HumanResources.Employee 
SELECT sum(BusinessEntityID)
FROM HumanResources.Employee.
--9. Đưa ra danh sách các khách hàng có trên 10 đơn hàng
SELECT COUNT(*) AS CountOfOrders, FirstName, MiddleName, LastName 
FROM Person.Person AS P 
INNER JOIN Sales.Customer AS C ON P.BusinessEntityID = C.PersonID 
INNER JOIN Sales.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID 
GROUP BY FirstName, MiddleName, LastName
WHERE CountOfOrders > 10;

--10.Đưa ra danh sách các mặt hàng chưa từng được đặt hàngSELECT ProductID, Name 
FROM Production.Product 
WHERE ProductID NOT IN ( 
 SELECT ProductID FROM Sales.SalesOrderDetail 
 WHERE ProductID IS NOT NULL);
--11
--Câu 4 tạo bảng mới có tên cityindex gồm các trường dữ liệu của bảng Person.Address,sau đó tạo chỉ mục có tên idcityindex trên trường City
--Câu lệnh thứ 1 chiếm 82% tổng chi phí trong khi câu lệnh sử dụng index chỉ chiếm 18% chi phí,nhanh gấp 4,5 lần
