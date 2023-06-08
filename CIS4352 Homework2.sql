-- Question 1
CREATE TABLE Employee(
EmpID INT NOT NULL,
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Address NVARCHAR(60) NOT NULL,
City NVARCHAR(30) NOT NULL,
State CHAR(5) NOT NULL,
Zip VARCHAR(5) NULL,
PayRate DECIMAL(19,4) NOT NULL,
PRIMARY KEY (EmpID)
);

-- Question 2
CREATE TABLE Department(
DeptID INT NOT NULL,
DeptName NVARCHAR(50) NOT NULL,
Building NVARCHAR(50) NOT  NULL,
Supervisor NVARCHAR(50) NOT NULL,
SupervisorID INT NOT NULL,
PRIMARY KEY (DeptID)
);

-- Question 3
ALTER TABLE Employee
ADD DeptID INT NOT NULL,
FOREIGN KEY (DeptID) REFERENCES Department(DeptID);

-- Question 4
ALTER TABLE Employee
ADD PayRaise AS (PayRate * 0.03);

-- Question 5
INSERT INTO Employee
(FirstName, LastName, Address, City, State, Zip, PayRate, DeptID)
VALUES ('John', 'Doe', '123 Any Street', 'Any Town', 'TX', '76549', 8.75, 12),
('Jane', 'Doe', '666 Devil''s Way', 'Diablo', 'NM', '12345', 6.66, 12),
('Sally', 'Green', '345 North St', 'Killeen', 'TX', '76544', 22.34, 13),
('Bob', 'Smith', '567 South St', 'Killeen', 'TX', '', 14.00, 13);

-- Question 6
INSERT INTO Department
(DeptName, Building, Supervisor, SupervisorID)
VALUES ('Sales', 'Main', 'Bob Jones', 1004),
('Engineering', 'South', 'Kali Smith', 1005),
('Admin', 'Main', 'Bob Roberts', 1006),
('Finance', 'South', 'Ebenezer Scrooge', 1007);

-- Question 7
SELECT Department.Supervisor, Department.DeptName, Department.DeptID, Employee.PayRate
FROM Department
INNER JOIN Employee
ON Department.DeptID = Employee.DeptID;

-- Question 8
SELECT Department.DeptName, MIN (Employee.PayRate) AS MinPayRate
FROM Employee
INNER JOIN Department
ON Employee.DeptID = Department.DeptID
GROUP BY Department.DeptName;
