# ⚡ Basic CRUD Project — Java Servlet + JDBC + MySQL

A full-stack Java web application with **Login Authentication** and complete **CRUD operations** (Create, Read, Update, Delete) built using Java Servlets, JSP, JDBC, and MySQL. Deployable on Apache Tomcat.

---

## 📸 Preview

| Login Page | Dashboard |
|-----------|-----------|
| Admin login with session management | View, Add, Edit, Delete users |

---

## 🛠️ Tech Stack

| Technology | Purpose |
|-----------|---------|
| Java 17 | Backend language |
| Java Servlets | Request handling |
| JSP | Frontend views |
| JDBC | Database connectivity |
| MySQL | Database |
| Apache Tomcat 9 | Web server |
| Maven | Build tool |
| CSS | Styling |

---

## 📁 Project Structure

```
jdbc-crud-app2/
├── pom.xml                          ← Maven build file
├── database.sql                     ← Run this first in MySQL
└── src/
    └── main/
        ├── java/com/app/
        │   ├── model/
        │   │   └── User.java        ← User data model
        │   ├── dao/
        │   │   └── UserDAO.java     ← CRUD database operations
        │   ├── util/
        │   │   └── DBConnection.java ← MySQL connection config
        │   └── servlet/
        │       ├── LoginServlet.java ← Handles /login
        │       └── UserServlet.java  ← Handles /users (CRUD)
        └── webapp/
            ├── WEB-INF/
            │   └── web.xml          ← App configuration
            ├── css/
            │   └── style.css        ← Stylesheet
            ├── login.jsp            ← Login page
            ├── userList.jsp         ← Dashboard / user list
            ├── addUser.jsp          ← Add user form
            └── editUser.jsp         ← Edit user form
```

---

## ✅ Prerequisites

Make sure you have the following installed before starting:

| Software | Version | Download |
|---------|---------|----------|
| JDK | 11 or higher | https://adoptium.net |
| Apache Maven | 3.6+ | https://maven.apache.org/download.cgi |
| Apache Tomcat | 9.x | https://tomcat.apache.org/download-90.cgi |
| MySQL | 8.x | https://dev.mysql.com/downloads/installer |
| VS Code | Latest | https://code.visualstudio.com |

### VS Code Extensions Required
- **Extension Pack for Java** — by Microsoft
- **Community Server Connectors** — by Red Hat
- **Maven for Java** — by Microsoft

---

## ⚙️ Setup Guide

### Step 1 — Clone the Repository

```bash
git clone https://github.com/sailesrai789-a11y/Basic-CRUD-project.git
cd Basic-CRUD-project
```

---

### Step 2 — Set Up MySQL Database

Open **MySQL Workbench** or **MySQL Command Line** and run:

```sql
-- Create database
CREATE DATABASE IF NOT EXISTS cruddb;
USE cruddb;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id    INT AUTO_INCREMENT PRIMARY KEY,
    name  VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(15)  NOT NULL
);

-- Create app user
CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'Mysql123@';
GRANT ALL PRIVILEGES ON cruddb.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;

-- Optional: Insert sample data
INSERT INTO users (name, email, phone) VALUES
('Rahul Sharma', 'rahul@email.com', '9876543210'),
('Priya Singh',  'priya@email.com', '9123456780'),
('Amit Kumar',   'amit@email.com',  '9001234567');
```

---

### Step 3 — Configure Database Connection

Open this file:
```
src/main/java/com/app/util/DBConnection.java
```

Verify the credentials match your MySQL setup:
```java
private static final String URL      = "jdbc:mysql://localhost:3306/cruddb";
private static final String USERNAME = "admin";
private static final String PASSWORD = "Mysql123@";
```

> ⚠️ If your MySQL runs on a different port, update `3306` accordingly.

---

### Step 4 — Set Up Environment Variables

**JAVA_HOME:**
```
Variable name:  JAVA_HOME
Variable value: C:\Program Files\Java\jdk-17
```

**MAVEN_HOME:**
```
Variable name:  MAVEN_HOME
Variable value: C:\apache-maven-3.9.x
```

**Add to Path:**
```
%JAVA_HOME%\bin
%MAVEN_HOME%\bin
```

Verify in terminal:
```cmd
java -version
mvn -version
```

---

### Step 5 — Build the Project

Open terminal in VS Code inside the project folder and run:
```cmd
mvn clean package
```

Wait for:
```
BUILD SUCCESS
```

This creates: `target/jdbc-crud-app.war`

---

### Step 6 — Deploy to Tomcat

**Option A — Via VS Code:**
1. Install **Community Server Connectors** extension
2. Press `Ctrl+Shift+P` → **"Servers: Create New Server"**
3. Select **Tomcat 9** and point to your Tomcat folder
4. Right-click `target/jdbc-crud-app.war` → **"Run on Tomcat Server"**

**Option B — Manual Deploy:**
1. Copy `target/jdbc-crud-app.war`
2. Paste into `C:\tomcat9\webapps\`
3. Start Tomcat: `C:\tomcat9\bin\startup.bat`

> ⚠️ If port 8080 is in use, change Tomcat port to 8081 in `C:\tomcat9\conf\server.xml`

---

### Step 7 — Open in Browser

```
http://localhost:8080/jdbc-crud-app/login
```

Or if using port 8081:
```
http://localhost:8081/jdbc-crud-app/login
```

---

## 🔐 Login Credentials

| Field | Value |
|-------|-------|
| Username | `admin` |
| Password | `admin123` |

---

## 🚀 Features & URLs

| Feature | URL | Method |
|---------|-----|--------|
| Login | `/login` | GET / POST |
| View All Users | `/users` | GET |
| Add User Form | `/users?action=add` | GET |
| Save New User | `/users` | POST |
| Edit User Form | `/users?action=edit&id=1` | GET |
| Update User | `/users` | POST |
| Delete User | `/users?action=delete&id=1` | GET |
| Logout | `/users?action=logout` | GET |

---

## 🔧 Common Issues & Fixes

### `JAVA_HOME is not defined`
Set `JAVA_HOME` to your JDK folder path (without `\bin`):
```
C:\Program Files\Java\jdk-17
```

### `mvn: command not found`
Add Maven's `bin` folder to your system `Path` environment variable.

### `Port 8080 already in use`
Kill the process using port 8080:
```cmd
netstat -ano | findstr :8080
taskkill /PID <number> /F
```
Or change Tomcat port to `8081` in `conf/server.xml`.

### `Access denied for user 'admin'`
Run in MySQL:
```sql
ALTER USER 'admin'@'localhost' IDENTIFIED BY 'Mysql123@';
FLUSH PRIVILEGES;
```

### `BUILD FAILURE`
Make sure you are in the root project folder (where `pom.xml` is):
```cmd
cd /d D:\java\jdbc-crud-app2
mvn clean package
```

### `404 Not Found`
Make sure the WAR deployed correctly and Tomcat is running. Check `C:\tomcat9\webapps\` for the `jdbc-crud-app` folder.

---

## 📝 How It Works

```
Browser → LoginServlet → Session Created → UserServlet
                                               ↓
                                          UserDAO (JDBC)
                                               ↓
                                         MySQL Database
```

1. User visits `/login` → `LoginServlet` handles authentication
2. On success, session is created and user is redirected to `/users`
3. `/users` calls `UserDAO` which connects to MySQL via JDBC
4. All CRUD operations go through `UserDAO` → MySQL → back to JSP views

---

## 👨‍💻 Author

**Sailesh Rai**
- GitHub: [@sailesrai789-a11y](https://github.com/sailesrai789-a11y)

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
