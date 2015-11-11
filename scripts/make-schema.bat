set PGUSER=postgres
set PGPASSWORD=postgres
set DB1=pc_migration
@echo on

@rem === create empty db %DB1%

goto next

dropdb -U %PGUSER% --if-exists %DB1% || exit /b
createdb -U %PGUSER% %DB1% || exit /b

:next
@rem === create dynamic schema for %DB1%

set "DB_URL=dbname=%DB1% user=%PGUSER% password=%PGPASSWORD% sslmode=disable"
godep go run ../cmd/db-migrate/make-schema.go
