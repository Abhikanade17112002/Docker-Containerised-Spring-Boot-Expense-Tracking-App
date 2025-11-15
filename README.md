# 🚀 Docker-Containerised Spring Boot Expense Tracking App

![Language](https://img.shields.io/badge/Language-Java-blue.svg)
![Framework](https://img.shields.io/badge/Framework-SpringBoot-green.svg)
![Tech](https://img.shields.io/badge/Web-SpringMVC-green.svg)
![Security](https://img.shields.io/badge/Security-SpringSecurity-yellow.svg)
![Database](https://img.shields.io/badge/Database-MySQL-blue.svg)
![Template](https://img.shields.io/badge/Template-Thymeleaf_&_Bootstrap-purple.svg)
![Container](https://img.shields.io/badge/Container-Docker-blue.svg)
![Deployment](https://img.shields.io/badge/Deployment-AWS_EC2-orange.svg)


## 🖼 **Screenshots**

### 🔹 Application Screens

<table>
  <tr>
    <td><img src="screenshots/Home Page.png" alt="Home Page" width="400"/></td>
    <td><img src="screenshots/Sign Up Page.png" alt="Sign Up" width="400"/></td>
  </tr>
  <tr>
    <td><img src="screenshots/Add Expense.png" alt="Add Expense" width="400"/></td>
    <td><img src="screenshots/Expenses View.png" alt="Expenses View" width="400"/></td>
  </tr>
  <tr>
    <td colspan="2"><img src="screenshots/About Page.png" alt="About Page" width="400"/></td>
  </tr>
</table>

### 🔹 Docker & AWS Deployment

<table>
  <tr>
    <td><img src="screenshots/Docker File Terminal View.png" alt="Dockerfile" width="400"/></td>
    <td><img src="screenshots/Docker Compose File Terminal View.png" alt="Docker Compose" width="400"/></td>
  </tr>
  <tr>
    <td><img src="screenshots/Docker Containers Terminal View.png" alt="Containers" width="400"/></td>
    <td><img src="screenshots/Docker Images Terminal View.png" alt="Images" width="400"/></td>
  </tr>
  <tr>
    <td><img src="screenshots/Instance Overview.png" alt="EC2 Instance" width="400"/></td>
    <td><img src="screenshots/Security Group Overview.png" alt="Security Group" width="400"/></td>
  </tr>
</table>

> A production-ready **Expense Tracking Web Application** built with **Spring Boot**, secured with **Spring Security**, and fully **Docker-containerised** for seamless deployment on AWS EC2.

---

## 📋 **Table of Contents**

- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Quick Start](#-quick-start)
- [Docker Setup](#-docker-setup)
- [AWS EC2 Deployment](#️-aws-ec2-deployment)
- [Project Structure](#-project-structure)
- [Screenshots](#-screenshots)
- [API Documentation](#-api-documentation)
- [Future Enhancements](#-future-enhancements)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🧩 **Features**

### 🔐 Authentication & Security
- ✅ User Registration & Login
- ✅ Password Encryption (BCrypt)
- ✅ Role-based Access Control
- ✅ Session Management
- ✅ CSRF Protection

### 📒 Expense Management
- ✅ Create Expenses with Categories
- ✅ Update Existing Expenses
- ✅ Delete Expenses
- ✅ View All Expenses (Paginated)
- ✅ Filter by Date Range & Category
- ✅ Search Functionality

### ⚙️ DevOps & Architecture
- ✅ Multi-stage Dockerfile (Optimized Build)
- ✅ Docker Compose for Multi-Container Setup
- ✅ MySQL Database with Persistent Volumes
- ✅ Environment-based Configuration
- ✅ Production-Ready Deployment on AWS EC2

---

## 🛠 **Tech Stack**

| Layer          | Technology                     |
|----------------|--------------------------------|
| **Backend**    | Spring Boot 3.x, Spring MVC    |
| **Security**   | Spring Security 6.x            |
| **ORM**        | Spring Data JPA (Hibernate)    |
| **Frontend**   | Thymeleaf, Bootstrap 5         |
| **Database**   | MySQL 8.x                      |
| **Build Tool** | Maven 3.9+                     |
| **Container**  | Docker, Docker Compose         |
| **Cloud**      | AWS EC2 (Ubuntu 22.04)         |

---

## 🚀 **Quick Start**

### Prerequisites
- Java 17+
- Maven 3.9+
- Docker & Docker Compose
- MySQL 8+ (if running locally without Docker)

### Local Setup (Without Docker)

```bash
# Clone the repository
git clone https://github.com/Abhikanade17112002/Docker-Containerised-Spring-Boot-Expense-Tracking-App.git
cd Docker-Containerised-Spring-Boot-Expense-Tracking-App

# Configure MySQL in application.properties
# Update database credentials

# Build the project
mvn clean install -DskipTests

# Run the application
mvn spring-boot:run
```

Access the app at: **http://localhost:8080**

---

## 🐳 **Docker Setup**

### **Option 1: Docker Compose (Recommended)**

This is the easiest way to run the entire stack:

```bash
# Build and start all containers
docker compose up --build

# Run in detached mode
docker compose up --build -d

# View logs
docker compose logs -f

# Stop containers
docker compose down
```

**What's Included:**
- MySQL container with persistent volume
- Spring Boot app container
- Automatic networking between containers
- Port mapping (8080 → host)

### **Option 2: Docker Build & Run (Manual)**

```bash
# Build the Docker image
docker build -t expensesapp:latest .

# Run MySQL container
docker run -d \
  --name mysql-db \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=expensesdb \
  -p 3306:3306 \
  mysql:8.0

# Run the app container
docker run -d \
  --name expensesapp \
  --link mysql-db:mysql \
  -p 8080:8080 \
  expensesapp:latest
```

### **Dockerfile Architecture**

```dockerfile
# Stage 1: Build
FROM maven:3.9-eclipse-temurin-17 AS build
# ... builds JAR file

# Stage 2: Runtime
FROM eclipse-temurin:17-jre-alpine
# ... runs optimized JAR
```

**Benefits:**
- Multi-stage build reduces image size by ~60%
- Separates build and runtime dependencies
- Uses lightweight Alpine-based JRE

---

## ☁️ **AWS EC2 Deployment (Production)**

### **Step-by-Step Deployment**

#### 1️⃣ **Launch EC2 Instance**
- **AMI:** Ubuntu 22.04 LTS
- **Instance Type:** t2.micro (Free Tier) or t2.small
- **Storage:** 20GB SSD

#### 2️⃣ **Install Docker & Docker Compose**

```bash
# SSH into EC2
ssh -i your-key.pem ubuntu@<EC2_PUBLIC_IP>

# Update system
sudo apt update && sudo apt upgrade -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker ubuntu

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verify installations
docker --version
docker-compose --version
```

#### 3️⃣ **Deploy Application**

```bash
# Clone repository
git clone https://github.com/Abhikanade17112002/Docker-Containerised-Spring-Boot-Expense-Tracking-App.git
cd Docker-Containerised-Spring-Boot-Expense-Tracking-App

# Build and run
docker compose up --build -d

# Check status
docker ps
docker logs expensesapp
```

#### 4️⃣ **Configure Security Group**

In AWS Console:
1. Go to **EC2 → Security Groups**
2. Select your instance's security group
3. Add **Inbound Rule:**
   - Type: Custom TCP
   - Port: 8080
   - Source: 0.0.0.0/0 (or your IP for security)

#### 5️⃣ **Access Application**

```
http://<EC2_PUBLIC_IP>:8080
```

### **Production Considerations**

- ✅ Use **Nginx** as reverse proxy (SSL/TLS)
- ✅ Set up **domain name** with Route 53
- ✅ Configure **SSL certificates** (Let's Encrypt)
- ✅ Enable **CloudWatch** monitoring
- ✅ Set up **automated backups** for MySQL
- ✅ Use **RDS** for managed database
- ✅ Implement **CI/CD** pipeline (GitHub Actions)

---

## 📁 **Project Structure**

```
📦 Expenses-Tracker-WebApp
┣ 📂 src
┃ ┣ 📂 main
┃ ┃ ┣ 📂 java/com/expensetracker
┃ ┃ ┃ ┣ 📂 controller
┃ ┃ ┃ ┣ 📂 model
┃ ┃ ┃ ┣ 📂 repository
┃ ┃ ┃ ┣ 📂 service
┃ ┃ ┃ ┗ 📂 security
┃ ┃ ┗ 📂 resources
┃ ┃   ┣ 📂 templates
┃ ┃   ┣ 📂 static
┃ ┃   ┗ 📜 application.properties
┃ ┗ 📂 test
┣ 📂 screenshots
┣ 📜 Dockerfile
┣ 📜 docker-compose.yml
┣ 📜 pom.xml
┗ 📜 README.md
```

---



---

## 📚 **API Documentation**

### Authentication Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/register` | Registration page |
| POST | `/register` | Create new user |
| GET | `/login` | Login page |
| POST | `/login` | Authenticate user |
| GET | `/logout` | Logout user |

### Expense Management Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/expenses` | View all expenses |
| GET | `/expenses/add` | Add expense form |
| POST | `/expenses/add` | Create new expense |
| GET | `/expenses/edit/{id}` | Edit expense form |
| POST | `/expenses/edit/{id}` | Update expense |
| GET | `/expenses/delete/{id}` | Delete expense |
| GET | `/expenses/filter` | Filter expenses |

---

## 🏗 **Future Enhancements**

- [ ] **PDF/Excel Export** - Download expense reports
- [ ] **RESTful API** - Add JWT-based REST endpoints
- [ ] **Charts & Analytics** - Data visualization dashboard
- [ ] **Email Notifications** - OTP verification & reminders
- [ ] **Modern Frontend** - React/Angular SPA
- [ ] **Multi-currency Support** - International currencies
- [ ] **Receipt Upload** - Image attachment for expenses
- [ ] **Budget Planning** - Monthly budget limits & alerts
- [ ] **Mobile App** - Native iOS/Android apps

---

## 🤝 **Contributing**

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

Please ensure your code follows the existing style and includes appropriate tests.

---

## 📜 **License**

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 **Author**

**Abhishek Kanade**

- GitHub: [@Abhikanade17112002](https://github.com/Abhikanade17112002)
- LinkedIn: [Connect with me](https://linkedin.com/in/abhishekkanade)

---

## ⭐ **Show Support**

If you found this project helpful, please give it a ⭐️!

[![GitHub stars](https://img.shields.io/github/stars/Abhikanade17112002/Docker-Containerised-Spring-Boot-Expense-Tracking-App?style=social)](https://github.com/Abhikanade17112002/Docker-Containerised-Spring-Boot-Expense-Tracking-App)

---

## 📞 **Support**

For issues, questions, or suggestions:
- Open an [Issue](https://github.com/Abhikanade17112002/Docker-Containerised-Spring-Boot-Expense-Tracking-App/issues)
- Discussion: [GitHub Discussions](https://github.com/Abhikanade17112002/Docker-Containerised-Spring-Boot-Expense-Tracking-App/discussions)

---

**Made with ❤️ using Spring Boot & Docker**
