This directory is dedicated for queries on History of Baseball database. You can download the database via this link: [Library Management](https://uupload.ir/view/main_a4sf.sql/)

Query 1 is for this demand:<br/>
Write a function called calculate_lateness that calculates the number of days late for each book that is late in returning the loan, and calculates a fine of 5,000 Tomans for each day of lateness. Then, using window functions, sort the list of members along with the total debts due to lateness in descending order and output it.<br/>

Query 2 is for this demand:<br/>
Create a procedure called membership_renewal that takes the person's membership code and renews their membership for 1 year if the person's total unpaid fines are less than 10,000 and displays the appropriate message.<br/>

Query 3 is for this demand:<br/>
Create a new Trigger that checks the following when inserting a new record into the Loans table and cancels the operation if any of them are violated:

- The desired book must be available.

- Check that the user has an active membership.<br/>

Query 4 is for this demand:<br/>
Write a query that returns a list of books that had the highest number of loans this year but were not loaned out even once in the past month.<br/>

Query 5 is for this demand:<br/>
Create a new assertion that ensures that no book can be checked out more than 5 times at a time (our library has 5 books in stock). You can use Triggers to implement this.<br/>

Query 6 is for this demand:<br/>
Create two views with the following descriptions:

- A view called Active_loans that lists books that have been loaned out along with the borrower. Output the borrower's first and last name, the book title, and the book's author.
- A view called Popular_books that rates and displays books based on the number of times a book has been borrowed. Output the book title, the book's author, and the number of times.<br/>
