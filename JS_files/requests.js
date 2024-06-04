const pg = require('pg')

let config = {
    user: 'postgres',
    database : 'gestion_bibliotheque',
    password: 'razafindratelo',
    port: 5432,
};

let pool = new pg.Pool(config);

pool.connect(function (err, client, done) {
    client.query('SELECT * FROM "book"', (err, res) => {
        console.table(res["rows"])
    })
});