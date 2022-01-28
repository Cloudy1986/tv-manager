# TV Show Manager

## Database setup instructions

Database setup:
1. Open `psql` via the command line
2. Run `CREATE DATABASE tv_manager;` to set up the tv_manager database
3. Connect to the database `\c tv_manager`
4. Run `CREATE TABLE shows (id SERIAL PRIMARY KEY, title VARCHAR(100));` to set up the shows table with id and title columns

Test database setup:
1. Open `psql` via the command line
2. Run `CREATE DATABASE tv_manager_test;` to set up the tv_manager_test database
3. Connect to the database `\c tv_manager_test`
4. Run `CREATE TABLE shows (id SERIAL PRIMARY KEY, title VARCHAR(100));` to set up the shows table with id and title columns

