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

export function searchingBookByLanguage(language) {
    if (language.toLowerCase() == 'allemand'){
        language = 'german';
    } else if (language.toLowerCase() == 'français' || language.toLowerCase() == 'frantsay' || language.toLowerCase() == 'francais' || language.toLowerCase() == 'französisch'){
        language = 'french';
    } else if (language.toLowerCase() == 'anglais' || language.toLowerCase() == 'angilisy' || language.toLowerCase() == 'englisch') {
        language = 'english';
    }
    pool.connect(function (err, client) {
        client.query(`
        SELECT
            title, 
            number_of_pages, 
            release_date, 
            "status", 
            "language" 
            FROM book 
            WHERE "language" ILIKE '%' || $1 || '%'`, [language], (err, res) => {
            console.table(res["rows"]);
        })
    });
};


export function searchingBookByGenre() {
    pool.connect(function (err, client) {
        client.query(`
        SELECT
            genre.genre_name,
            book.title,
            book.number_of_pages,
            book.release_date,
            book."status",
            book."language"
        FROM book INNER JOIN belong 
            ON book.id_book = belong.id_book
        INNER JOIN genre
        ON genre.id_genre = belong.id_genre
        GROUP BY genre_name,book.title,book.number_of_pages,book.release_date,book."status",book."language";`, (err, res) => {
            console.table(res["rows"]);
        })
    });
};

export function searchingBookByASpecificGenre(genreName) {
    pool.connect(function (err, client) {
        client.query(`
        SELECT
            genre.genre_name,
            book.title,
            book.number_of_pages,
            book.release_date,
            book."status",
            book."language"
        FROM book INNER JOIN belong 
            ON book.id_book = belong.id_book
        INNER JOIN genre
        ON genre.id_genre = belong.id_genre
        GROUP BY genre.genre_name,book.title,book.number_of_pages,book.release_date,book."status",book."language"
        HAVING genre.genre_name = $1;`,[genreName], (err, res) => {
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
            member.id_member,
            member.last_name,
            member.first_name,
            member.phone_number,
            member.email,
            borrow.end_date,
            book.title AS Book_Title
        FROM book INNER JOIN borrow
            ON book.id_book = borrow.id_book
        INNER JOIN member
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
            member.id_member,
            member.last_name,
            member.first_name,
            member.phone_number,
            member.email,
            borrow.end_date,
            book.title AS Book_Title
        FROM book INNER JOIN borrow
            ON book.id_book = borrow.id_book
        INNER JOIN member
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
            member.id_member,
            member.last_name,
            member.first_name,
            member.phone_number,
            member.email,
            borrow."start_date",
            book.title AS Book_Title
        FROM book INNER JOIN borrow
            ON book.id_book = borrow.id_book
        INNER JOIN member
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

export function insertBookToWishList(title, author, descriptions) {
    pool.connect(function (err, client, done) {
        const safeTitle = client.escapeLiteral(title);
        const safeAuthor = client.escapeLiteral(author);
        const safeDescriptions = client.escapeLiteral(descriptions);
        const query = `
            INSERT INTO wishList (title, author, descriptions)
            VALUES (${safeTitle}, ${safeAuthor}, ${safeDescriptions})
        `;
        client.query(query, (err, res) => {
            done();
                console.table(res.rows);
        });
    });
}
