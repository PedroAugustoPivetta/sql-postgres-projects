# 🐘 PostgreSQL Database Engineering & SQL Portfolio

![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/Language-SQL-003B57?style=for-the-badge&logo=sqlite&logoColor=white)
![Status](https://img.shields.io/badge/Status-In_Development-brightgreen?style=for-the-badge)

Welcome to my SQL and Database Engineering portfolio! This repository contains a collection of real-world relational database models built with **PostgreSQL**.

The goal of this project is to move beyond theoretical concepts and demonstrate practical application across **Data Definition Language (DDL)**, **Data Manipulation Language (DML)**, and **Data Query Language (DQL)**.

---

## 📌 Featured Database Projects

This repository is structured around 5 distinct enterprise database scenarios:

| # | Project Domain | Description | Key Modules |
|---|---|---|---|
| 01 | **E-Commerce & Online Sales** | Full transactional database for customer orders, inventory, and sales analytics. | Customers, Categories, Products, Orders, Order Items |
| 02 | **E-Learning Platform** | Course management system tracking student enrollments, modules, and completion statuses. | Instructors, Students, Courses, Modules, Enrollments |
| 03 | **Video Streaming Service** | Streaming catalog architecture managing subscription plans, user profiles, and watch history. | Plans, Users, Profiles, Contents, Watch History |
| 04 | **Medical Clinic / Hospital** | Healthcare management database covering patient appointments, medical specialties, and prescriptions. | Specialties, Doctors, Patients, Appointments, Prescriptions |
| 05 | **Personal Finance App** | Financial tracking system for multi-account management, credit card limits, and category budgets. | Users, Bank Accounts, Credit Cards, Categories, Transactions |

---

## 📂 Repository Structure

```text
├── 01-projects/
│   ├── E-commerce/
│   │   ├── DDL - E-commerce - Query.sql   # Table definitions, constraints, primary & foreign keys
│   │   ├── DML - E-commerce - Query.sql   # Data population, updates, and strategic deletes
│   │   └── DQL - E-commerce - Query.sql   # Complex queries (JOINs, aggregations, GROUP BY, HAVING)
│   ├── E-Learning/
│   ├── Streaming/
│   ├── MedicalClinic/
│   └── FinanceApp/
└── README.md
