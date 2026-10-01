CREATE TABLE specialties (
    specialty_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    specialty_name VARCHAR(100) NOT NULL
);

CREATE TABLE doctors (
    doctor_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    specialty_id INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    license_number VARCHAR(20) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    CONSTRAINT fk_doctors_specialties FOREIGN KEY (specialty_id) REFERENCES specialties(specialty_id)
);

CREATE TABLE patients (
    patient_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    national_id VARCHAR(14) NOT NULL UNIQUE,
    birth_date DATE NOT NULL,
    phone_number VARCHAR(20)
);

CREATE TABLE appointments (
    appointment_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date TIMESTAMP NOT NULL,
    status VARCHAR(20) DEFAULT 'Scheduled',
    CONSTRAINT fk_appointments_patients FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    CONSTRAINT fk_appointments_doctors FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE prescriptions (
    prescription_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    appointment_id INT NOT NULL,
    medication VARCHAR(100) NOT NULL,
    dosage VARCHAR(200) NOT NULL,
    notes TEXT,
    CONSTRAINT fk_prescriptions_appointments FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);