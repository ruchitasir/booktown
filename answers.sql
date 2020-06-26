 1. Find all subjects sorted by subject

SELECT * FROM subjects ORDER BY subject;

 id |     subject      |     location     
----+------------------+------------------
  0 | Arts             | Creativity St
  1 | Business         | Productivity Ave
  2 | Children's Books | Kids Ct
  3 | Classics         | Academic Rd
  4 | Computers        | Productivity Ave
  5 | Cooking          | Creativity St
  6 | Drama            | Main St
  7 | Entertainment    | Main St
  8 | History          | Academic Rd
  9 | Horror           | Black Raven Dr
 10 | Mystery          | Black Raven Dr
 11 | Poetry           | Sunset Dr
 12 | Religion         | 
 13 | Romance          | Main St
 14 | Science          | Productivity Ave
 15 | Science Fiction  | Main St
(16 rows)

2. Find all subjects sorted by location

SELECT * FROM subjects ORDER BY location;

 id |     subject      |     location     
----+------------------+------------------
  8 | History          | Academic Rd
  3 | Classics         | Academic Rd
 10 | Mystery          | Black Raven Dr
  9 | Horror           | Black Raven Dr
  0 | Arts             | Creativity St
  5 | Cooking          | Creativity St
  2 | Children's Books | Kids Ct
  7 | Entertainment    | Main St
  6 | Drama            | Main St
 13 | Romance          | Main St
 15 | Science Fiction  | Main St
 14 | Science          | Productivity Ave
  4 | Computers        | Productivity Ave
  1 | Business         | Productivity Ave
 11 | Poetry           | Sunset Dr
 12 | Religion         | 

 3. Find the book "Little Women"

 SELECT * FROM books where title = 'Little Women';
 id  |    title     | author_id | subject_id 
-----+--------------+-----------+------------
 190 | Little Women |        16 |          6


 4.Find all books containing the word "Python"
 SELECT * FROM books where title LIKE  '%Python%';
  id   |       title        | author_id | subject_id 
-------+--------------------+-----------+------------
 41473 | Programming Python |      7805 |          4
 41477 | Learning Python    |      7805 |          4
(2 rows)


5.Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects where location = 'Main St' ORDER BY subject;
 id |     subject     | location 
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St
(4 rows)

6. Find all books about Computers and list ONLY the book titles
    SELECT b.title  FROM books b INNER JOIN subjects s on b.subject_id= s.id WHERE s.subject = 'Computers';
        title         
----------------------
 Practical PostgreSQL
 Perl Cookbook
 Learning Python
 Programming Python
(4 rows)

7. Find all books and display a result table with ONLY the following columns
	* Book title
	* Author's first name
	* Author's last name
	* Book subject

    
SELECT b.title, a.first_name, a.last_name, s.subject FROM books b   
INNER JOIN subjects s ON   b.subject_id= s.id                                                                                    
INNER JOIN authors a ON               
b.author_id = a.id;




  title            |    first_name    |  last_name   |     subject      
-----------------------------+------------------+--------------+------------------
 Practical PostgreSQL        | John             | Worsley      | Computers
 Franklin in the Dark        | Paulette         | Bourgeois    | Children's Books
 The Velveteen Rabbit        | Margery Williams | Bianco       | Classics
 Little Women                | Louisa May       | Alcott       | Drama
 The Shining                 | Stephen          | King         | Horror
 Dune                        | Frank            | Herbert      | Science Fiction
 Dynamic Anatomy             | Burne            | Hogarth      | Arts
 Goodnight Moon              | Margaret Wise    | Brown        | Children's Books
 The Tell-Tale Heart         | Edgar Allen      | Poe          | Horror
 Programming Python          | Mark             | Lutz         | Computers
 Learning Python             | Mark             | Lutz         | Computers
 Perl Cookbook               | Tom              | Christiansen | Computers
 2001: A Space Odyssey       | Arthur C.        | Clarke       | Science Fiction
The Cat in the Hat          | Theodor Seuss    | Geisel       | Children's Books
 Bartholomew and the Oobleck | Theodor Seuss    | Geisel       | Children's Books


SELECT b.title, a.first_name, a.last_name, s.subject FROM books b   
LEFT JOIN subjects s ON   b.subject_id= s.id                                                                                    
LEFT JOIN authors a ON               
b.author_id = a.id;
          title            |    first_name    |  last_name   |     subject      
