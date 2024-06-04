const pg = require('pg')

let config = {
    user: 'postgres',
    database: 'gestion_bibliotheque',
    password: 'razafindratelo',
    port: 5432,
};


let pool = new pg.Pool(config);
function availableBooks() {
    pool.connect(function (err, client) {
        client.query('SELECT title, number_of_pages, release_date, "status", "language" FROM book', (err, res) => {
            console.table(res["rows"])
        })
    });
};

function booksBelongstoASpesificAuthor(authorName) {
    pool.connect(function (err, client) {
        client.query('SELECT title, number_of_pages, release_date, "status", "language" FROM written_by INNER JOIN book ON book.id_book = written_by.id_book INNER JOIN author ON author.id_author = written_by.id_author WHERE author.last_name = "George"', (res, err) => {
            console.table(res["rows"])
        })
        if(err) {
            console.error(err.message);
        }
    })
}

booksBelongstoASpesificAuthor()