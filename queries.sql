QUESTIONS ON JOIN

Find all books about Computers and list ONLY the book titles
SELECT b.title  FROM books b 
INNER JOIN subjects s 
ON b.subject_id= s.id 
WHERE s.subject = 'Computers';

Find all books and display a result table with ONLY the following columns
	* Book title
	* Author's first name
	* Author's last name
	* Book subject

SELECT b.title, a.first_name, a.last_name, s.subject FROM books b   
INNER JOIN subjects s ON   b.subject_id= s.id                                                                                    
INNER JOIN authors a ON               
b.author_id = a.id;

Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price

 SELECT b.title, st.retail FROM stock st
 INNER JOIN editions e ON st.isbn = e.isbn 
 INNER JOIN books b ON b.id = e.book_id
 ORDER BY st.retail DESC;

 Find the book "Dune" and display ONLY the following columns
	* Book title
	* ISBN number
	* Publisher name
	* Retail price
 SELECT b.title, e.isbn, p.name, st.retail  FROM stock st     
 INNER JOIN editions e ON st.isbn = e.isbn            
 INNER JOIN books b ON b.id = e.book_id  
 INNER JOIN publishers p ON p.id = e.publisher_id                                           
 WHERE b.title ='Dune';

Find all shipments sorted by ship date display a result table with ONLY the following columns:
	* Customer first name
	* Customer last name
	* ship date
	* book title
 SELECT c.first_name, c.last_name, sh.ship_date, b.title 
 FROM shipments sh 
 INNER JOIN customers c ON c.id = sh.customer_id
 INNER JOIN editions e ON  e.isbn = sh.isbn
 INNER JOIN books b ON b.id = e.book_id
 ORDER BY sh.ship_date;

 ### Grouping and Counting

 Get the COUNT of all books
 SELECT COUNT(*) FROM books;

 Get the COUNT of all Locations:
 SELECT COUNT(location) FROM subjects;
 SELECT COUNT(DISTINCT location) FROM subjects; For distinct locations

 Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
 SELECT  COUNT(location), location FROM subjects GROUP BY location;

 List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
 SELECT b.id, b.title, COUNT(e.book_id)
 FROM books b 
 LEFT JOIN editions e ON e.book_id = b.id 
 GROUP BY b.id;


