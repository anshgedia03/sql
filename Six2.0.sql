use TECH_COM

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(10, 'HR'),
(20, 'IT'),
(40, 'Finance');

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(30, 'Marketing'),
(50, 'Operations'),
(60, 'Support');


SELECT * from departments

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    DepartmentID INT

);
DROP table Employee

INSERT INTO Employee (EmployeeID, name, DepartmentID) VALUES
(1, 'Alice', 10),
(2, 'Bob', 20),
(3, 'Charlie', 30),
(4, 'David', NULL);

INSERT INTO Employee (EmployeeID, Name, DepartmentID) VALUES
(5, 'Evelyn', 10),
(6, 'Frank', 20),
(7, 'Grace', 30),
(8, 'Henry', 30),
(9, 'Isha', 50),
(10, 'Jay', NULL),
(11, 'Karan', 20),
(12, 'Meera', 60);



SELECT * from Employee


SELECT e.name , d.DepartmentName from employee e
    JOIN departments d on e.departmentId = d.DepartmentID



SELECT temp.depart_name ,count(temp.depart_name) 
    from (SELECT e.name , d.DepartmentName as depart_name from employee e
            JOIN departments d on e.departmentId = d.DepartmentID) as temp
    GROUP BY temp.depart_name