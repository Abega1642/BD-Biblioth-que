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
})


    echo "# Base de Données -- Bibliothèque" >> README.md
    git init
    git add README.md
    git commit -m "feat: creating readme.md"
    git branch -M main
    git remote add origin https://github.com/Abega1642/BD-Biblioth-que.git
    git push -u origin main