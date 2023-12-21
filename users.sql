-- Single User (Employee/Company)
CREATE USER 'singleuser'@'%' IDENTIFIED BY 'password123';
GRANT CREATE, SELECT ON student.* TO 'singleuser'@'%';

-- Employee
CREATE USER 'employeeuser'@'%' IDENTIFIED BY 'password456';
GRANT CREATE, SELECT, INSERT ON student.* TO 'employeeuser'@'%';

-- Company
CREATE USER 'companyuser'@'%' IDENTIFIED BY 'password789';
GRANT CREATE, SELECT, INSERT ON student.* TO 'companyuser'@'%';

-- Admin
CREATE USER 'adminuser'@'localhost' IDENTIFIED BY 'adminpassword';
GRANT CREATE, DROP, ALTER ON student.* TO 'adminuser'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON student.* TO 'adminuser'@'localhost';