use regex;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    major VARCHAR(50)
);

INSERT INTO students (student_id, student_name, major) VALUES
(1, 'Aarav', 'Computer Science'),
(2, 'Bhavya', 'Mathematics'),
(3, 'Chetan', 'Physics'),
(4, 'Diya', 'Computer Science'),
(5, 'Esha', 'Mathematics'),
(6, 'Farhan', 'Physics'),
(7, 'Gauri', 'Computer Science'),
(8, 'Harsh', 'Mathematics'),
(9, 'Isha', 'Physics'),
(10, 'Jay', 'Computer Science'),
(11, 'Kiran', 'Mathematics'),
(12, 'Leena', 'Physics'),
(13, 'Manav', 'Computer Science'),
(14, 'Neha', 'Mathematics'),
(15, 'Om', 'Physics'),
(16, 'Pooja', 'Computer Science'),
(17, 'Qadir', 'Mathematics'),
(18, 'Riya', 'Physics'),
(19, 'Sahil', 'Computer Science'),
(20, 'Tina', 'Mathematics');


CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    credits INT
);

INSERT INTO enrollments (enrollment_id, student_id, course_name, credits) VALUES
(101, 1, 'Data Structures', 4),
(102, 1, 'Algorithms', 4),
(103, 2, 'Linear Algebra', 3),
(104, 3, 'Quantum Mechanics', 4),
(105, 4, 'Operating Systems', 4),
(106, 5, 'Statistics', 3),
(107, 6, 'Electromagnetism', 4),
(108, 7, 'Databases', 4),
(109, 8, 'Probability', 3),
(110, 9, 'Thermodynamics', 4),
(111, 10, 'Computer Networks', 4),
(112, 11, 'Calculus II', 3),
(113, 12, 'Optics', 4),
(114, 13, 'Machine Learning', 4),
(115, 14, 'Discrete Math', 3),
(116, 15, 'Nuclear Physics', 4),
(117, 16, 'Software Engineering', 4),
(118, 17, 'Numerical Methods', 3),
(119, 18, 'Solid State Physics', 4),
(120, 1, 'Artificial Intelligence', 4);

Select * from students;
select * from enrollments;

-- Get the list of all students who have enrolled themselves in a course
Select s.student_id , s.student_name , e.enrollment_id , e.course_name
from students as s
join enrollments as e where s.student_id  = e.student_id;

-- Get list of all students along with their enrolled courses, includinhg students who have not enrolled in any course
Select s.student_id , s.student_name , e.enrollment_id , e.course_name
from students as s
left join enrollments as e 
on s.student_id  = e.student_id;

-- Get list of all students who have not enrolled in any course
Select s.student_id , s.student_name, e.enrollment_id , e.course_name
from students as s
left join enrollments as e on e.student_id = s.student_id
where enrollment_id is NULL;

-- Get the name of student and the total number of courses the student has enrolled
Select s.student_name, count(e.enrollment_id) from students as s
left join enrollments as e
on s.student_id = e.student_id
group by s.student_id;


-- Find the nuber of students in each major
Select count(student_id) , major from students group by major;

-- Find out total credits for each major
Select s.major, sum(e.credits) from students as s
join enrollments as e
on s.student_id = e.student_id group by s.major;

-- Write a SQL query to get thedeatils of student with their respective major
Select s.student_id , s.student_name , s.major from students as s
join enrollments as e on s.student_id = e.student_id
group by s.student_id;

-- Write a SQL query to group the students by the length of their name
-- and show the count of students in each group
Select length(student_name),count(student_id) from students
group by length(student_name);

-- Number of courses enrolled in each group of their name of same length
Select length(s.student_name),count(e.enrollment_id) from students as s
join enrollments as e on s.student_id = e.student_id 
group by length(student_name);

-- Get the group of name of same length in which maximum number of enrollements happend
Select length(s.student_name),count(e.enrollment_id) from students as s
join enrollments as e on s.student_id = e.student_id 
group by length(student_name) order by count(e.enrollment_id) desc limit 1;





