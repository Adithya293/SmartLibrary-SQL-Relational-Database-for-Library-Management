# SmartLibrary SQL – Relational Database for Library Management

## 📖 Project Overview
SmartLibrary SQL is a relational database project designed to efficiently manage library operations such as tracking books, authors, members, and borrowed records.  
It uses **MySQL** (or any SQL-based RDBMS) to store, organize, and retrieve library data with ease.  

## 🎯 Features
- Manage **Authors**, **Books**, **Members**, and **Borrowed Books** records.
- Store relationships between authors and books.
- Track borrowing and returning of books.
- Generate reports such as:
  - List of available books
  - Borrowing history
  - Books per author
- Simple queries for fast access to information.

## 🗂 Database Structure
The project contains the following tables:
1. **Authors** – Stores author details.
2. **Books** – Stores book details and references authors.
3. **Members** – Stores library member details.
4. **BorrowedBooks** – Tracks books borrowed by members.

## 🛠 Technologies Used
- **MySQL** (or any SQL-compatible database)
- **SQL Queries** for CRUD operations and reporting.

## 📜 Installation & Setup
1. Install MySQL on your system.
2. Create a new database:
   ```sql
   CREATE DATABASE LibraryDB;
   USE LibraryDB;
