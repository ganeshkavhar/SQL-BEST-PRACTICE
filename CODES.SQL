--Ques.1. Write an SQL query to fetch the EmpId and FullName of all theemployees working under Manager with id – „986‟.
SELECT EMPLOYEE_ID,FULLNAME FROM EMPLOYEES
WHERE MANAGER_ID=986;

--Ques.2. Write an SQL query to fetch the different projects available from the EmployeeSalary table.
SELECT DISTINCT PROJECTS FROM EMPLOYEESALARY;

--Ques.3. Write an SQL query to fetch the count of employees workingin project „P1‟.
SELECT COUNT(*)
FROM EMPLOYEES
WHERE PROJECT_ID='P1';

--Ques.4. Write an SQL query to find the maximum, minimum, and average salary of the employees
SELECT MX(SALARY),MIN(ALARY),AVG(SALARY) FROM EMPLOYEES;

--Ques.5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000
SELECT EMPLOYEE_ID,SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 5000 AND 15000;

--Ques.6. Write an SQL query to fetch those employees who live in Toronto and work under manager with ManagerId – 321.
SELECT * FROM EMPLOYES
WHERE CITY='Toranto'
AND 
MANAGER_ID=321;

--Ques.7. Write an SQL query to fetch all the employees who either live
--in California or work under a manager with ManagerId – 321
SELECT * FROM EMPLOYES
WHERE CITY='California'
OR
MANAGER_ID=321;

--Ques.8. Write an SQL query to fetch all those employees who work on Project other than P1.
SELECT * FROM EMPLOYEES
WHERE PROJECT <> 'P1';

--Ques.9. Write an SQL query to display the total salary of each
--employee adding the Salary with Variable value.
SELECT EMPLOYEE_ID,SALARY+VARIABLE AS TOTSAL
FROM EMPLOYEES;

--Ques.10. Write an SQL query to fetch the employees whose name
--begins with any two characters, followed by a text “hn” and ending
--with any sequence of characters.
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE ('__hn%');

--Ques.11. Write an SQL query to fetch all the EmpIds which are present
--in either of the tables – „EmployeeDetails‟ and „EmployeeSalary‟
SELECT EMPLOYEE_ID FROM TABLE1
UNION
SELECT * FROM TABLE2;

--Ques.12. Write an SQL query to fetch common records between two tables
SELECT * FROM T1
INTERSECT 
SELECT * FROM T2;

--Ques.13. Write an SQL query to fetch records that are present in one table but not in another table
SELECT * FROM TAB
MINUS
SELECT * FROM TAB2;

--Ques.14. Write an SQL query to fetch the EmpIds that are present in
--both the tables – „EmployeeDetails‟ and „EmployeeSalary.
SELECT EMPLOYEE_ID FROM EMPLOYEESDETAILS
WHERE EMPLOYEE_ID IN
(SELECT EMEPLOYEE_ID FROM EMPOYEESALARY);

--Ques.15. Write an SQL query to fetch the EmpIds that are present in
--EmployeeDetails but not in EmployeeSalary.
SELECT EMPLOYEE_ID FROM EMPLOYEESDETAILS
WHERE EMPLOYEE_ID NOT IN
(SELECT EMEPLOYEE_ID FROM EMPOYEESALARY);

--Ques.16. Write an SQL query to fetch the employee full names and
--replace the space with „-‟.
SELECT FULLNAME ,REPLACE(FULLNAME,'','_')FROM EMPLOYEES;

--Ques.17. . Write an SQL qUery to fetch the position of a given character(s) in a field.
SELECT INSTR(FULLNAME,'Snow') FROM TABLENAME;

--Ques.18. Write an SQL query to display both the EmpId and ManagerId together.
SELECT CONCAT(EMPLOYEE_ID,MANAGER_ID)AS SDS
FROM EMPLOYEES;

--Ques.19. Write a query to fetch only the first name(string before
--space) from the FullName column of the EmployeeDetails table.
SELECT SUBSTRING(FullName, 1, CHARINDEX(' ',FullName))
FROM EmployeeDetails;

--Ques.20. Write an SQL query to upper case the name of the employee and lower case the city values.
SELECT UPPER(FIRST_NAME),LOWER(CITY)
FROM TABLENAME;

