# Market Stall Allocation System

## Project Overview

The Market Stall Allocation System is a relational database project developed to improve the management of market stalls and trader information. The system enables market administrators to register traders, manage stall allocations, track registrations, and monitor payment records efficiently.

The project was implemented using MySQL and follows database design principles including entity relationships, primary keys, foreign keys, and data integrity constraints.

---

## Project Objectives

- Store trader information in a structured database.
- Manage market stall records and availability.
- Track stall allocations assigned to traders.
- Record registration and payment details.
- Demonstrate the use of SQL for database creation, data manipulation, and querying.

---

## Database Tables

The system consists of four main tables:

### Trader
Stores trader details including:
- Trader ID
- Full Name
- Phone Number
- Address
- Trader Type
- Registration Date
- Email

### Stall
Stores stall information including:
- Stall ID
- Stall Number
- Market Name
- Location
- Stall Size
- Status
- Monthly Fee

### Allocation
Stores allocation records linking traders and stalls:
- Allocation ID
- Trader ID
- Stall ID
- Start Date
- End Date
- Allocation Status

### Registration
Stores registration and payment information:
- Registration ID
- Trader ID
- Allocation ID
- Registration Date
- Fee Amount
- Payment Status
- Payment Date

---

## Technologies Used

- MySQL
- phpMyAdmin
- GitHub

---

## Project Structure

```
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

## Features

- Trader Registration
- Stall Management
- Stall Allocation Tracking
- Registration and Payment Tracking
- SQL Query Execution
- Database Relationship Management

---

## Contributors

- Abdul Aziz Sesay
- Member 2 Name
- Member 3 Name

---

## Academic Purpose

This project was developed as part of a Database Systems coursework assignment to demonstrate database design, implementation, and SQL query execution using MySQL.
