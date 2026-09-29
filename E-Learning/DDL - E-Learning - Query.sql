CREATE TABLE instructors (
    instructor_id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    bio TEXT,
    hire_date DATE NOT NULL
);


CREATE TABLE students (
    student_id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    birth_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE courses (
    course_id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    instructor_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    workload_hours INT NOT NULL,
    price DECIMAL(8, 2) NOT NULL,
    CONSTRAINT fk_courses_instructors FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);


CREATE TABLE modules (
    module_id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_id INT NOT NULL,
    module_title VARCHAR(100) NOT NULL,
    module_order INT NOT NULL,
    CONSTRAINT fk_modules_courses FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


CREATE TABLE enrollments (
    enrollment_id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completion_status VARCHAR(20) DEFAULT 'In Progress',
    CONSTRAINT fk_enrollments_students FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT fk_enrollments_courses FOREIGN KEY (course_id) REFERENCES courses(course_id)
);