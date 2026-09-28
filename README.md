# InternshipHub 🚀

InternshipHub is a Flutter-based internship application tracking platform designed to help students manage their internship applications, profiles, saved opportunities, and application progress in one place.

## 📌 Project Overview

Students often apply to multiple internships across different companies and platforms, making it difficult to keep track of application dates, deadlines, interview stages, and selection status.

InternshipHub provides a centralized platform where students can:

- Create their own account
- Maintain their student profile
- Track internship applications
- View application details
- Save internship opportunities
- Monitor application status
- Manage their internship journey from one dashboard

## ✨ Features

### 🔐 User Authentication
- Student registration
- Student login
- Firebase Authentication
- Individual user accounts
- Secure user-specific data

### 👤 Student Profile
- Student name
- Email
- College
- Branch
- Academic year
- CGPA
- Skills
- Resume management

### 💼 Internship Application Tracking
Students can maintain details such as:

- Company name
- Internship role
- Location
- Application date
- Application deadline
- Application status
- Notes
- Job/application link

### 📊 Dashboard
The dashboard provides an overview of the student's internship journey, including:

- Total applications
- Applications in progress
- Interview opportunities
- Selected applications
- Saved opportunities

### 🔖 Saved Internships
Students can save internship opportunities for quick access later.

### 📄 Application Details
Students can open an internship application and view its complete information.

### ☁️ Cloud Backend
InternshipHub uses Firebase services to provide:

- Firebase Authentication
- Cloud Firestore
- Firebase Storage for resume management

## 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| Flutter | Cross-platform application development |
| Dart | Application programming language |
| Firebase Authentication | User registration and login |
| Cloud Firestore | User and application data |
| Firebase Storage | Resume/file storage |
| Material 3 | User interface |

## 🏗️ Application Architecture

```text
                    InternshipHub
                          │
                          ▼
                    Flutter App
                          │
             ┌────────────┼────────────┐
             │            │            │
             ▼            ▼            ▼
        Authentication  Firestore   Storage
             │            │            │
             ▼            ▼            ▼
        Student UID    Applications  Resume
             │            │
             └──────┬─────┘
                    ▼
             Student Dashboard
