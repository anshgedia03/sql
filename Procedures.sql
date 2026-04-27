USE TECH_COM;


SHOW PROCEDURE STATUS WHERE Db = 'TECH_COM';


CREATE PROCEDURE get_all_employees()
SELECT
    EmpID,
    Fname,
    Lname,
    salary,
    Locations
FROM emp;


CREATE PROCEDURE get_employees_by_location(IN p_location VARCHAR(25))
SELECT
    EmpID,
    Fname,
    Lname,
    salary,
    Locations
FROM emp
WHERE Locations = p_location;

CREATE PROCEDURE get_total_salary_by_location(
    IN p_location VARCHAR(25),
    OUT p_total_salary INT
)
SELECT COALESCE(SUM(salary), 0)
INTO p_total_salary
FROM emp
WHERE Locations = p_location;


CREATE PROCEDURE increase_salary_value(INOUT p_salary INT)
SET p_salary = p_salary + 1000;

SHOW PROCEDURE STATUS WHERE Db = 'TECH_COM';


CALL get_all_employees();

CALL get_employees_by_location('BASERA');


CALL get_total_salary_by_location('BASERA', @total_salary);
SELECT @total_salary AS total_salary_for_basera;


SET @salary_amount = 20000;
CALL increase_salary_value(@salary_amount);
SELECT @salary_amount AS increased_salary_amount;


DROP PROCEDURE IF EXISTS get_all_employees;

SHOW PROCEDURE STATUS WHERE Db = 'TECH_COM';
