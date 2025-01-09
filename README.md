# SQL E-Library Project

## 📚 Project Overview
This project focuses on creating and managing a relational database for a simple e-library system. The database enables efficient management of multiple libraries, book collections, user interactions, and in-depth analysis of borrowing patterns and trends.

## 🔑 Key Features
Multi-Library Management: Track books across multiple library branches.
Book Categories: Organize books by genres such as self-improvement, fantasy, and more.
User Loan and Hold System: Manage user interactions, including borrowing and placing holds on books.
Data Analysis: Perform data analysis to derive insights such as popular books, borrowing patterns, and overdue trends.

## 🛠️ Tools
PostgreSQL: Database creation, management, and analysis.
Python: Used for web scraping and dummy data generation.
Jupyter Notebooks: Scripts and analysis workflows.
DBeaver: For database querying and management.
Python Libraries: Pandas, Faker, BeautifulSoup.

## 🚀 Getting Started
### 1. Run Python Scripts
Use the `.ipynb` files in the `dummy_data/` folder for:
- Web scraping: `book_scrape.ipynb`
- Dummy data generation: `data_generator.ipynb`

### 2. Setup Database
Use the provided `ddl.sql` file in the `queries/` folder to create the necessary tables and relationships.
Populate the database using the dummy data CSV files located in `dummy_data/`.

### 3. Dependencies
Install required Python libraries:

```
pip install -r requirements.txt
```

### 4. Case Analysis
Case for Analysis SQL scripts are available in the queries/ folder as the provided case_analysis.sql file.

## 📊 Case Insights

This project provides insights from case analysis, such as:
- The most frequently borrowed books and authors.
- Popular genres and borrowing patterns.
- Overdue book trends by library branches.

## 📁 Project Structure

```
SQL-E-Library/
├── README.md
├── requirements.txt
├── dummy_data/
│   ├── book_scrape.ipynb
│   ├── data_generator.ipynb
│   ├── authors.csv
│   ├── books_data.csv
│   ├── books.csv
│   ├── categories.csv
│   ├── holds.csv
│   ├── libraries.csv
│   ├── loans.csv
│   ├── publishers.csv
│   └── users.csv
└── queries/
    ├── case_analysis.sql
    └── ddl.sql
```