--Ques.21. Write an SQL query to find the count of the total occurrences 
--of a particular character – „n‟ in the FullName field.
SELECT LENGTH(FULLNAME)-LENGTH(REPLACE(FULLNAME,'n",''))
FROM EMPLOYEES;

--Ques.22. Write an SQL query to update the employee names by
--removing leading and trailing spaces.
UPDATE TABLE
SET FULLNAME=LTRIM(RTRIM(FULLNAME));

--Ques.23. Fetch all the employees who are not working on any project.
SELECT * FROM TABLES 
WHERE PROJECT_ID IS NULL;

--Ques.24. Write an SQL query to fetch employee names having a salary
--greater than or equal to 5000 and less than or equal to 10000.
SELECT FIRST_NAME,SALARY
FROM EMPLOYEES
WHERE SALARY<=5000 OR SALARY=10000;

SELECT FullName
FROM EmployeeDetails
WHERE EmpId IN
(SELECT EmpId FROM EmployeeSalary
WHERE Salary BETWEEN 5000 AND 10000);

--Ques.25. Write an SQL query to find the current date-time.
SELECT SYSDATE FROM DUAL;

--Ques.26. Write an SQL query to fetch all the Employees details from
--EmployeeDetails table who joined in the Year 2020
SELECT * FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'DD-MM-YYYY')BETWEEN '01-01-2020' AND '31-12-2020';

--Ques.27. Write an SQL query to fetch all employee records from
--EmployeeDetails table who have a salary record in EmployeeSalary table.
SELET * FROM EMPLOYEESDETAILS


--Ques.28. Write an SQL query to fetch project-wise count of employees
--sorted by project‟s count in descending order
SELECT PROJECT ,COUNT(*)
FROM EMPLOYEES
GROUP BY PROJECT;

--Ques.29. Write a query to fetch employee names and salary records.
--Display the employee details even if the salary record is not present for the employee.
SELECT FIRST_NAME,SALARY FROM EMPLOYEES;

--Ques.30. Write an SQL query to join 3 tables.
SELECT E.FIRST_NAME,D.DEPARTMENT_NAME,L.CITY
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
JOIN LOCATIONS L
ON D.LOCATION_ID=L.LOCATION_ID;


--Ques. 31. Write an SQL query to fetch all the Employees who are also
--managers from the EmployeeDetails table
SELECT DISTINCT E.FIRST_NAME AS MFN,E.LAST_NAME AS MLN
FROM EMPLOYEES E
JOIN EMPLOYEES M
ON E.EMPLOYEE_ID=M.MANAGER_ID;

--Ques.32. Write an SQL query to fetch duplicate records from
--EmployeeDetails (without considering the primary key – EmpId).
SELECT FULLNAME,COUNT(*)
FROM EMPLOYEES
GROUP BY FULLNAME
HAVING COUNT(*)>1;

--FIND DUPLICATES
SELECT ROWID FROM EMPLOYEES
WHERE ROWID NOT IN
(SELECT MAX(ROWID) FROM EMPLOYEES GROUP BY EMPLOYEE_ID);

--Ques.33. Write an SQL query to remove duplicates from a table
DEETE FROM TABLE
WHERE ROWID NOT IN
(SELECT MAX(ROWID) FROM EMPLOYEES GROUP BY EMPLOYEE_ID);

--Ques.34. Write an SQL query to fetch only odd rows from the table.
SELECT * FROM
(SELECT ROWNUM AS RN,E.* FROM EMPLOYEES E)
WHERE MOD(RN,2)=1;

--Ques.35. Write an SQL query to fetch only even rows from the table.
SELECT * FROM
(SELECT ROWNUM AS RN,E.* FROM EMPLOYEES E)
WHERE MOD(RN,2)=0;

--Ques.36. Write an SQL query to create a new table with data and
structure copied from another table.
CREATE TABLE AS SELECT * FROM EMPLOYEES;
CREATE TABLE AS SELECT * FROM EMPLOYEES 
WHERE 1=2;

--Ques.38. Write an SQL query to fetch top n records?
SELECT * FROM
(SELECT ROWNUM AS RN,E.* FROM EMPLOYEES E)
WHERE RN=1;

--Ques.39. Write an SQL query to find the nth highest salary from table.
SELECT * FROM
(SELECT DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RK,E.* FROM EMPLOYEES E)
WHERE RK=1;

--Ques.40. Write SQL query to find the 3rd highest salary from a table
--without using the TOP/limit keyword.
SELECT * FROM
(SELECT DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RK,E.* FROM EMPLOYEES E)
WHERE RK=3;






