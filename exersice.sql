-- Find all subjects sorted by subject
SELECT subject, location FROM subjects ORDER BY subject;

-- Find all subjects sorted by location
SELECT subject, location FROM subjects ORDER BY location;

-- Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';

-- Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python%';

-- Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location LIKE '%Main St%' ORDER BY subject;

-- Find all books about Computers and list ONLY the book titles
SELECT books.title, subjects.subject 
FROM books INNER JOIN subjects 
ON books.subject_id = subjects.id WHERE subject = 'Computers';

-- Find all books and display a result table with ONLY the following columns: Book title, Author's first and last name, book subject
SELECT books.title, authors.first_name, authors.last_name, subjects.subject 
FROM((books INNER JOIN authors ON books.author_id = authors.id) 
(INNER JOIN subjects ON books.subject_id = subjects.id);

-- Find all books that are listed in the stock table, sort by retail price (high to low) and display only title and price
SELECT books.title, stock.retail
FROM((books
INNER JOIN editions ON books.id = editions.book_id)
INNER JOIN stock ON stock.isbn = editions.isbn)
ORDER BY stock.retail DESC;

-- Find the book "Dune" and display ONLY Book Title, ISBN number, Publisher name, retail price
SELECT books.title, stock.isbn, publishers.name, stock.retail
FROM (((books
INNER JOIN editions ON books.id = editions.book_id)
INNER JOIN stock ON stock.isbn = editions.isbn)
INNER JOIN publishers ON publishers.id = editions.publisher_id)
WHERE title='Dune';

-- Find all shipments sorted by ship date, display results with ONLY customer first name, customer last name, ship date, book title
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title
FROM (((books
INNER JOIN editions ON books.id = editions.book_id)
INNER JOIN shipments ON shipments.isbn = editions.isbn)
INNER JOIN customers ON customers.id = shipments.customer_id)
ORDER BY shipments.ship_date;

-- Get the COUNT of all books
SELECT COUNT(*) FROM books;

-- Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;

-- Get the COUNT of each unique location in the subject table. Display the count and the location name.
SELECT COUNT(location), location FROM subjects GROUP BY location;

-- List all books. Display the book_id, title, and a count of how many editions each book has.
SELECT books.id, books.title, COUNT(editions.edition) 
FROM books INNER JOIN editions 
ON books.id = editions.book_id GROUP BY books.id;
