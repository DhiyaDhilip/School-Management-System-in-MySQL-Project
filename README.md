# School-Management-System-in-MySQL-Project
This SQL project builds a **School Management System** that stores and manages details of teachers, classes, and schedules. It includes **joins, grouping, updates, and deletes** to view class timings, teacher workloads, and subject schedules. The system helps organize and track teaching activities efficiently across the school.



##  MySQL Project: School Management System

###  Project Overview:
This project models a relational database for managing school operations including teacher assignments, class schedules, and subject tracking. It demonstrates your ability to design normalized schemas, enforce referential integrity, and write SQL queries for academic administration.



###  Database Schema Design

#### 🔹 teachers
Stores teacher information:
- Fields: `teacher_id`, `first_name`, `last_name`, `subject`, `contact_no`, `email`

#### 🔹 classes
Maps classes to teachers:
- Fields: `class_id`, `class_name`, `teacher_id`
- Foreign Key: `teacher_id` → `teachers`

#### 🔹 schedules
Defines weekly class timings:
- Fields: `schedule_id`, `class_id`, `day_of_week`, `start_time`, `end_time`
- Foreign Key: `class_id` → `classes`



###  SQL Query Highlights

#### 🔸 Class & Schedule Insights
- Get schedule for a specific class (`Algebra I`)  
- Find all classes scheduled on a specific day (e.g., Monday)  
- Update class timing (e.g., change start and end time for `schedule_id = 1`)  
- Delete a class schedule (e.g., for `class_id = 5`)  

#### 🔸 Teacher & Class Relationships
- List all teacher details  
- Get classes taught by a specific teacher (e.g., John Doe)  
- Find which teacher is teaching a class on a specific day  
- Count total classes taught by each teacher  
- Find classes taught by teachers whose names start with 'J'  
- Get teachers scheduled on a specific day (e.g., Friday)



###  Skills Demonstrated
- Relational schema design with foreign key constraints  
- Data insertion and normalization  
- Join operations across multiple tables  
- Aggregation (`COUNT`) and filtering (`LIKE`, `WHERE`)  
- Update and delete operations  
- Time-based scheduling logic



###  Outcome:
This project showcases your ability to build and query a school database system using MySQL. It reflects practical skills in academic data management, scheduling, and teacher-class mapping — essential for roles in database development, education tech, and administrative systems.

