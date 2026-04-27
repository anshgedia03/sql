USE TECH_COM;

SELECT * FROM emp;




CREATE TABLE budget (
    budget_id INT PRIMARY KEY DEFAULT 1,
    allocated_budget INT NOT NULL DEFAULT 1500000,
    used_budget INT NOT NULL DEFAULT 0,
    CHECK (used_budget <= allocated_budget)
);

INSERT INTO budget (budget_id, allocated_budget, used_budget)
VALUES (
    1,
    1500000,
    (SELECT COALESCE(SUM(salary), 0) FROM emp)
);

SELECT * FROM budget;

CREATE TRIGGER trg_emp_after_insert_budget
AFTER INSERT ON emp
FOR EACH ROW
UPDATE budget
SET used_budget = (SELECT COALESCE(SUM(salary), 0) FROM emp)
WHERE budget_id = 1;

CREATE TRIGGER trg_emp_after_salary_update_budget
AFTER UPDATE ON emp
FOR EACH ROW
UPDATE budget
SET used_budget = (SELECT COALESCE(SUM(salary), 0) FROM emp)
WHERE budget_id = 1;

INSERT INTO emp(Fname, Lname, salary, Locations, age)
VALUES ('test', 'employee', 25000, 'BASERA', 21);

SELECT * FROM emp;
SELECT * FROM budget;


UPDATE emp
SET salary = 600000
WHERE Fname = 'test'
  AND Lname = 'employee';

SELECT * FROM emp;
SELECT * FROM budget;

SHOW TRIGGERS;




