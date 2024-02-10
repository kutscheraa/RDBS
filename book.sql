CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(255) NOT NULL
);

CREATE TABLE primary_book_categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE secondary_book_categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE users (
    user_id VARCHAR(10) PRIMARY KEY,
    password VARCHAR(20),
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    primary_category_id INT NOT NULL,
    secondary_category_id INT,
    language VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    cover_image_url VARCHAR(255),
    publication_date DATE,
    FOREIGN KEY (primary_category_id) REFERENCES primary_book_categories(category_id),
    FOREIGN KEY (secondary_category_id) REFERENCES secondary_book_categories(category_id)
);

CREATE TABLE book_authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(255),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    payment_status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE TABLE addresses (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(255),
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(255) NOT NULL,
    transaction_id VARCHAR(255) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE carts (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(255),
    book_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);




INSERT INTO authors (first_name, last_name) VALUES
('J.D.', 'Salinger'),
('Harper', 'Lee'),
('George', 'Orwell'),
('Jane', 'Austen'),
('F. Scott', 'Fitzgerald'),
('Gabriel Garcia', 'Marquez'),
('J.R.R.', 'Tolkien'),
('Aldous', 'Huxley'),
('Fyodor', 'Dostoevsky'),
('J.R.R.', 'Tolkien'),
('Herman', 'Melville'),
('Leo', 'Tolstoy'),
('Homer', ''),
('Fyodor', 'Dostoevsky'),
('Paulo', 'Coelho'),
('Mary', 'Shelley'),
('Oscar', 'Wilde'),
('Suzanne', 'Collins'),
('Charles', 'Dickens'),
('Antoine de', 'Saint-Exupéry');

INSERT INTO books (title, price, stock_quantity, primary_category_id, language, country) VALUES
('The Catcher in the Rye', 10.99, 100, 1, 'English', 'USA'),
('To Kill a Mockingbird', 9.99, 150, 1, 'English', 'USA'),
('1984', 8.99, 200, 1, 'English', 'UK'),
('Pride and Prejudice', 7.99, 120, 1, 'English', 'UK'),
('The Great Gatsby', 11.99, 80, 1, 'English', 'USA'),
('One Hundred Years of Solitude', 12.99, 90, 1, 'Spanish', 'Colombia'),
('The Lord of the Rings', 14.99, 110, 2, 'English', 'UK'),
('Brave New World', 9.99, 70, 2, 'English', 'UK'),
('Crime and Punishment', 10.99, 100, 3, 'Russian', 'Russia'),
('The Hobbit', 13.99, 120, 2, 'English', 'UK'),
('Moby-Dick', 11.99, 60, 3, 'English', 'USA'),
('War and Peace', 15.99, 80, 3, 'Russian', 'Russia'),
('The Odyssey', 8.99, 100, 4, 'Greek', 'Greece'),
('The Brothers Karamazov', 10.99, 110, 3, 'Russian', 'Russia'),
('The Alchemist', 11.99, 130, 5, 'Portuguese', 'Brazil'),
('Frankenstein', 9.99, 70, 5, 'English', 'UK'),
('The Picture of Dorian Gray', 10.99, 90, 5, 'English', 'UK'),
('The Hunger Games', 8.99, 100, 6, 'English', 'USA'),
('A Tale of Two Cities', 7.99, 110, 7, 'English', 'UK'),
('The Little Prince', 6.99, 120, 7, 'French', 'France');

-- Záznamy pro tabulku primary_book_categories
INSERT INTO primary_book_categories (category_name) VALUES
('Fiction'),
('Classic'),
('Dystopian'),
('Romance'),
('Modernist'),
('Magical Realism'),
('Fantasy'),
('Science Fiction'),
('Russian Literature'),
('Adventure'),
('Historical Fiction'),
('Epic Poetry'),
('Greek Epic'),
('Philosophical Fiction'),
('Portuguese Literature'),
('Gothic'),
('Young Adult'),
('Mystery'),
('Thriller'),
('French Literature');

INSERT INTO secondary_book_categories (category_name) VALUES
('Literary Fiction'),
('Coming of Age'),
('Political'),
('Regency'),
('Jazz Age'),
('Latin American Literature'),
('High Fantasy'),
('Dystopian Fiction'),
('Existentialism'),
('High Fantasy'),
('Sea Adventure'),
('Russian Epic'),
('Mythology'),
('Existentialism'),
('Adventure Fiction'),
('Gothic Horror'),
('Dystopian Young Adult'),
('Historical Drama'),
('Social Commentary'),
('Children''s Literature');

-- Vložení dat do spojovací tabulky book_authors
INSERT INTO book_authors (book_id, author_id) VALUES
(1, 1),    -- J.D. Salinger - The Catcher in the Rye
(2, 2),    -- Harper Lee - To Kill a Mockingbird
(3, 3),    -- George Orwell - 1984
(4, 4),    -- Jane Austen - Pride and Prejudice
(5, 5),    -- F. Scott Fitzgerald - The Great Gatsby
(6, 6),    -- Gabriel Garcia Marquez - One Hundred Years of Solitude
(7, 7),    -- J.R.R. Tolkien - The Lord of the Rings
(8, 8),    -- Aldous Huxley - Brave New World
(9, 9),    -- Fyodor Dostoevsky - Crime and Punishment
(10, 7),   -- J.R.R. Tolkien - The Hobbit
(11, 10),  -- Herman Melville - Moby-Dick
(12, 11),  -- Leo Tolstoy - War and Peace
(13, 12),  -- Homer - The Odyssey
(14, 9),   -- Fyodor Dostoevsky - The Brothers Karamazov
(15, 13),  -- Paulo Coelho - The Alchemist
(16, 14),  -- Mary Shelley - Frankenstein
(17, 15),  -- Oscar Wilde - The Picture of Dorian Gray
(18, 16),  -- Suzanne Collins - The Hunger Games
(19, 17),  -- Charles Dickens - A Tale of Two Cities
(20, 18);  -- Antoine de Saint-Exupéry - The Little Prince


INSERT INTO users (user_id, password, first_name, last_name) VALUES
('user001', 'pass123', 'John', 'Doe'),
('user002', 'secure456', 'Jane', 'Smith'),
('user003', 'myp@ss', 'Bob', 'Jenkins'),
('user004', 'letmein123', 'Emily', 'Davis'),
('user005', 'p@ssw0rd', 'Mike', 'Jackson'),
('user006', '123abc', 'Lisa', 'Johnson'),
('user007', 'qwerty789', 'David', 'Anderson'),
('user008', 'changeme123', 'Amy', 'Miller'),
('user009', 'securepwd', 'Tom', 'Wilson'),
('user010', 'pass321', 'Susan', 'Clark'),
('user011', 'ilovemydog', 'Peter', 'Walker'),
('user012', '1qaz2wsx', 'Linda', 'Smith'),
('user013', 'password123', 'Ryan', 'Brown'),
('user014', 'adminpass', 'Karen', 'Cook'),
('user015', 'letmeinnow', 'Chris', 'Jones'),
('user016', 'testpass', 'Jennifer', 'Morris'),
('user017', 'secret123', 'Mark', 'Taylor'),
('user018', 'newpassword', 'Alice', 'White'),
('user019', '123456789', 'Kevin', 'Morgan'),
('user020', 'mypass', 'Sandra', 'Miller');

INSERT INTO addresses (user_id, address_line1, address_line2, city, state, postal_code, country) VALUES
('user001', '123 Main St', 'Apt 4', 'Cityville', 'Stateville', '12345', 'Countryland'),
('user002', '456 Oak St', NULL, 'Townsville', 'Stateland', '56789', 'Countryville'),
('user003', '789 Pine St', 'Suite 7', 'Villagetown', 'Statetown', '98765', 'Landcountry'),
('user004', '321 Elm St', NULL, 'Hamletville', 'Stateville', '54321', 'Countryland'),
('user005', '654 Birch St', 'Unit 12', 'Citytown', 'Stateville', '13579', 'Countryville'),
('user006', '987 Maple St', NULL, 'Villageville', 'Stateland', '24680', 'Landcountry'),
('user007', '234 Cedar St', 'Apt 9', 'Towntown', 'Statetown', '87654', 'Countryland'),
('user008', '567 Pine St', NULL, 'Citytown', 'Stateville', '23456', 'Countryville'),
('user009', '890 Oak St', 'Suite 3', 'Villagetown', 'Stateland', '65432', 'Landcountry'),
('user010', '123 Birch St', 'Unit 8', 'Hamletville', 'Stateville', '87654', 'Countryland'),
('user011', '456 Cedar St', NULL, 'Citytown', 'Statetown', '34567', 'Countryville'),
('user012', '789 Maple St', 'Apt 2', 'Towntown', 'Stateland', '98765', 'Landcountry'),
('user013', '321 Elm St', NULL, 'Villagetown', 'Statetown', '12345', 'Countryland'),
('user014', '654 Pine St', 'Suite 5', 'Cityville', 'Stateville', '56789', 'Countryville'),
('user015', '987 Oak St', NULL, 'Hamletville', 'Stateville', '54321', 'Landcountry'),
('user016', '234 Birch St', 'Unit 10', 'Villageville', 'Stateland', '13579', 'Countryland'),
('user017', '567 Maple St', NULL, 'Towntown', 'Statetown', '98765', 'Countryville'),
('user018', '890 Cedar St', 'Apt 1', 'Citytown', 'Stateville', '24680', 'Landcountry'),
('user019', '123 Pine St', NULL, 'Hamletville', 'Stateville', '65432', 'Countryland'),
('user020', '456 Oak St', 'Suite 4', 'Villageville', 'Stateland', '87654', 'Countryville');


-- Insert sample records into the 'carts' table
INSERT INTO carts (user_id, book_id, quantity)
VALUES 
('user001', 1, 2),
('user002', 2, 1),
('user003', 3, 3),
('user004', 4, 1),
('user005', 5, 2),
('user006', 6, 1),
('user007', 7, 2),
('user008', 8, 3),
('user009', 9, 1),
('user010', 10, 2),
('user011', 11, 1),
('user012', 12, 3),
('user013', 13, 2),
('user014', 14, 1),
('user015', 15, 3),
('user016', 16, 1),
('user017', 17, 2),
('user018', 18, 1),
('user019', 19, 3),
('user020', 20, 1);

-- Vložení ukázkových záznamů do tabulky 'orders' s aktualizovanými celkovými částkami
INSERT INTO orders (user_id, total_amount, status, payment_status)
VALUES 
('user001', 43.96, 'Completed', 'Paid'),    -- The Catcher in the Rye
('user002', 22.78, 'Pending', 'Pending'),   -- To Kill a Mockingbird
('user003', 75.20, 'Shipped', 'Paid'),   -- Pride and Prejudice
('user004', 23.98, 'Pending', 'Pending'),   -- The Great Gatsby
('user005', 39.96, 'Completed', 'Paid'),    -- One Hundred Years of Solitude
('user006', 39.99, 'Completed', 'Paid'),    -- The Lord of the Rings
('user007', 45.50, 'Completed', 'Paid'),    -- Brave New World
('user008', 28.90, 'Pending', 'Pending'),   -- Crime and Punishment
('user009', 86.69, 'Completed', 'Paid'),    -- The Hobbit
('user010', 28.67, 'Pending', 'Pending'),   -- Moby-Dick
('user011', 60.00, 'Completed', 'Paid'),    -- War and Peace
('user012', 70.00, 'Pending', 'Pending'),   -- The Odyssey
('user013', 42.30, 'Pending', 'Pending'),   -- The Brothers Karamazov
('user014', 37.50, 'Completed', 'Paid'),    -- The Alchemist
('user015', 65.80, 'Pending', 'Pending'),   -- Frankenstein
('user016', 23.40, 'Completed', 'Paid'),    -- The Picture of Dorian Gray
('user017', 58.60, 'Pending', 'Pending'),   -- The Hunger Games
('user018', 80.00, 'Completed', 'Paid'),    -- A Tale of Two Cities
('user019', 95.25, 'Completed', 'Paid'),    -- The Little Prince
('user020', 62.10, 'Pending', 'Pending');   -- The Catcher in the Rye


-- Vložení ukázkových záznamů do tabulky 'payments' s aktualizovanými částkami
INSERT INTO payments (order_id, payment_method, transaction_id, amount)
VALUES 
(1, 'Credit Card', 'ABC123', 43.96),    -- The Catcher in the Rye
(5, 'PayPal', 'XYZ789', 39.96),          -- One Hundred Years of Solitude
(3, 'Debit Card', '123DEF', 30.51),      -- 1984
(2, 'Credit Card', '456GHI', 22.78),     -- To Kill a Mockingbird
(4, 'Cash', '789JKL', 23.98),            -- The Great Gatsby
(6, 'Credit Card', 'MNO456', 39.99),     -- The Lord of the Rings
(7, 'PayPal', 'PQR789', 45.50),          -- Brave New World
(8, 'Debit Card', 'STU123', 28.90),      -- Crime and Punishment
(9, 'Credit Card', 'VWX456', 86.69),     -- The Hobbit
(10, 'Cash', 'YZA789', 28.67),           -- Moby-Dick
(11, 'Credit Card', 'BCD123', 60.00),    -- War and Peace
(12, 'PayPal', 'EFG789', 70.00),         -- The Odyssey
(13, 'Debit Card', 'HIJ123', 42.30),     -- The Brothers Karamazov
(14, 'Credit Card', 'KLM456', 37.50),    -- The Alchemist
(15, 'PayPal', 'NOP789', 65.80),         -- Frankenstein
(16, 'Debit Card', 'QRS123', 23.40),     -- The Picture of Dorian Gray
(17, 'Credit Card', 'TUV456', 58.60),    -- The Hunger Games
(18, 'Cash', 'WXY789', 80.00),           -- A Tale of Two Cities
(19, 'Credit Card', 'ZAB123', 95.25),    -- The Little Prince
(20, 'PayPal', 'CDE789', 62.10);         -- The Catcher in the Rye

-- Vložení ukázkových záznamů do tabulky 'order_items' s aktualizovanými cenami
INSERT INTO order_items (order_id, book_id, quantity, subtotal)
VALUES
(1, 1, 2, 21.98),    -- The Catcher in the Rye
(1, 2, 1, 14.99),    -- To Kill a Mockingbird
(2, 3, 3, 26.97),    -- 1984
(3, 4, 1, 7.99),     -- Pride and Prejudice
(4, 5, 2, 23.98),    -- The Great Gatsby
(5, 6, 1, 12.99),    -- One Hundred Years of Solitude
(6, 7, 2, 29.98),    -- The Lord of the Rings
(7, 8, 1, 9.99),     -- Brave New World
(8, 9, 3, 32.97),    -- Crime and Punishment
(9, 10, 1, 14.99),   -- The Hobbit
(10, 11, 2, 23.98),  -- Moby-Dick
(11, 12, 1, 15.99),  -- War and Peace
(12, 13, 3, 26.97),  -- The Odyssey
(13, 14, 1, 9.99),   -- The Brothers Karamazov
(14, 15, 2, 23.98),  -- The Alchemist
(15, 16, 1, 7.99),   -- Frankenstein
(16, 17, 2, 14.99),  -- The Picture of Dorian Gray
(17, 18, 1, 8.99),   -- The Hunger Games
(18, 19, 3, 23.97),  -- A Tale of Two Cities
(19, 20, 1, 6.99),   -- The Little Prince
(20, 1, 1, 21.98);   -- The Catcher in the Rye