-----------------------------+------------------+--------------+------------------
 Practical PostgreSQL        | John             | Worsley      | Computers
 Franklin in the Dark        | Paulette         | Bourgeois    | Children's Books
 The Velveteen Rabbit        | Margery Williams | Bianco       | Classics
 Little Women                | Louisa May       | Alcott       | Drama
 The Shining                 | Stephen          | King         | Horror
 Dune                        | Frank            | Herbert      | Science Fiction
 Dynamic Anatomy             | Burne            | Hogarth      | Arts
 Goodnight Moon              | Margaret Wise    | Brown        | Children's Books
 The Tell-Tale Heart         | Edgar Allen      | Poe          | Horror
 Programming Python          | Mark             | Lutz         | Computers
 Learning Python             | Mark             | Lutz         | Computers
 Perl Cookbook               | Tom              | Christiansen | Computers
 2001: A Space Odyssey       | Arthur C.        | Clarke       | Science Fiction
The Cat in the Hat          | Theodor Seuss    | Geisel       | Children's Books
 Bartholomew and the Oobleck | Theodor Seuss    | Geisel       | Children's Books


* Find all books that are listed in the stock table
	* Sort them by retail price (most expensive first)
	* Display ONLY: title and price

SELECT b.title, st.retail FROM stock st
 INNER JOIN editions e ON st.isbn = e.isbn 
 INNER JOIN books b ON b.id = e.book_id
 ORDER BY st.retail DESC;


title            | retail 
-----------------------------+--------
 2001: A Space Odyssey       |  46.95
 Dune                        |  45.95
 The Shining                 |  36.95
 The Cat in the Hat          |  32.95
 Goodnight Moon              |  28.95
 The Shining                 |  28.95
 Dynamic Anatomy             |  28.95
 The Tell-Tale Heart         |  24.95
 The Velveteen Rabbit        |  24.95
 The Cat in the Hat          |  23.95
 Franklin in the Dark        |  23.95
 Little Women                |  23.95
 2001: A Space Odyssey       |  22.95
The Tell-Tale Heart         |  21.95
 Dune                        |  21.95




* Find the book "Dune" and display ONLY the following columns
	* Book title
	* ISBN number
	* Publisher name
	* Retail price
SELECT b.title, e.isbn, p.name, st.retail  FROM stock st     
INNER JOIN editions e ON st.isbn = e.isbn            
 INNER JOIN books b ON b.id = e.book_id  
 INNER JOIN publishers p ON p.id = e.publisher_id                                           
WHERE b.title ='Dune';
 title |    isbn    |   name    | retail 
-------+------------+-----------+--------
 Dune  | 0441172717 | Ace Books |  21.95
 Dune  | 044100590X | Ace Books |  45.95


* Find all shipments sorted by ship date display a result table with ONLY the following columns:
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

 first_name | last_name |       ship_date        |            title            
