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

select * from author where not exists
(select * from written_by where author.id_author = written_by.id_author);
