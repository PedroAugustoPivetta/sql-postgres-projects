-- Query -> Relatório de desempenho de cursos e instrutores
SELECT
co.course_id,
co.title AS course_title,
i.full_name AS instructor_name,
COUNT(e.enrollment_id) AS total_students,
SUM(co.price) AS estimated_revenue
FROM courses co
INNER JOIN instructors i ON co.instructor_id = i.instructor_id
LEFT JOIN enrollments e ON co.course_id = e.course_id
GROUP BY co.course_id, co.title, i.full_name
ORDER BY total_students DESC;

-- Query -> Alunos com cursos concluídos e total de horas cursadas
SELECT
st.student_id,
st.full_name,
COUNT(e.enrollment_id) AS completed_courses,
SUM(co.workload_hours) AS total_hours_completed
FROM students st
INNER JOIN enrollments e ON st.student_id = e.student_id
INNER JOIN courses co ON e.course_id = co.course_id
WHERE e.completion_status = 'Completed'
GROUP BY st.student_id, st.full_name;