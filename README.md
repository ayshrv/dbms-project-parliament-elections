# dbms-project-parliament-elections
This project is a online voting system which serves the full functionality of Parliament Elections conducted in an institute. It is Django Framework in Python and RDBMS is built in MySQL.

Open readme.pdf and Requirements.pdf for more information.

Parliament Voting System

run “python manage.py runserver” in ParliamentElections/

and open “http://127.0.0.1:8000/adminlogin/” to open admin login page

and “http://127.0.0.1:8000/login/” to open voter login page.

This system consists of two types of account.
1. Admin account who has the right to create an election session, verify
candidates, clear the ambiguity in the results, and end elections.
2. Student account who can register on the portal and register itself as a
candidate, load its resume and participate in voting.

Project Structure:

ParliamentElections/

./elections

./media

./ParliamentElections

./static

./templates

Databasesfiles,sql

manage.py

django version : 1.10.2

MySQL Server Version: 5.7.13-0ubuntu0.16.04.2

MySQL-python : 1.2.5

