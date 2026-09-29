INSERT INTO instructors (full_name, email, bio, hire_date) VALUES
('Dr. Alan Turing', 'alan.turing@university.edu', 'Expert in Computer Science and Data Systems.', '2023-01-15'),
('Grace Hopper', 'grace.hopper@techacademy.io', 'Pioneer in software development and compilers.', '2023-05-10'),
('Linus Torvalds', 'linus.t@openlearning.org', 'Operating systems and open-source enthusiast.', '2024-02-01');

INSERT INTO students (full_name, email, birth_date) VALUES
('John Doe', 'john.doe@email.com', '1998-05-12'),
('Jane Miller', 'jane.miller@email.com', '2001-09-23'),
('Carlos Silva', 'carlos.silva@email.com', '1995-11-30'),
('Emily Watson', 'emily.watson@email.com', '2002-02-14'),
('Unenrolled Student', 'temp.student@email.com', '2000-01-01');

INSERT INTO courses (instructor_id, title, workload_hours, price) VALUES
(1, 'Introduction to Relational Databases & SQL', 40, 199.99),
(2, 'Advanced SQL Query Optimization', 30, 249.99),
(3, 'Data Modeling for Scalable Systems', 50, 299.00);

INSERT INTO modules (course_id, module_title, module_order) VALUES
(1, 'DDL: Tables & Schema Design', 1),
(1, 'DML: Manipulating Data', 2),
(1, 'DQL: Basic & Advanced Queries', 3),
(2, 'Indexes and Execution Plans', 1),
(2, 'Window Functions & CTEs', 2);

INSERT INTO enrollments (student_id, course_id, enrollment_date, completion_status) VALUES
(1, 1, '2026-01-10 08:00:00', 'In Progress'),
(2, 1, '2026-01-15 11:20:00', 'In Progress'),
(3, 2, '2026-02-01 14:00:00', 'In Progress'),
(4, 3, '2026-02-10 18:30:00', 'Dropped');

UPDATE enrollments
SET completion_status = 'Completed'
WHERE student_id = 1 AND course_id = 1;

UPDATE courses
SET price = price + 20.00
WHERE instructor_id = 2;

DELETE FROM enrollments
WHERE completion_status = 'Dropped';

DELETE FROM students
WHERE email = 'temp.student@email.com' 
  AND student_id NOT IN (SELECT DISTINCT student_id FROM enrollments);