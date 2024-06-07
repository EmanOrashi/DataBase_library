use library;
-- 1) find the number of availalbe copies of Dracula 

SELECT COUNT(*) AS available_copies FROM Books
WHERE title = 'Dracula';

-- 2) check total copies of the book 
SELECT COUNT(*) AS total_copies FROM Books;
  
SELECT COUNT(*) AS total_copies_of_dracula FROM Books
WHERE title = 'Dracula';
select * from books;
-- 3)  current total loans of the book 
select count(*) as total_loans_Darcula from loans
where bookid = 12  ;
 -- 4)  total available book 
 select count(*) as total_books_loans from loans;
 
  select count(*) as total_books_loans from loans
  where bookid = 12 ;
 
  -- 5) /* Add new books to the library
INSERT INTO Books (bookid,title, author, published, barcode)
VALUES ( '2001','gentle reminder', 'Bianca Sparacino', '2021', '100471135') ;

-- 6) Check out Books
SELECT bookid, title FROM Books
WHERE title = 'Dracula';

SELECT bookid, title FROM Books;

-- 7) Check books for Due back -- generate a report of books due back on July 13, 2020 -- with patron contact information   
SELECT b.Title, p.patronid , p.firstname FROM loans as l
INNER JOIN Books as b ON l.bookid = b.bookid
INNER JOIN Patrons as p ON l.patronid = p.patronid
WHERE l.duedate = '2020-07-13';

-- 8)/* Return books to the library  
SELECT loanid, bookid, patronid FROM Loans
WHERE duedate = ReturnedDate;

-- 9) Encourage Patrons to check out books 
-- generate a report of showing 10 patrons who have - checked out the fewest books.  
SELECT p.PatronID , p.firstName, COUNT(l.LoanID) AS BooksCheckedOut FROM Patrons as p
LEFT JOIN Loans as l ON p.PatronID = l.PatronID
GROUP BY p.PatronID, p.firstName
ORDER BY bookscheckedout ASC
LIMIT 10;

-- 10) Find books to feature for an event                  
 -- create a list of books from 1890s -- that are currently available 
SELECT b.BookID , b.Title, b.Author, b.Published FROM books as b
WHERE b.Published BETWEEN 1890 AND 1899
AND b.BookID NOT IN (SELECT l.BookID FROM loans as l WHERE l.ReturnedDate IS NULL)   
ORDER BY b.Title ASC;


/* Book Statistics 
/* create a report to show how many books were 
published each year.                                    */
/*******************************************************/
SELECT Published, COUNT(DISTINCT(Title)) AS TotalNumberOfPublishedBooks
FROM Books
GROUP BY Published
ORDER BY TotalNumberOfPublishedBooks DESC;
-- 
SELECT Published, COUNT(*) AS BooksPublished
FROM books b
GROUP BY b.Published
ORDER BY b.Published ASC;
/*************************************************************/
/* Book Statistics                                           */
/* create a report to show 5 most popular Books to check out */
/*************************************************************/
SELECT b.Title, b.Author, b.Published, COUNT(b.Title) AS TotalTimesOfLoans FROM Books as b
JOIN Loans as l ON b.BookID = l.BookID
GROUP BY b.Title
ORDER BY 4 DESC
LIMIT 5;

-- 

SELECT b.BookID, b.Title, b.Author, COUNT(l.LoanID) AS TotalCheckedOut FROM books b
LEFT JOIN loans l ON b.BookID = l.BookID
WHERE l.ReturnedDate IS NULL
GROUP BY b.BookID, b.Title, b.Author
ORDER BY TotalCheckedOut DESC
LIMIT 5;