------------+-----------+------------------------+-----------------------------
 Owen       | Bollman   | 2001-08-05 09:34:04-07 | Little Women
 Laura      | Bennett   | 2001-08-06 07:49:44-07 | Goodnight Moon
 Chad       | Allen     | 2001-08-06 09:29:21-07 | The Cat in the Hat
 Annie      | Jackson   | 2001-08-06 11:46:36-07 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-07 10:58:36-07 | Bartholomew and the Oobleck
 Royce      | Morrill   | 2001-08-07 11:31:57-07 | The Tell-Tale Heart
 Christine  | Holloway  | 2001-08-07 11:56:42-07 | 2001: A Space Odyssey
 Eric       | Morrill   | 2001-08-07 13:00:48-07 | Little Women
 Jonathan   | Anderson  | 2001-08-08 08:36:44-07 | The Shining
 Ed         | Gould     | 2001-08-08 09:53:46-07 | The Shining
 Annie      | Jackson   | 2001-08-08 10:46:13-07 | Bartholomew and the Oobleck
 Dave       | Olson     | 2001-08-09 07:30:07-07 | The Velveteen Rabbit
 Wendy      | Black     | 2001-08-09 09:30:46-07 | The Velveteen Rabbit
 Rich       | Thomas    | 2001-08-10 07:29:52-07 | Franklin in the Dark
 Jean       | Black     | 2001-08-10 08:29:42-07 | The Tell-Tale Heart
 Eric       | Morrill   | 2001-08-10 13:47:52-07 | The Cat in the Hat
 Annie      | Jackson   | 2001-08-11 09:55:05-07 | Bartholomew and the Oobleck
 Richard    | Brown     | 2001-08-11 10:52:34-07 | Goodnight Moon
 James      | Williams  | 2001-08-11 13:34:08-07 | The Cat in the Hat
 Kate       | Gerdes    | 2001-08-12 08:46:35-07 | Dune
 Jean       | Owens     | 2001-08-12 12:09:47-07 | Franklin in the Dark
 Owen       | Becker    | 2001-08-12 13:39:22-07 | The Shining
 Julie      | Bollman   | 2001-08-13 09:42:10-07 | The Cat in the Hat
 Kathy      | Corner    | 2001-08-13 09:47:04-07 | The Cat in the Hat
 Tim        | Owens     | 2001-08-14 07:33:47-07 | Dynamic Anatomy
 Trevor     | Young     | 2001-08-14 08:42:58-07 | Dune
 Chuck      | Brown     | 2001-08-14 10:36:41-07 | The Shining
 Adam       | Holloway  | 2001-08-14 13:41:39-07 | The Tell-Tale Heart
 Jenny      | King      | 2001-08-14 13:45:51-07 | The Shining
 Tammy      | Robinson  | 2001-08-14 13:49:00-07 | Franklin in the Dark
 James      | Clark     | 2001-08-15 11:57:40-07 | Goodnight Moon
 Shirley    | Gould     | 2001-08-15 14:02:01-07 | 2001: A Space Odyssey
 Jenny      | King      | 2001-09-14 16:46:32-07 | The Cat in the Hat
 Annie      | Jackson   | 2001-09-14 17:42:22-07 | The Cat in the Hat
 Annie      | Jackson   | 2001-09-22 11:23:28-07 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-09-22 20:58:56-07 | Bartholomew and the Oobleck

36 rows:



### Grouping and Counting

* Get the COUNT of all books
SELECT COUNT(*) FROM books;
 count 
-------
    15
(1 row)



* Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
 count 
-------
    15
(1 row)

SELECT COUNT(DISTINCT location) FROM subjects;
 count 
-------
     7
(1 row)


* Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, COUNT(location) FROM subjects GROUP BY location;
     location     | count 
------------------+-------
                  |     0
 Sunset Dr        |     1
 Kids Ct          |     1
 Black Raven Dr   |     2
 Creativity St    |     2
 Academic Rd      |     2
 Main St          |     4
 Productivity Ave |     3
(8 rows)


SELECT  COUNT(location), location FROM subjects GROUP BY location;
 count |     location     
-------+------------------
     0 | 
     1 | Sunset Dr
     1 | Kids Ct
     2 | Black Raven Dr
     2 | Creativity St
     2 | Academic Rd
     4 | Main St
     3 | Productivity Ave
(8 rows)




 List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT b.id, b.title, COUNT(e.book_id)
FROM books b 
LEFT JOIN editions e ON e.book_id = b.id 
GROUP BY b.id;

id   |            title            | count 
-------+-----------------------------+-------
 41477 | Learning Python             |     0
 25908 | Franklin in the Dark        |     1
 41478 | Perl Cookbook               |     0
   190 | Little Women                |     1
  1501 | Goodnight Moon              |     1
   156 | The Tell-Tale Heart         |     2
 41472 | Practical PostgreSQL        |     0
  2038 | Dynamic Anatomy             |     1
  7808 | The Shining                 |     2
  4267 | 2001: A Space Odyssey       |     2
 41473 | Programming Python          |     1
  1234 | The Velveteen Rabbit        |     1
  4513 | Dune                        |     2
  1608 | The Cat in the Hat          |     2
  1590 | Bartholomew and the Oobleck |     1



 id   |            title            | count 
-------+-----------------------------+-------
  2038 | Dynamic Anatomy             |     1
 25908 | Franklin in the Dark        |     1
  7808 | The Shining                 |     2
  4267 | 2001: A Space Odyssey       |     2
 41473 | Programming Python          |     1
  1234 | The Velveteen Rabbit        |     1
  4513 | Dune                        |     2
  1608 | The Cat in the Hat          |     2
   190 | Little Women                |     1
  1501 | Goodnight Moon              |     1
   156 | The Tell-Tale Heart         |     2
  1590 | Bartholomew and the Oobleck |     1
(12 rows)