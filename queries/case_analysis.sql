--Case 1. Which books and authors are most frequently borrowed
-- Top 10 most borrowed books
SELECT 
	b.book_id,
	b.title, 
	COUNT(l.loan_id) AS borrow_count
FROM 
	books b
JOIN 
	loans l USING(book_id)
GROUP BY 
	1, 2
ORDER BY 
	borrow_count DESC
LIMIT 10;

-- Most frequently borrowed authors
SELECT 
	a.author_id,
	a.author_name,
	COUNT(l.loan_id) AS borrow_count
FROM 
	authors a
JOIN 
	books b USING(author_id)
JOIN 
	loans l USING(book_id)
GROUP BY 
	1, 2
ORDER BY 
	borrow_count DESC
LIMIT 10;

--Case 2. What are the most popular genres and which books in each genre have the highest borrowing rates?
-- Most popular genres based on borrowing rates
SELECT 
	c.category_name,
	COUNT(l.loan_id) AS borrow_count
FROM 
	categories c
JOIN 
	books b USING(category_id)
JOIN 
	loans l USING(book_id)
GROUP BY 
	c.category_name
ORDER BY 
	borrow_count DESC
LIMIT 10;

--Case 3. What is the average number of books borrowed per user, and how many users are repeat borrowers?
-- Average number of books borrowed per user
SELECT 
	AVG(borrow_count) AS avg_borrows_per_user
FROM (
    SELECT 
    	user_id,
    	COUNT(loan_id) AS borrow_count
    FROM
    	loans
    GROUP BY
    	user_id
) AS user_borrows;

-- Number of repeat borrowers
SELECT
	COUNT(user_id) AS repeat_borrowers
FROM (
    SELECT
    	user_id,
    	COUNT(loan_id) AS borrow_count
    FROM 
    	loans
    GROUP BY 
    	user_id
    HAVING 
    	COUNT(loan_id) > 1
) AS repeat_users;

-- Repeat borrowers with their usernames and borrow count
SELECT
	u.username,
	COUNT(l.loan_id) AS borrow_count
FROM 
	Users u
JOIN 
	Loans l ON u.user_id = l.user_id
GROUP BY 1
HAVING 
	COUNT(l.loan_id) > 1
ORDER BY 
	borrow_count DESC;

--Case 4. How many books are overdue, and which libraries have the highest number of overdue loans?
-- Total count of overdue books
SELECT
	COUNT(*) AS overdue_books_count
FROM
	loans
WHERE
	return_date IS NULL AND due_date < CURRENT_DATE;

-- Libraries with the most overdue loans
SELECT
	l.library_name,
	l.location,
	COUNT(lo.loan_id) AS overdue_count
FROM
	libraries l
JOIN
	loans lo USING(library_id)
WHERE
	lo.return_date IS NULL AND lo.due_date < CURRENT_DATE
GROUP BY
	1, 2
ORDER BY
	overdue_count DESC;

--Case 5. Which library has the highest circulation rate, and what is the average book quantity available per library?
-- Library with the highest circulation rate
SELECT
	l.library_name,
	l.location,
	COUNT(lo.loan_id) AS circulation_rate
FROM
	libraries l
JOIN
	loans lo ON l.library_id = lo.library_id
GROUP BY
	1, 2
ORDER BY
	circulation_rate DESC;

-- Average quantity of books per library
SELECT
	l.library_name,
	l.location,
	AVG(b.quantity) AS avg_book_quantity
FROM
	libraries l
JOIN
	books b ON l.library_id = b.library_id
GROUP BY 1, 2;