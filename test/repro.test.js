"use strict";

const mssql = require('mssql');
const { resolve } = require('mssql/lib/connectionstring')

const connString = 'Data Source=tcp:localhost,1433;Initial Catalog=mssql_test;User Id=sa;Password=Upper_l0wercase;Encrypt=true;';

describe('node-mssql-repro', () => {
    let connection;
    before('connect', async () => {
        connection = await mssql.connect({
            ...resolve(connString),
        })
    });
    after('disconnect', async () => {
        await connection.close();
    });
    it('breaks as expected :-)');
});
