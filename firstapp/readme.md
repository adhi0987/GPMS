# Django Views - Panchayat Digital Management System

This README provides detailed explanations for each Django view function in the `views.py` file.

---

## home(request)
- Initializes session flag to 0 (used for tracking login status).
- Renders the 'home.html' template using Django's template loader.

## get_db_connection()
- Opens a PostgreSQL connection using psycopg2 with hardcoded credentials.
- Used throughout the views to manually execute SQL queries.

## signup(request)
- Handles user signup for both citizens and panchayat employees.
- Validates matching passwords and checks if user ID exists in the specified table.
- Hashes the password using Django’s `make_password()`.
- Updates the `username` and `passwd` fields in the appropriate table.
- Provides feedback via the Django `messages` framework.

## login(request)
- Authenticates user based on submitted credentials and user type.
- Verifies the password using `check_password()`.
- Sets session variables like `id`, `user_type`, and `flag` on successful login.
- Redirects users to their respective dashboards.

## village_dashboard(request)
- Aggregates Panchayat-wide data including:
  - Employees, assets, schemes, population, income, expenditure, notifications.
- Uses advanced SQL with JOINs, aggregates, and filters.
- Renders a comprehensive dashboard for Panchayat officials.

## citizens(request)
- Displays the form to add a new citizen.
- Checks if the user is logged in before granting access.

## panemp(request)
- Panchayat employee dashboard with full access to:
  - Citizen data, land records, certificates, tax payments, schemes, households, assets, complaints.
- Supports filtering and search across all tables.
- Uses complex joins and multiple SQL queries.

## addcitizen(request)
- Handles form submission to add a new citizen.
- Inserts citizen data into `citizens` table and mobile number into `citizen_mobile` table.
- Uses Decimal for numeric inputs like income and land area.

## addland(request)
- Handles addition of a land record.
- Inserts land metadata into `land_acres` table.
- Inserts ownership records into `land_ownership` for each owner.

## issuecertificate(request)
- Issues a certificate by inserting into `citizen_certificate` table.
- Links citizen ID and certificate type with issue date.

## addassets(request)
- Adds a new asset record to the `assets` table.
- Stores type, location, status, and build date.

## addtaxes(request)
- Adds a tax payment entry into `payment_taxes`.
- Tracks amount, type, date, and citizen ID.

## addscrapasset(request)
- Marks an asset as scrapped and records reason, date, and estimated value.
- Updates the asset's status in the `assets` table.
- Inserts scrap record into `scrap` table.

---
# Django & SQL Concepts by View - Panchayat Digital Management System

This README outlines the core Django and SQL/PostgreSQL concepts implemented in each view of the project.

---

## home(request)
### Django Concepts:
- Session management (`request.session`)
- Template rendering using `loader.get_template()` + `HttpResponse`

### SQL Concepts:
- None (static page)

---

## get_db_connection()
### Django Concepts:
- Not a Django feature; standalone helper

### SQL Concepts:
- Manual PostgreSQL connection via `psycopg2`
- Hardcoded credentials (suggested to move to config)

---

## signup(request)
### Django Concepts:
- POST request form handling
- Password hashing (`make_password`)
- Session usage for user state
- Flash messages (`messages.success` / `messages.error`)
- Conditional rendering / redirecting

### SQL Concepts:
- SELECT to verify user existence
- UPDATE to set `username` and `passwd`
- Use of parameterized queries to prevent SQL injection

---

## login(request)
### Django Concepts:
- Session management (`request.session['flag']`, `user_type`, `id`)
- Secure password checking using `check_password`
- Flash messaging
- Role-based redirecting

### SQL Concepts:
- SELECT queries on `username`
- Password fetched from DB and validated in app

---

## village_dashboard(request)
### Django Concepts:
- Authenticated view (session flag checked)
- Complex multi-context template rendering

### SQL Concepts:
- Joins across multiple tables (employees, citizens, mobile)
- Aggregation (`COUNT`, `SUM`, `EXTRACT`)
- PostgreSQL string aggregation: `STRING_AGG()`
- CTEs (Common Table Expressions) for income/expenditure
- `COALESCE` for NULL-safe calculations

---

## citizens(request)
### Django Concepts:
- Simple route protection via session flag
- Template rendering

### SQL Concepts:
- None (view-only, no DB operations)

---

## panemp(request)
### Django Concepts:
- Auth check for employees via session
- Handles POST filters from forms
- Multi-table dynamic data rendering
- Context reuse for filters

### SQL Concepts:
- Multi-table joins (e.g., land with owners)
- Grouping and aggregation
- String aggregation via `STRING_AGG`
- Date filtering via `EXTRACT`, `AGE`
- Data enrichment using `JOIN`, `LEFT JOIN`
- CTEs for salaries and asset expenditures

---

## addcitizen(request)
### Django Concepts:
- POST form data extraction
- Flash messaging
- Redirect on completion

### SQL Concepts:
- INSERT into `citizens` and `citizen_mobile`
- Decimal fields for income and land area
- Multi-table insert (1-to-many)

---

## addland(request)
### Django Concepts:
- Dynamic list extraction (`request.POST.getlist`)
- Loop-based insert logic for many-to-many relationships

### SQL Concepts:
- INSERT into `land_acres`
- INSERT into `land_ownership` (multi-row insert loop)
- Maintains referential integrity across two tables

---

## issuecertificate(request)
### Django Concepts:
- Simple POST handling with messages
- Redirect to dashboard

### SQL Concepts:
- INSERT into `citizen_certificate`
- Standard foreign key relation between citizen and certificate

---

## addassets(request)
### Django Concepts:
- Form handling with messages and redirect

### SQL Concepts:
- INSERT into `assets` table
- Stores metadata such as status, type, location, and date

---

## addtaxes(request)
### Django Concepts:
- Decimal field casting
- Flash messaging and redirect

### SQL Concepts:
- INSERT into `payment_taxes`
- Tracks citizen_id, tax_type, amount, date
- Supports revenue tracking and filtering

---

## addscrapasset(request)
### Django Concepts:
- Dual-query processing (INSERT + UPDATE)
- Message framework for feedback

### SQL Concepts:
- INSERT into `scrap` table with financial and reason metadata
- UPDATE on `assets` table to change `stat` to 'scrapped'
- Ensures asset lifecycle consistency

---

# Summary of Concepts

## Django Concepts Used:
- Session management (`request.session`)
- Secure password handling (`make_password`, `check_password`)
- Flash messaging system (`messages`)
- Request method routing (`POST` vs `GET`)
- Template rendering (`render`, `loader`)
- Redirection (`redirect`)
- Access control via session flag
- Context passing to templates

## SQL/PostgreSQL Techniques Used:
- Raw SQL queries via `psycopg2`
- SELECT, INSERT, UPDATE, and complex joins
- Use of `COALESCE`, `STRING_AGG`, `EXTRACT`, `AGE`
- CTEs for aggregations (especially in income/expenditure)
- Parameterized queries for security
- Decimal fields for financial precision
- Many-to-many and one-to-many relational inserts

---

This file serves as a conceptual map for understanding both the Django and database logic of the application.

---

This README serves as reference documentation for the backend logic implemented in `views.py`.
