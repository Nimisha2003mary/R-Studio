use customers;

-- Recreate the Vendors table
CREATE TABLE Vendors (
    vendor_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address TEXT
);

-- Recreate the foreign key constraint between Invoices and Vendors
ALTER TABLE Invoices
ADD CONSTRAINT fk_vendor_id
FOREIGN KEY (linked_id) REFERENCES Vendors(vendor_id);


-- 2. Customers Table
CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    billing_address TEXT
);

-- 3. Invoices Table
CREATE TABLE Invoices (
    invoice_id VARCHAR(15) PRIMARY KEY,
    category VARCHAR(20) CHECK (category IN ('Vendor', 'Customer')),
    linked_id VARCHAR(10),  -- ID from either vendor or customer
    template_type VARCHAR(50),
    date_issued DATE,
    due_date DATE,
    status VARCHAR(20), -- e.g., Paid, Unpaid, Overdue
    total_amount DECIMAL(10,2),
    payment_terms VARCHAR(50)
);

-- 4. Invoice Items Table
CREATE TABLE Invoice_Items (
    item_id SERIAL PRIMARY KEY,
    invoice_id VARCHAR(15),
    item_name VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10,2),
    total_price DECIMAL(10,2),
    FOREIGN KEY (invoice_id) REFERENCES Invoices(invoice_id)
);

-- 5. Tax Details Table
CREATE TABLE Tax_Details (
    invoice_id VARCHAR(15) PRIMARY KEY,
    tax_type VARCHAR(50),
    value VARCHAR(20),
    hsn_code VARCHAR(20),
    FOREIGN KEY (invoice_id) REFERENCES Invoices(invoice_id)
);

-- Insert vendors with unique IDs
INSERT INTO Vendors (vendor_id, name, email, phone_number, address) VALUES
('V007', 'Herbal House', 'contact@herbalhouse.com', '9812345670', 'Mumbai, India'),
('V008', 'GlowSkin Naturals', 'support@glowskin.com', '9823456712', 'Delhi, India'),
('V009', 'Earthy Essentials', 'info@earthyessentials.com', '9834567890', 'Bangalore, India'),
('V010', 'AyurPure', 'hello@ayurpure.in', '9845671234', 'Chennai, India'),
('V011', 'Botaniq Co.', 'service@botaniqco.in', '9856784321', 'Hyderabad, India'),
('V012', 'NatureRoot', 'roots@nature.in', '9867895432', 'Kolkata, India');

-- Insert into Customers
INSERT INTO Customers (customer_id, name, email, phone_number, billing_address) VALUES
('C001', 'Nimisha Sharma', 'nimisha@example.com', '9876543210', '12 Green Avenue, Bangalore'),
('C002', 'Rohit Verma', 'rohitv@gmail.com', '9876543221', '21 Sunshine Street, Mumbai'),
('C003', 'Anjali Rao', 'anjali.rao@hotmail.com', '9876543232', '45 Lake View, Pune'),
('C004', 'Arjun M.', 'arjunm@yahoo.com', '9876543243', '10 Garden Road, Delhi'),
('C005', 'Sneha D.', 'sneha.d@example.com', '9876543254', '99 Ocean Drive, Chennai'),
('C006', 'Rahul K.', 'rahul.k@gmail.com', '9876543265', '77 Horizon Lane, Hyderabad'),
('C007', 'Pooja R.', 'pooja.r@outlook.com', '9876543276', '15 Moonlight Blvd, Jaipur'),
('C008', 'Deepak Jain', 'deepak.j@gmail.com', '9876543287', '33 Breeze Street, Lucknow');

-- Insert into Invoices
INSERT INTO Invoices (invoice_id, category, linked_id, template_type, date_issued, due_date, status, total_amount, payment_terms) VALUES
('INV1001', 'Vendor', 'V001', 'Standard', '2024-04-01', '2024-04-10', 'Paid', 1250.00, 'Net 30'),
('INV1002', 'Customer', 'C001', 'Custom', '2024-04-03', '2024-04-15', 'Unpaid', 890.00, 'Advance'),
('INV1003', 'Vendor', 'V002', 'Standard', '2024-04-05', '2024-04-20', 'Paid', 1500.00, 'Net 15'),
('INV1004', 'Customer', 'C002', 'Basic', '2024-04-07', '2024-04-14', 'Overdue', 750.00, 'Advance'),
('INV1005', 'Vendor', 'V003', 'Custom', '2024-04-10', '2024-04-25', 'Unpaid', 1320.00, 'Net 30'),
('INV1006', 'Customer', 'C003', 'Standard', '2024-04-12', '2024-04-22', 'Paid', 680.00, 'Advance');

-- Insert into Invoice_Items
INSERT INTO Invoice_Items (invoice_id, item_name, quantity, unit_price, total_price) VALUES
('INV1001', 'Aloe Vera Gel', 10, 50.00, 500.00),
('INV1001', 'Herbal Soap', 15, 50.00, 750.00),
('INV1002', 'Rose Water Toner', 5, 80.00, 400.00),
('INV1002', 'Neem Face Pack', 4, 122.50, 490.00),
('INV1003', 'Saffron Serum', 6, 250.00, 1500.00),
('INV1004', 'Coconut Hair Oil', 5, 150.00, 750.00),
('INV1005', 'Multani Mitti Pack', 8, 75.00, 600.00),
('INV1005', 'Turmeric Cream', 6, 120.00, 720.00),
('INV1006', 'Sandalwood Scrub', 4, 170.00, 680.00);

-- Insert into Tax_Details
INSERT INTO Tax_Details (invoice_id, tax_type, value, hsn_code) VALUES
('INV1001', 'GST', '18%', '33049910'),
('INV1002', 'GST', '12%', '33049920'),
('INV1003', 'VAT', '10%', '33049930'),
('INV1004', 'GST', '18%', '33049940'),
('INV1005', 'VAT', '15%', '33049950'),
('INV1006', 'GST', '5%', '33049960');

-- View all vendors
SELECT * FROM Vendors;
DESCRIBE  Vendors;

-- View all customers
SELECT * FROM Customers;
DESCRIBE  Customers;
-- View all invoices
SELECT * FROM Invoices;
DESCRIBE Invoices;

-- View invoice items
SELECT * FROM Invoice_Items;
DESCRIBE Invoice_Items;
-- View tax details
SELECT * FROM Tax_Details;
DESCRIBE Tax_Details;


