-- Table 2: households
CREATE TABLE households (
    ID SERIAL PRIMARY KEY,
    addr VARCHAR(200),
    income NUMERIC(12,2)
);

-- Table 1: citizens
CREATE TABLE citizens (
    ID SERIAL PRIMARY KEY,
    nm VARCHAR(100),
    gender VARCHAR(10),
    household_id INT REFERENCES households(ID),
    education_qualification VARCHAR(100),
    father INT REFERENCES citizens(ID),
    mother INT REFERENCES citizens(ID),
    spouse INT REFERENCES citizens(ID),
    DOB DATE,
    category VARCHAR(50),
    income NUMERIC(12,2),
    occupation VARCHAR(100),
    username VARCHAR(50) UNIQUE,
    passwd VARCHAR(250),
    date_of_death DATE
);



-- Table 3: land_acres
CREATE TABLE land_acres (
    ID SERIAL PRIMARY KEY,
    area_acres NUMERIC(5,2),
    type_l VARCHAR(50),
    old_id INT REFERENCES land_acres(ID),
    stat VARCHAR(50)
);




-- Table 4: land_ownership
CREATE TABLE land_ownership (
    land_id INT REFERENCES land_acres(ID),
    citizen_id INT REFERENCES citizens(ID),
    from_date DATE,
    to_date DATE,
    PRIMARY KEY (land_id, citizen_id)
);

-- Table 5: panchayat_employees
CREATE TABLE panchayat_employees (
   id SERIAL PRIMARY KEY,
    citizen_id INT REFERENCES citizens(ID),
    job_role VARCHAR(50),
    salary NUMERIC(12,2),
    username VARCHAR(50) UNIQUE,
    passwd VARCHAR(250),
    stat VARCHAR(50)
);

-- Table 6: assets
CREATE TABLE assets (
    id SERIAL PRIMARY KEY,
    type_a VARCHAR(100),
    locn VARCHAR(200),
    installation_date DATE,
    stat VARCHAR(50),
    demolition_date DATE,
    scrap_cost NUMERIC(12,2)
);

-- Table 7: assets_expenditure
CREATE TABLE assets_expenditure (
    assetid INT REFERENCES assets(ID),
    amount_spent NUMERIC(12,2),
    spent_date DATE,
    PRIMARY KEY (assetID, amount_spent,spent_date)
);

-- Table 8: welfare_scheme
CREATE TABLE welfare_scheme (
    scheme_id SERIAL PRIMARY KEY,
    nm VARCHAR(100),
    scheme_amt NUMERIC(12,2),
    eligible_age_range VARCHAR(50),
    eligible_gender VARCHAR(10),
    eligible_occupation VARCHAR(100),
    eligible_income NUMERIC(12,2),
    eligible_land_area NUMERIC(12,2)
);

-- Table 9: scheme_enrollment
CREATE TABLE scheme_enrollment (
    citizen_id INT REFERENCES citizens(ID),
    scheme_id INT REFERENCES welfare_scheme(scheme_id),
    enrollment_date DATE,
    PRIMARY KEY (citizen_id, scheme_id)  
);


-- Table 10: vaccinations
CREATE TABLE vaccinations (
    vaccination_id SERIAL PRIMARY KEY,
    citizen_id INT REFERENCES citizens(ID),
    vaccine_type VARCHAR(100),
    date_administered DATE
);

-- Table 11: certificates
CREATE TABLE certificates (
    certificate_id SERIAL PRIMARY KEY,
    type VARCHAR(100),
    issue_date DATE,
    event_date DATE
);

-- Table 12: citizen_certificate
CREATE TABLE citizen_certificate (
    citizen_id INT REFERENCES citizens(ID),
    certificate_id INT REFERENCES certificates(certificate_id),  
    PRIMARY KEY (citizen_id, certificate_id)
);

-- Table 13: payment_taxes
CREATE TABLE payment_taxes (
    tax_id SERIAL PRIMARY KEY,  -- Unique tax ID
    citizen_id INT REFERENCES citizens(ID),
    total_amount NUMERIC(10,2),
    due NUMERIC(10,2),
    yr INT,
    tax_type VARCHAR(50)
);

-- Table 14: transaction_history
CREATE TABLE transaction_history (
    transaction_id SERIAL PRIMARY KEY,
    amount_paid NUMERIC(12,2),
    trnsc_date DATE,
    tax_id INT REFERENCES payment_taxes(tax_id)
);


-- Table 15: govt_monitors
CREATE TABLE govt_monitors (
    id SERIAL PRIMARY KEY,
    nm VARCHAR(100),
    username VARCHAR(50) UNIQUE,
    passwd VARCHAR(250),
    stat VARCHAR(250)
);


--Table 17 : Agricultural report
CREATE TABLE agricultural_records (
    record_id SERIAL PRIMARY KEY,
    yr INT,
    crop_type VARCHAR(50),
    land_id INT REFERENCES land_acres(id)
);



-- Table 18: Admin
CREATE TABLE Admin (
   ID SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    passwd VARCHAR(250)
);

-- Table 19: citizen_mobile
CREATE TABLE citizen_mobile (
    citizen_id INT REFERENCES citizens(ID),
    mobile_no NUMERIC(10,0),
    PRIMARY KEY (citizen_id, mobile_no)
);
--Table 20
CREATE TABLE notification (
    ID SERIAL PRIMARY KEY,
    dt DATE,
    descriptn VARCHAR(250)
);
-- Table 21
CREATE TABLE complaints (
    complaint_id SERIAL PRIMARY KEY,
    citizen_id INT REFERENCES citizens(ID),
    enrolled_date DATE,
    description VARCHAR(250)
);

