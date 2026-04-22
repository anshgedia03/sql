USE TECH_COM;


SHOW FULL TABLES;

DROP VIEW IF EXISTS learner_basic_view;


CREATE VIEW learner_basic_view AS
SELECT
    Learner_Id,
    LearnerFirstName,
    LearnerLastName,
    LearnerEmailID,
    YearsOfExperience,
    LearnerCompany,
    SourceOfJoining,
    Location
FROM learners;

SELECT * FROM learner_basic_view;

UPDATE learner_basic_view
SET LearnerCompany = 'Google',
    YearsOfExperience = 4
WHERE Learner_Id = 1;

SELECT * FROM learner_basic_view WHERE Learner_Id = 1;
SELECT * FROM learners WHERE Learner_Id = 1;

RENAME TABLE learner_basic_view TO learner_details_view;

SELECT * FROM learner_details_view;

SHOW FULL TABLES WHERE Table_type = 'VIEW';


CREATE OR REPLACE VIEW experienced_learners_view AS
SELECT
    Learner_Id,
    LearnerFirstName,
    LearnerLastName,
    LearnerEmailID,
    YearsOfExperience,
    LearnerCompany,
    SourceOfJoining,
    Location
FROM learners
WHERE YearsOfExperience >= 3
WITH CHECK OPTION;

SELECT * FROM experienced_learners_view;

UPDATE experienced_learners_view
SET LearnerCompany = 'Microsoft',
    YearsOfExperience = 5
WHERE Learner_Id = 1;

SELECT * FROM experienced_learners_view WHERE Learner_Id = 1;

SHOW FULL TABLES;
