-- Query -> Atendimentos por médico e especialidade
SELECT
d.doctor_id,
d.full_name AS doctor_name,
sp.specialty_name,
COUNT(a.appointment_id) AS total_appointments
FROM doctors d
INNER JOIN specialties sp ON d.specialty_id = sp.specialty_id
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.full_name, sp.specialty_name
ORDER BY total_appointments DESC;

-- Query -> Histórico do paciente com médico e prescrições emitidas
SELECT
p.full_name AS patient_name,
a.appointment_date,
d.full_name AS doctor_name,
sp.specialty_name,
pr.medication,
pr.dosage
FROM appointments a
INNER JOIN patients p ON a.patient_id = p.patient_id
INNER JOIN doctors d ON a.doctor_id = d.doctor_id
INNER JOIN specialties sp ON d.specialty_id = sp.specialty_id
LEFT JOIN prescriptions pr ON a.appointment_id = pr.appointment_id
ORDER BY a.appointment_date DESC;