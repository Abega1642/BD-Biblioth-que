import pkg from 'pg';
const { Pool } = pkg;


let config = {
    user: 'postgres',
    database: 'gestion_bibliotheque',
    password: 'ando',
    port: 5432,
};

const pool = new Pool(config);

export function searchingBookByTitle(BookTitle) {
    pool.connect(function (err, client) {
        client.query(`
        SELECT
            title, 
            number_of_pages, 
            release_date, 
            "status", 
            "language" 
            FROM book 
            WHERE title ILIKE '%' || $1 || '%'`, [BookTitle], (err, res) => {
            console.table(res["rows"]);
        })
    });
};

export function searchingBookByGenre() {
    pool.connect(function (err, client) {
        client.query(`
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
        GROUP BY genre_name;`, (err, res) => {
            console.table(res["rows"]);
        })
    });
};

export function searchingBookByASpecificGenre(genreName) {
    pool.connect(function (err, client) {
        client.query(`
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
        WHERE genre_name = $1
        GROUP BY genre_name;`,[genreName], (err, res) => {
            console.table(res["rows"]);
        })
    });
};

export function booksAndAuthor(authorName) {
    pool.connect(function (err, client) {
        client.query(`
        SELECT 
            title, 
            number_of_pages, 
            release_date, 
            "status", "language" 
        FROM book INNER JOIN written_by 
            ON book.id_book = written_by.id_book 
        INNER JOIN author 
            ON author.id_author = written_by.id_author 
        WHERE author.last_name = $1`, [authorName], (err, res) => {
            console.table(res.rows);
        });
    });
};

export function borrowerList() {
    pool.connect(function (err, client) {
        client.query(`
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
        `, (err, res) => {
            console.table(res.rows);
        });
    });
}

export function borrowerListEndToday() {
    pool.connect(function (err, client) {
        client.query(`
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
        `, (err, res) => {
            console.table(res.rows);
        });
    });
}

export function borrowerListStartToday() {
    pool.connect(function (err, client) {
        client.query(`
        SELECT 
            id_member,
            last_name,
            first_name,
            phone_number,
            email,
            "start_date",
            title AS Book_Title
        FROM book INNER JOIN borrow
            ON book.id_book = borrow.id_book
        INNER JOIN ON member
            ON member.id_member = borrow.id_member
        WHERE "start_date" = current_date;
        `, (err, res) => {
            console.table(res.rows);
        });
    });
}

export function availableBookLists() {
    pool.connect(function (err, client) {
        client.query(`
        SELECT 
            title
        FROM book
        `, (err, res) => {
            console.table(res.rows);
        });
    });
    
}