-- ADD DATA

-- Households Data
INSERT INTO households ( addr) VALUES 
( 'Village Road, Gopalpur'),  
( 'Main Street, Ramanpur');   

-- Citizens Data
INSERT INTO citizens ( nm, gender, household_id, education_qualification, father, mother, spouse, DOB, category, income, occupation, username, passwd) 
VALUES 
-- Family 1
--( 'Ramesh Kumar', 'Male', 1, '10th Pass', NULL, NULL, NULL, '1980-05-10', 'OBC', 200000, 'Farmer', 'ramesh123', 'pass1'),
( 'Sita Ram', 'Female', 3, '12th Pass', NULL, NULL,NULL, '1982-09-14', 'OBC', 0, 'Unemployed', 'ram123', 'pass4'),
( 'Ravi Kihore', 'Male', 3, 'Student', NULL, NULL, NULL, '2005-08-20', 'OBC', 0, 'Student', 'kishore123', 'pass10'),

-- Family 2
( 'Mohan Das', 'Male', 2, 'Graduate', NULL, NULL, NULL, '1975-03-14', 'SC', 1000000, 'pe_employee', 'mohan123', 'pass4'),
( 'Geeta Das', 'Female', 2, 'Post Graduate', NULL, NULL, NULL, '1978-11-09', 'SC', 150000, 'Teacher', 'geeta123', 'pass5');

-- Panchayat Employees Data
INSERT INTO panchayat_employees ( citizen_id, job_role, salary, username, passwd, stat)
VALUES 
( 4, 'Secretary', 1000000, 'anil123', 'pass9', 'active');

-- Land Acres Data
INSERT INTO land_acres (area_acres, type_l, old_id,stat) VALUES 
( 2.5, 'Agriculture',  NULL,'active'),
( 4.0, 'Agriculture', NULL,'active');






-- Land Ownership Data
INSERT INTO land_ownership (land_id, citizen_id, from_date, to_date) VALUES 
(1, 1, '2005-01-15', NULL),  
(2, 1, '2008-03-10', NULL);  

INSERT INTO welfare_scheme (nm, scheme_amt, eligible_age_range, eligible_gender, eligible_occupation, eligible_income, eligible_land_area) VALUES 
('PM Kisan Samman Nidhi',  3500.00, '18-60', 'Any', 'Farmer', 200000, 2.0);

-- Scheme Enrollment Data
INSERT INTO scheme_enrollment (citizen_id, scheme_id, enrollment_date) VALUES 
(1, 1, '2024-01-10');  -- Ramesh Kumar in PM Kisan Samman Nidhi

INSERT INTO vaccinations (citizen_id, vaccine_type, date_administered) VALUES
(1, 'Covaxin', '2021-06-10'),
(1, 'Polio', '2022-01-05'),
(2, 'Covaxin', '2021-06-15'),
(2, 'Hepatitis B', '2022-02-10'),
(4, 'Covishield', '2021-05-20'),
(4, 'Influenza', '2022-03-15'),
(5, 'Covishield', '2021-05-22'),
(5, 'Typhoid', '2022-04-18');



INSERT INTO certificates (certificate_id,type, issue_date, event_date) VALUES
(1,'Birth Certificate', '1980-05-10', '1980-05-10'),
(2,'Birth Certificate', '1982-09-15', '1982-09-12');

-- Sample Data for citizen_certificate
INSERT INTO citizen_certificate (citizen_id, certificate_id) VALUES
(1, 1),  -- Ramesh Kumar Birth Certificate
(2, 2);  -- Sita Devi Birth Certificate


-- Sample Data for payment_taxes
INSERT INTO payment_taxes (total_amount, citizen_id,due, yr, tax_type) VALUES
(2000,4, 1000, 2024, 'Income Tax');


-- Sample Data for transaction_history
INSERT INTO transaction_history ( amount_paid, trnsc_date, tax_id) VALUES
( 1000, '2024-03-01', 1);


INSERT INTO assets (type_a, locn, installation_date, stat, demolition_date, scrap_cost) VALUES
('Street Light', 'Main Road', '2020-03-10', 'Active', NULL, NULL),
('Water Pump', 'Community Center', '2019-06-15', 'Active', NULL, NULL),
('Road', 'Village Road No. 2', '2021-01-05', 'Active', NULL, NULL),
('Street Light', 'Market Area', '2018-09-12', 'Inactive', '2023-06-20', 2000.00),
('Water Pump', 'Primary School', '2022-04-25', 'Active', NULL, NULL);

-- Sample Data for assets_expenditure
INSERT INTO assets_expenditure (assetID, amount_spent, spent_date) VALUES
(1, 5000.00, '2020-03-10'),
(2, 7000.00, '2019-06-15'),
(3, 12000.00, '2021-01-05'),
(4, 2000.00, '2018-09-12'),
(5, 8000.00, '2022-04-25');

INSERT INTO citizen_mobile (citizen_id, mobile_no) VALUES
(1, 9876543210),
(1, 9123456789),
(2, 9234567890),
(4, 9345678901);

INSERT INTO admin(id) VALUES(1);


INSERT INTO govt_monitors(nm,stat) VALUES('Sudha','active');