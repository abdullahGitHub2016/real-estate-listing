# 🧑‍💼 My Jobs Portal

A comprehensive job and property management platform built with a **Spring Boot backend** and a **Thymeleaf + Tailwind CSS frontend**.  
This project focuses on high-performance industrial layouts and **microservices-ready architecture**.

---

## 🚀 Features

- 🏠 **Property Management**  
  Detailed property listings with owner verification status.

- 🏢 **Developer Directory**  
  A searchable portal for development firms with membership tiering *(Platinum, Gold, etc.)*.

- 📱 **Responsive Design**  
  Built using Tailwind CSS utility classes for a modern, mobile-first experience.

- ⚙️ **Backend Logic**  
  Robust monthly processing for deductions, salary tracking, and job application workflows.

- 🔔 **Infrastructure**  
  Integrated with Docker, Kafka, and RabbitMQ for event-driven notifications.

---

## 📸 Screenshots

### 🏠 Home Page
The landing page featuring highlighted properties and job categories.

### 🏘️ Property Details
Detailed view of listings including owner information and verified badges.

### 🏢 Developers Portal
A list of development partners with dynamic membership status indicators.

> _(Add screenshots inside a `/screenshots` folder and link like below)_

```markdown
![Home](screenshots/home.png)
```

---

## 🛠 Tech Stack

### 🎨 Frontend
- HTML5
- Thymeleaf Template Engine
- Tailwind CSS *(Utility-first styling)*
- FontAwesome *(Iconography)*

### ⚙️ Backend
- Java 21 / Spring Boot 3
- Spring Data JPA *(PostgreSQL / MySQL)*
- Spring Security
- FFmpeg *(Video processing & thumbnail generation)*

### 🧱 Infrastructure
- Docker & Docker Compose
- Apache Kafka *(Message Broker)*
- RabbitMQ
- Windows 11 Development Environment

---

## ⚙️ Installation & Setup

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/your-username/my-jobs.git
cd my-jobs
```

### 2️⃣ Database Configuration
Update the following file with your database credentials:

```
src/main/resources/application.properties
```

---

### 3️⃣ Build the Project
```bash
mvn clean install
```

---

### 4️⃣ Run with Docker
```bash
docker-compose up -d
```

---

### 5️⃣ Access the Application
Open your browser and navigate to:

```
http://localhost:8080
```

---

## 📝 License

Distributed under the **MIT License**.  
See `LICENSE` for more information.

---

## ⭐ Support

If you like this project, give it a ⭐ on GitHub!
