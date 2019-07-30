#!/usr/bin/env bash
set -e

echo "Building Docker images"
docker-compose build mssql

echo "Bringing up Docker infrastructure"
docker-compose up -d mssql

echo "Waiting for MSSQL to become available"

DB_READY=0

set +e
for i in {1..30}; do
    docker-compose exec -T mssql /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'Upper_l0wercase' -b -Q 'SELECT 1' -e
    if [ "$?" -ne 0 ]; then
        sleep 1s
    else
        echo "MSSQL ready after $i attempts"
        DB_READY=1
        break
    fi
done
set -e

if [ "${DB_READY}" -eq 0 ]; then
    >&2 echo "Unable to start database container"
    exit 1
fi

echo "Creating schema mssql_test"
docker-compose exec -T mssql /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'Upper_l0wercase' -b -Q 'CREATE DATABASE mssql_test;' -e

echo "Importing schema"
docker-compose exec -T mssql /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'Upper_l0wercase' -d 'mssql_test' -b -i '/tmp/schema.sql' -e -I

# Set connection string for later use:
export SQLAZURECONNSTR_ConnString="Data Source=tcp:localhost,1433;Initial Catalog=mssql_test;User Id=sa;Password=Upper_l0wercase;Encrypt=true;"
