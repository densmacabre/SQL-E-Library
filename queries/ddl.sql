--Create libraries table
CREATE TABLE Libraries (
    library_id VARCHAR(50) PRIMARY KEY,
    library_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100)
);

--Create categories table
CREATE TABLE Categories (
    category_id VARCHAR(50) PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

--Create users table
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
);

--Create authors table
CREATE TABLE Authors (
    author_id VARCHAR(50) PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

--Create publishers table
CREATE TABLE Publishers (
    publisher_id VARCHAR(50) PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL
);

--Create books table
CREATE TABLE Books (
    book_id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    category_id VARCHAR(50) NOT NULL,
    library_id VARCHAR(50) NOT NULL,
    publisher_id VARCHAR(50) NOT NULL,
    author_id VARCHAR(50) NOT NULL,
    quantity INT CHECK (quantity >= 0), -- Ensures no negative quantities
    CONSTRAINT
    	fk_categories
    	FOREIGN KEY (category_id)
    	REFERENCES Categories(category_id),
    CONSTRAINT
    	fk_libraries
    	FOREIGN KEY (library_id)
    	REFERENCES Libraries(library_id),
    CONSTRAINT
    	fk_publishers
    	FOREIGN KEY (publisher_id)
    	REFERENCES Publishers(publisher_id),
    CONSTRAINT
    	fk_authors
    	FOREIGN KEY (author_id)
    	REFERENCES Authors(author_id)
);

--Create loans table
CREATE TABLE Loans (
    loan_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    book_id VARCHAR(50) NOT NULL,
    library_id VARCHAR(50) NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE, --Nullable until returned
    CONSTRAINT
    	fk_users
    	FOREIGN KEY (user_id)
    	REFERENCES Users(user_id),
    CONSTRAINT
    	fk_books
    	FOREIGN KEY (book_id)
    	REFERENCES Books(book_id),
    CONSTRAINT
    	fk_libraries
    	FOREIGN KEY (library_id)
    	REFERENCES Libraries(library_id)
);

--Create holds table
CREATE TABLE Holds (
    hold_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    book_id VARCHAR(50) NOT NULL,
    library_id VARCHAR(50) NOT NULL,
    hold_date DATE NOT NULL,
    release_date DATE, --Nullable until nol longer held
    CONSTRAINT
    	fk_users
    	FOREIGN KEY (user_id)
    	REFERENCES Users(user_id),
    CONSTRAINT
    	fk_books
    	FOREIGN KEY (book_id)
    	REFERENCES Books(book_id),
    CONSTRAINT
    	fk_libraries
    	FOREIGN KEY (library_id)
    	REFERENCES Libraries(library_id)
);