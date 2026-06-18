## Project Overview

# Market Stall Allocation System

## Introduction

The Market Stall Allocation System is a relational database management project designed to improve the administration of market stalls and trader records within a marketplace environment. Traditional manual record-keeping methods can lead to inefficiencies such as duplicate records, allocation conflicts, poor payment tracking, and difficulties in retrieving information.

This system provides a structured database solution that allows market administrators to manage traders, stalls, allocations, registrations, and payment records efficiently. The project demonstrates the practical application of database design principles, normalization, relational modeling, and SQL implementation using MySQL.

---

# Project Objectives

The main objectives of the project are:

* To design and implement a relational database for market stall management.
* To maintain accurate trader information.
* To manage stall records and monitor availability.
* To allocate stalls to registered traders.
* To record registration details and payment information.
* To enforce data integrity using primary and foreign keys.
* To perform data retrieval and reporting using SQL queries.
* To demonstrate database development skills using MySQL and phpMyAdmin.

---

# Problem Statement

Many local markets manage trader and stall information manually through paper records or spreadsheets. Such methods often result in:

* Data redundancy.
* Difficulty tracking stall occupancy.
* Inaccurate payment records.
* Slow retrieval of trader information.
* Poor monitoring of available stalls.

The Market Stall Allocation System addresses these challenges by providing a centralized and structured database that improves record management and data accessibility.

---

# Scope of the System

The system focuses on four major operations:

1. Trader Registration
2. Stall Management
3. Stall Allocation
4. Registration and Payment Tracking

The project is intended for educational purposes and demonstrates database concepts rather than a complete commercial application.

---

# System Requirements

## Hardware Requirements

* Personal Computer
* Minimum 4 GB RAM
* 500 MB Free Storage Space

## Software Requirements

* MySQL Server
* phpMyAdmin
* XAMPP (optional)
* GitHub
* Web Browser

---

# Database Design

The database consists of four interconnected tables:

## 1. Trader Table

Stores information about all registered traders.

### Attributes

| Field Name       | Data Type | Description              |
| ---------------- | --------- | ------------------------ |
| TraderID         | INT       | Unique trader identifier |
| FullName         | VARCHAR   | Trader's full name       |
| PhoneNumber      | VARCHAR   | Contact number           |
| Address          | VARCHAR   | Residential address      |
| TraderType       | VARCHAR   | Type of business         |
| RegistrationDate | DATE      | Registration date        |
| Email            | VARCHAR   | Email address            |

### Primary Key

* TraderID

---

## 2. Stall Table

Stores information about market stalls.

### Attributes

| Field Name  | Data Type | Description             |
| ----------- | --------- | ----------------------- |
| StallID     | INT       | Unique stall identifier |
| StallNumber | VARCHAR   | Stall number            |
| MarketName  | VARCHAR   | Market name             |
| Location    | VARCHAR   | Stall location          |
| StallSize   | VARCHAR   | Stall size              |
| Status      | VARCHAR   | Available or Occupied   |
| MonthlyFee  | DECIMAL   | Monthly rental fee      |

### Primary Key

* StallID

---

## 3. Allocation Table

Stores stall allocation information.

### Attributes

| Field Name       | Data Type | Description                  |
| ---------------- | --------- | ---------------------------- |
| AllocationID     | INT       | Unique allocation identifier |
| TraderID         | INT       | Linked trader                |
| StallID          | INT       | Linked stall                 |
| StartDate        | DATE      | Allocation start date        |
| EndDate          | DATE      | Allocation end date          |
| AllocationStatus | VARCHAR   | Active or Inactive           |

### Primary Key

* AllocationID

### Foreign Keys

* TraderID references Trader(TraderID)
* StallID references Stall(StallID)

---

## 4. Registration Table

Stores registration and payment records.

### Attributes

