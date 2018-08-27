'use strict';

const loopback = require('loopback');
const promisify = require('util').promisify;
const fs = require('fs');
const writeFile = promisify(fs.writeFile);
const mkdirp = promisify(require('mkdirp'));

const app = loopback();
const db = app.dataSource('db', {
  connector: 'mysql',
  user: 'root',
  password: "123456",
});


discover().then(
  success => process.exit(),
  error => { console.error('UNHANDLED ERROR:\n', error); process.exit(1); },
);

async function discover() {
  const schema = await db.discoverSchema(
    'usuarios', // the table name
    {
      schema: 'usuarios' // the database/schema name
    },
  );

  await mkdirp('common/models');
  await writeFile(
    'common/models/usuarios.json',
    JSON.stringify(schema, null, 2)
  );
}
