USE TECH_COM;

-- Check existing indexes on the learners table.
SHOW INDEX FROM learners;

CREATE INDEX idx_learners_location
ON learners(Location);


SELECT
    Learner_Id,
    LearnerFirstName,
    LearnerLastName,
    Location
FROM learners
WHERE Location = 'Pune';


--composite index for multiple cols
CREATE INDEX idx_learners_course_source
ON learners(SelectedCourses, SourceOfJoining);

SELECT
    Learner_Id,
    LearnerFirstName,
    LearnerLastName,
    SelectedCourses,
    SourceOfJoining
FROM learners
WHERE SelectedCourses = 4
  AND SourceOfJoining = 'Seminar';


CREATE UNIQUE INDEX idx_learners_phone_unique
ON learners(LearnerPhoneNo);

SELECT
    Learner_Id,
    LearnerFirstName,
    LearnerLastName,
    LearnerPhoneNo
FROM learners
WHERE LearnerPhoneNo = '9876543210';

SHOW INDEX FROM learners;

DROP INDEX idx_learners_location ON learners;
DROP INDEX idx_learners_course_source ON learners;
DROP INDEX idx_learners_phone_unique ON learners;