| Field Name       | Data Type | Description                    |
| ---------------- | --------- | ------------------------------ |
| RegistrationID   | INT       | Unique registration identifier |
| TraderID         | INT       | Linked trader                  |
| AllocationID     | INT       | Linked allocation              |
| RegistrationDate | DATE      | Registration date              |
| FeeAmount        | DECIMAL   | Registration fee               |
| PaymentStatus    | VARCHAR   | Paid or Unpaid                 |
| PaymentDate      | DATE      | Payment date                   |

### Primary Key

* RegistrationID

### Foreign Keys

* TraderID references Trader(TraderID)
* AllocationID references Allocation(AllocationID)

---

# Entity Relationship Overview

The database relationships are as follows:

* One Trader can have multiple Allocations.
* One Stall can have multiple Allocations over time.
* One Allocation belongs to one Trader.
* One Allocation belongs to one Stall.
* One Registration is linked to one Trader.
* One Registration is linked to one Allocation.

These relationships ensure proper data organization and prevent duplication.

---

# Database Normalization

The database design follows normalization principles:

### First Normal Form (1NF)

* All fields contain atomic values.
* No repeating groups.

### Second Normal Form (2NF)

* Non-key attributes depend entirely on the primary key.

### Third Normal Form (3NF)

* No transitive dependencies.
* Data redundancy is minimized.

---

# SQL Operations Implemented

The project demonstrates the use of SQL commands including:

## Data Definition Language (DDL)

* CREATE DATABASE
* CREATE TABLE
* ALTER TABLE
* DROP TABLE

## Data Manipulation Language (DML)

* INSERT
* UPDATE
* DELETE

## Data Query Language (DQL)

* SELECT
* WHERE
* ORDER BY
* GROUP BY
* JOIN

---

# Sample Queries

### Display All Traders

```sql
SELECT * FROM Trader;
```

### Display Available Stalls

```sql
SELECT * FROM Stall
WHERE Status = 'Available';
```

### Display Allocated Stalls and Traders

```sql
SELECT T.FullName, S.StallNumber
FROM Allocation A
JOIN Trader T ON A.TraderID = T.TraderID
JOIN Stall S ON A.StallID = S.StallID;
```

### Display Paid Registrations

```sql
SELECT *
FROM Registration
WHERE PaymentStatus = 'Paid';
```

---

# Features

## Trader Registration

Allows administrators to register and maintain trader records.

## Stall Management

Stores information about available and occupied stalls.

## Stall Allocation Tracking

Records which trader occupies which stall.

## Registration Management

Maintains trader registration records.

## Payment Tracking

Tracks registration fees and payment status.

## Data Retrieval

Provides fast access to trader, stall, allocation, and payment information.

---

# Technologies Used

* MySQL Database Management System
* phpMyAdmin
* SQL
* GitHub

---

# Project Structure

```text
Market-Stall-Allocation-System
│
├── SQL
│   └── MarketStallDB.sql
│
├── Diagrams
│   └── Physical_Data_Model.png
│
├── Screenshots
│   ├── DatabaseCreation.png
│   ├── TablesCreated.png
│   └── QueryResults.png
│
├── Report
│   └── Market_Stall_Allocation_Report.docx
│
└── README.md
```

---

# Contributors

| Name               | Student ID |
| ------------------ | ---------- |
| Abdul Aziz Sesay   | XXXXXXXX   |
| Sharon Mary Koroma | 905006201  |
| Member 3           | XXXXXXXX   |

---

# Learning Outcomes

Through this project, the following skills were demonstrated:

* Database Design
* Relational Modeling
* Primary and Foreign Key Implementation
* Database Normalization
* SQL Query Development
* Data Integrity Management
* Database Documentation
* Version Control using GitHub

---

# Conclusion

The Market Stall Allocation System successfully demonstrates the design and implementation of a relational database using MySQL. The system provides an organized method for managing traders, stalls, allocations, registrations, and payments while maintaining data integrity through relational database principles. The project serves as a practical example of database analysis, design, implementation, and querying within a real-world market management scenario.

---

# Academic Purpose

This project was developed as part of a Database Systems coursework assignment for academic purposes. The project demonstrates database design, implementation, normalization, and SQL query execution using MySQL and phpMyAdmin.

