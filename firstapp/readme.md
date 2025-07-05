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

This README serves as reference documentation for the backend logic implemented in `views.py`.
