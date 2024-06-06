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
        GROUP BY "genre".genre_name,"book".title,"book".number_of_pages,"book".release_date,"book"."status","book"."language"
        HAVING "genre".genre_name ILIKE '%' || $1 || '%'`,[genreName], (err, res) => {
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
            "status", 
            "language" 
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
            book.title AS "The title of the book"
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
            book.title AS "The title of the book"
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

export function insertBookToWishList(title, author, descriptions, id_member) {
    pool.connect(function (err, client) {
        const safeTitle = client.escapeLiteral(title);
        const safeAuthor = client.escapeLiteral(author);
        const safeDescriptions = client.escapeLiteral(descriptions);
        const query = `
            INSERT INTO wishList (title, author, descriptions)
            VALUES (${safeTitle}, ${safeAuthor}, ${safeDescriptions}, ${id_member})
        `;
        client.query(query, (err, res) => {
                console.table(res.rows);
                console.log("\t------ Merci, votre demande a bien été enregistrée ------\n");
        });
    });
}

export function insertBookToWishList2(title, author, descriptions, id_member) {
    pool.connect(function (err, client, done) {
        if (err) {
            console.error('Erreur lors de la connexion à la base de données :', err);
            return;
        }
        const query = `
            INSERT INTO wishList (title, author, descriptions, id_member)
            VALUES ($1, $2, $3, $4)
        `;
        const values = [title, author, descriptions, id_member];
        client.query(query, values, (err, res) => {
            done();
            if (err) {
                console.error('Erreur lors de la requête :', err);
                return;
            }
            console.log("\t------ Merci, votre demande a bien été enregistrée ------\n");
        });
    });
}

export function nonBorrowable() {
    pool.connect(function (err, client) {
        client.query(`
        SELECT 
            title, 
            number_of_pages, 
            release_date, 
            "status", 
            "language" 
        FROM book
        WHERE "status" = 'N'
        `, (err, res) => {
            console.table(res.rows);
        });
    });
};

export function numberOfAvailableBooks() {
    pool.connect(function (err, client) {
        client.query(`
        SELECT 
            COUNT(*) AS "The number of all available books"
        FROM book
        `, (err, res) => {
            console.table(res.rows);
        });
    });
};

export function numberOfmembers() {
    pool.connect(function (err, client) {
        client.query(`
        SELECT 
            COUNT(*) AS "The number of all members"
        FROM member
        `, (err, res) => {
            console.table(res.rows);
        });
    });
};

export function TwemtyMostBorrowedBooks() {
    pool.connect(function (err, client) {
        client.query(`
        SELECT 
            book.title AS "The title of the book",
            COUNT(*) AS "The number of book borrowing"
        FROM book INNER JOIN borrow
            ON book.id_book = borrow.id_book
        GROUP BY book.title
        ORDER BY COUNT(*) DESC LIMIT 20
        `, (err, res) => {
            console.table(res.rows);
        });
    });
};

export function TwemtyMostActivMembers() {
    pool.connect(function (err, client) {
        client.query(`
        SELECT 
            member.last_name,
            member.first_name,
            COUNT(*) AS "The number of book borrowing"
        FROM member INNER JOIN borrow
            ON member.id_member = borrow.id_member
        GROUP BY member.last_name, member.first_name
        ORDER BY COUNT(*) DESC LIMIT 20
        `, (err, res) => {
            console.table(res.rows);
        });
    });
};

export function TwemtyMostWishedBooks() {
    pool.connect(function (err, client) {
        client.query(`
        SELECT 
            title,
            author,
            COUNT(*) AS "The number of ask"
        FROM wishList
        GROUP BY title, author
        ORDER BY COUNT(*) DESC LIMIT 20
        `, (err, res) => {
            console.table(res.rows);
        });
    });
};
