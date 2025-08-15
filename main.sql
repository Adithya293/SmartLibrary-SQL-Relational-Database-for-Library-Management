-- Create Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Table: Authors
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

-- Table: Books
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author_id INT,
    genre VARCHAR(50),
    published_year INT,
    available_copies INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Table: Members
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    join_date DATE,
    email VARCHAR(100) UNIQUE
);

-- Table: BorrowedBooks
CREATE TABLE BorrowedBooks (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert sample Authors
INSERT INTO Authors (name, country) VALUES
('J.K. Rowling', 'UK'),
('George R.R. Martin', 'USA'),
('Chetan Bhagat', 'India');

-- Insert sample Books
INSERT INTO Books (title, author_id, genre, published_year, available_copies) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 'Fantasy', 1997, 5),
('A Game of Thrones', 2, 'Fantasy', 1996, 3),
('Five Point Someone', 3, 'Fiction', 2004, 4);

-- Insert sample Members
INSERT INTO Members (name, join_date, email) VALUES
('Amit Kumar', '2023-01-15', 'amit@example.com'),
('Sneha Verma', '2023-02-20', 'sneha@example.com');

-- Borrow books
INSERT INTO BorrowedBooks (member_id, book_id, borrow_date, return_date) VALUES
(1, 1, '2025-08-10', NULL),
(2, 2, '2025-08-12', '2025-08-14');

-- Queries

-- 1. List all books with author names
SELECT b.title, a.name AS author, b.genre, b.published_year, b.available_copies
FROM Books b
JOIN Authors a ON b.author_id = a.author_id;

-- 2. List all borrowed books and who borrowed them
SELECT m.name AS member, b.title, bb.borrow_date, bb.return_date
FROM BorrowedBooks bb
JOIN Members m ON bb.member_id = m.member_id
JOIN Books b ON bb.book_id = b.book_id;

-- 3. Show available fantasy books
SELECT title FROM Books
WHERE genre = 'Fantasy' AND available_copies > 0;

-- 4. Count books by each author
SELECT a.name, COUNT(b.book_id) AS total_books
FROM Authors a
LEFT JOIN Books b ON a.author_id = b.author_id
GROUP BY a.name;
