# node-mssql-repro

Reproduce node-mssql issues.

0. `npm install`
1. Set up your sample schema, data and stored procedures, if any, inside `docker/mssql/schema.sql`
2. Write your test code and run the code with `npm t`
3. Validate the demonstration in its entirety using `bash test.sh`
4. If you need to start fresh: `docker-compose down -v; bash test.sh`. This kills the MSSQL container and deletes any state.

## Notes

This uses the latest edition of SQL Server and node-mssql; be sure to install specific versions if you have a BC issue.
