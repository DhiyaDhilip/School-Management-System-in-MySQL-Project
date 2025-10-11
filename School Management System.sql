-- School Management System
-- This system manages details of students, teachers, classes, and schedules in a school.

create database School;
use School;

CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY Not Null,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    subject VARCHAR(50),
    contact_no VARCHAR(15),
    email VARCHAR(100)
);

INSERT INTO teachers (teacher_id, first_name, last_name, subject, contact_no, email) VALUES
(101, 'John', 'Doe', 'Mathematics', '555-1234', 'johndoe@example.com'),
(201, 'Jane', 'Smith', 'English', '555-5678', 'janesmith@example.com'),
(301, 'Emily', 'Johnson', 'Science', '555-8765', 'emilyjohnson@example.com'),
(401, 'Michael', 'Brown', 'History', '555-4321', 'michaelbrown@example.com'),
(501, 'Sarah', 'Davis', 'Art', '555-2468', 'sarahdavis@example.com'),
(601, 'David', 'Martinez', 'Physical Education', '555-1357', 'davidmartinez@example.com'),
(701, 'Olivia', 'Taylor', 'Music', '555-8642', 'oliviataylor@example.com'),
(801, 'James', 'Anderson', 'Geography', '555-7531', 'jamesanderson@example.com'),
(901, 'Sophia', 'Thomas', 'Literature', '555-9753', 'sophiathomas@example.com'),
(1001, 'William', 'Jackson', 'Computer Science', '555-8640', 'williamjackson@example.com');

CREATE TABLE classes (
    class_id INT PRIMARY KEY Not Null,
    class_name VARCHAR(50),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

INSERT INTO classes (class_id, class_name, teacher_id) VALUES
(1, 'Algebra I', 101),
(2, 'English Literature', 201),
(3, 'Biology', 301),
(4, 'World History', 401),
(5, 'Painting and Drawing', 501),
(6, 'Physical Education', 601),
(7, 'Choir', 701),
(8, 'Geography 101', 801),
(9, 'Shakespearean Drama', 901),
(10, 'Intro to Programming', 1001);

CREATE TABLE schedules (
    schedule_id INT PRIMARY KEY Not Null,
    class_id INT,
    day_of_week Varchar(50),
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

INSERT INTO schedules (schedule_id, class_id, day_of_week, start_time, end_time) VALUES
(1, 1, 'Monday', '08:00:00', '09:30:00'),
(2, 2, 'Tuesday', '09:00:00', '10:30:00'),
(3, 3, 'Wednesday', '10:00:00', '11:30:00'),
(4, 4, 'Thursday', '11:00:00', '12:30:00'),
(5, 5, 'Friday', '13:00:00', '14:30:00'),
(6, 6, 'Monday', '14:00:00', '15:30:00'),
(7, 7, 'Tuesday', '15:00:00', '16:30:00'),
(8, 8, 'Wednesday', '16:00:00', '17:30:00'),
(9, 9, 'Thursday', '08:30:00', '10:00:00'),
(10, 10, 'Friday', '10:30:00', '12:00:00');

INSERT INTO teachers (teacher_id,first_name, last_name, subject, contact_no, email)
VALUES (321,'Emma', 'Brown', 'Mathematics', '9876543210', 'emma.brown@gmail.com');

INSERT INTO classes (class_id,class_name, teacher_id)
VALUES (11,'Grade 10 Mathematics',101); 

SELECT c.class_name, s.day_of_week, s.start_time, s.end_time
FROM classes c
JOIN schedules s ON c.class_id = s.class_id
WHERE c.class_id = 1;

-- Get all teacher's details:

select * From teachers;

-- Get all classes taught by a specific teacher:

SELECT c.class_name 
FROM classes c
JOIN teachers t ON c.teacher_id = t.teacher_id
WHERE t.first_name = 'John' AND t.last_name = 'Doe';

-- Get the schedule of a specific class:

SELECT s.day_of_week, s.start_time, s.end_time
FROM schedules s
JOIN classes c ON s.class_id = c.class_id
WHERE c.class_name = 'Algebra I';

-- Find which teacher is teaching a specific class on a particular day:

SELECT t.first_name, t.last_name, s.day_of_week, s.start_time, s.end_time
FROM teachers t
JOIN classes c ON t.teacher_id = c.teacher_id
JOIN schedules s ON c.class_id = s.class_id
WHERE c.class_name = 'Algebra I' AND s.day_of_week = 'Monday';

-- Get the total number of classes taught by each teacher:

SELECT t.first_name, t.last_name, COUNT(c.class_id) AS total_classes
FROM teachers t
LEFT JOIN classes c ON t.teacher_id = c.teacher_id
GROUP BY t.teacher_id;

-- Find all classes scheduled on a specific day:

SELECT c.class_name, s.start_time, s.end_time
FROM schedules s
JOIN classes c ON s.class_id = c.class_id
WHERE s.day_of_week = 'Monday';

-- Update the schedule for a class (e.g., changing the time for a specific class):

UPDATE schedules
SET start_time = '09:00:00', end_time = '10:30:00'
WHERE schedule_id = 1;

-- Delete a specific class schedule (e.g., for class ID = 5):

DELETE FROM schedules
WHERE class_id = 5;

-- Get the teachers who are scheduled on a specific day:

SELECT t.first_name, t.last_name, s.day_of_week
FROM teachers t
JOIN classes c ON t.teacher_id = c.teacher_id
JOIN schedules s ON c.class_id = s.class_id
WHERE s.day_of_week = 'Friday';

-- Find classes taught by teachers whose names start with 'J':

SELECT c.class_name
FROM classes c
JOIN teachers t ON c.teacher_id = t.teacher_id
WHERE t.first_name LIKE 'J%';

