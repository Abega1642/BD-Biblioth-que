const pg = require('pg')

let config = {
    user: 'postgres',
    database : 'gestion_bibliotheque',
    password: 'razafindratelo',
    port: 5432,
};

let pool = new pg.Pool(config);

function searchingBookByTitle(BookTitle) {
    pool.connect(function (err, client) {
        client.query(`SELECT title, number_of_pages, release_date, "status", "language" FROM book WHERE title ilike "%$1%`, [BookTitle], (err, res) => {
            console.table(res["rows"]);
        })
    });
};

function booksAndAuthor(authorName) {
    pool.connect(function (err, client) {
        if (err) {
            console.error('Erreur de connexion à la base de données :', err);
            return;
        }

        client.query(`SELECT title, number_of_pages, release_date, "status", "language" FROM book INNER JOIN written_by ON book.id_book = written_by.id_book INNER JOIN author ON author.id_author = written_by.id_author WHERE author.last_name = $1`, [authorName], (err, res) => {
            if (err) {
                console.error('Erreur lors de l\'exécution de la requête SQL :', err);
                return;
            }
            console.table(res.rows);
        });
    });
}