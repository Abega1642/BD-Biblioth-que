SELECT 
    title, 
    number_of_pages, 
    release_date, 
    "status", 
    "language" 
FROM book WHERE title ilike "%...%";

SELECT 
    title,
    number_of_pages,
    release_date,
    "status",
    "language"
FROM book INNER JOIN written_by
    ON book.id_book = written_by.id_book
INNER JOIN author
    ON author.id_author = written_by.id_author
WHERE author.last_name = '...';

SELECT
    genre_name
    title,
    number_of_pages,
    release_date,
    "status",
    "language"
FROM book INNER JOIN belong 
    ON book.id_book = belong.id_book
INNER JOIN genre
    ON genre.id_genre = belong.id_genre
GROUP BY genre_name;

SELECT 
    id_member,
    last_name,
    first_name,
    phone_number,
    email,
    end_date,
    title AS Book_Title
FROM book INNER JOIN borrow
    ON book.id_book = borrow.id_book
INNER JOIN ON member
    ON member.id_member = borrow.id_member

SELECT 
    id_member,
    last_name,
    first_name,
    phone_number,
    email,
    end_date,
    title AS Book_Title
FROM book INNER JOIN borrow
    ON book.id_book = borrow.id_book
INNER JOIN ON member
    ON member.id_member = borrow.id_member
WHERE end_date = current_date;

SELECT 
    title,
    

select * from author where not exists
(select * from written_by where author.id_author = written_by.id_author);
