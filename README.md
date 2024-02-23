# RDBS
**MySQL book store database**

![](https://github.com/kutscheraa/RDBS/blob/main/defaultdb.png)

## Assignment

1) Design (ERD) and create (SQL) a database related to any topic:
a) Must contain at least 7 tables with primary keys (PK).
- Do not exceed the number of tables (max. 15).
- You can use databases from the subject KI/(K)URD, KI/(K)URDB.
- For credit, provide the ERD of the database (for easier orientation).
b) Must be populated with data.
- At least 20 records per table on average.
- For example, if you have 7 tables x 20 records = at least 140 records in the entire database (across all tables).
c) Must be implemented (SQL).
- Students can choose an appropriate DBMS (e.g., MySQL, MariaDB, PostgreSQL, MS SQL Server, Oracle, DB2, ...).

2) Prepare commands for the created database from point 1):
a) SELECT (4x), variants with subqueries (select within select) and without subquery.
- One SELECT statement will calculate the average number of records per table in the database.
- One SELECT statement will contain a nested SELECT.
- One SELECT statement will include some analytical function (SUM, COUNT, AVG,…).
- One SELECT statement will deal with recursion or hierarchy (JOIN).
b) VIEW (1x) with essential information from at least several tables.
- At least three tables, with no foreign keys (FK) and irrelevant information.
- Use different types of JOIN commands to combine tables (inner, left, right, natural, …).
c) INDEX (1x), an index file on some column of a table.
- At least one non-trivial index file (unique, full-text, …).
d) FUNCTION (1x), which will compute a value from the data in the database.
- For example, the total order amount, the number of participants over 65 years old, the average price of offered products, etc.
e) PROCEDURE (1x), which will use 1x CURSOR and also error handling (HANDLER / TRY…CATCH / RAISE / EXCEPTION - according to the chosen DBMS).
- For example, create and populate a new table with information about random discounts on selected products, or generate discount bonuses for customers based on certain conditions, etc.
f) TRIGGER (1x), which will manage data operations on a particular table of the database.
- Mainly used for INSERT, UPDATE, DELETE commands, but you can also try another type.
- For example, for UPDATE, write the date, time, and information about the user who modified the data in a certain way in a new table.
g) TRANSACTION (1x) to be used in one of the previous procedures/functions.
- That is, group a set of commands into a transaction and handle situations where it is not possible to execute all the specified commands at once.
- For example, enclose a money transfer from one account to another in a transaction + handle the situation where the sender does not have enough funds in the account to make the transfer.
- START TRANSACTION, COMMIT, ROLLBACK (and optionally SAVEPOINT).
h) USER - have prepared commands for demonstration.
- Know how to create/remove a user account CREATE/DROP USER.
- Know how to log in as the newly created user and verify the availability of databases.
- Know how to create/remove a role CREATE/DROP ROLE (some DBMS do not have this).
- Know how to grant/revoke privileges to a user or role GRANT/REVOKE.
i) LOCK - have prepared commands for demonstration.
- Know how to lock/unlock a table (or possibly the entire database, or just a row - if the selected DBMS allows it).
- LOCK TABLE Products READ / UNLOCK TABLE Products / UNLOCK TABLES.
j) ORM - implement one of the above tasks using a suitable ORM (SQLAlchemy).
