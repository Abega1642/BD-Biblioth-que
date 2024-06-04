SELECT 
    title, 
    number_of_pages, 
    release_date, 
    "status", 
    "language" 
FROM book

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
WHERE author.last_name = 'George';