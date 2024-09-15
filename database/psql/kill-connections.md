# Kill connections

- List all current connections

    ```
    SELECT pid, usename, datname, client_addr, state
    FROM pg_stat_activity
    WHERE datname = 'your_database_name';

    ```

- Kill connection by specific PID

    ```
    SELECT pg_terminate_backend(pid)
    FROM pg_stat_activity
    WHERE pid = <PID>;
    ```

- Kill all connections

    ```
    SELECT pg_terminate_backend(pid)
    FROM pg_stat_activity
    WHERE datname = 'your_database_name'
    AND pid <> pg_backend_pid();
    ```

## Example 

```
% psql -U postgres -d airbnb_development 
psql (14.13 (Homebrew))
Type "help" for help.

airbnb_development=# SELECT pid, usename, datname, client_addr, state
FROM pg_stat_activity
WHERE datname = 'airbnb_development';

    pid  | usename |      datname       | client_addr | state  
    -------+---------+--------------------+-------------+--------
    23507 | postgres   | airbnb_development |             | idle
    24006 | postgres   | airbnb_development |             | idle
    29374 | postgres   | airbnb_development |             | idle
    30654 | postgres   | airbnb_development |             | idle
    30855 | postgres   | airbnb_development |             | idle
    31330 | postgres   | airbnb_development |             | idle
    31756 | postgres   | airbnb_development |             | active
    (7 rows)

airbnb_development=# SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE pid = 23507;

    pg_terminate_backend 
    ----------------------
    t
    (1 row)

airbnb_development=# SELECT pid, usename, datname, client_addr, state
FROM pg_stat_activity
WHERE datname = 'airbnb_development';

    pid  | usename |      datname       | client_addr | state  
    -------+---------+--------------------+-------------+--------
    24006 | postgres   | airbnb_development |             | idle
    29374 | postgres   | airbnb_development |             | idle
    30654 | postgres   | airbnb_development |             | idle
    30855 | postgres   | airbnb_development |             | idle
    31330 | postgres   | airbnb_development |             | idle
    31756 | postgres   | airbnb_development |             | active
    (6 rows)

airbnb_development=#  SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE pid = 24006;

    pg_terminate_backend 
    ----------------------
    t
    (1 row)

airbnb_development=# SELECT pid, usename, datname, client_addr, state
FROM pg_stat_activity
WHERE datname = 'airbnb_development';

    pid  | usename |      datname       | client_addr | state  
    -------+---------+--------------------+-------------+--------
    29374 | postgres   | airbnb_development |             | idle
    30654 | postgres   | airbnb_development |             | idle
    30855 | postgres   | airbnb_development |             | idle
    31330 | postgres   | airbnb_development |             | idle
    31756 | postgres   | airbnb_development |             | active
    (5 rows)

airbnb_development=# SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'airbnb_development'
AND pid <> pg_backend_pid();

    pg_terminate_backend 
    ----------------------
    t
    t
    t
    t
    (4 rows)

airbnb_development=# SELECT pid, usename, datname, client_addr, state
FROM pg_stat_activity
WHERE datname = 'airbnb_development';

    pid  | usename |      datname       | client_addr | state  
    -------+---------+--------------------+-------------+--------
    31756 | postgres   | airbnb_development |             | active
    (1 row)
```