INSERT INTO specialties (specialty_name) VALUES
('Cardiology'),
('Dermatology'),
('Pediatrics'),
('Orthopedics');

INSERT INTO doctors (specialty_id, full_name, license_number, phone_number) VALUES
(1, 'Dr. Robert House', 'CRM-100200', '+1-555-0101'),
(2, 'Dr. Meredith Grey', 'CRM-100300', '+1-555-0102'),
(3, 'Dr. John Watson', 'CRM-100400', '+1-555-0103');

INSERT INTO patients (full_name, national_id, birth_date, phone_number) VALUES
('Sarah Connor', '98765432100', '1985-02-28', '+1-555-0201'),
('Bruce Wayne', '87654321099', '1978-04-17', '+1-555-0202'),
('Clark Kent', '76543210988', '1980-06-18', '+1-555-0203');

INSERT INTO appointments (patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, '2026-03-10 09:00:00', 'Scheduled'),
(2, 2, '2026-03-12 14:30:00', 'Scheduled'),
(3, 3, '2026-03-15 11:00:00', 'Scheduled');

INSERT INTO prescriptions (appointment_id, medication, dosage, notes) VALUES
(1, 'Aspirin', '100mg once daily', 'Take after meals for 30 days.'),
(2, 'Topical Ointment', 'Apply twice daily', 'Apply to affected area for 7 days.');

UPDATE appointments
SET status = 'Completed'
WHERE appointment_id = 1;

UPDATE patients
SET phone_number = '+1-555-9999'
WHERE national_id = '98765432100';

DELETE FROM appointments
WHERE appointment_id = 3 AND status = 'Scheduled';