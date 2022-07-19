DROP USER IF EXISTS 'whatabook_user'@'localhost';

-- create whatabook_user and grant them all privileges to the whatabook database 
CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

-- grant all privileges to the whatabook database to user whatabook_user on localhost 
GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

-- drop contstraints if they exist
ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

-- drop tables if they exist
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;

/*
    Create table(s)
*/
CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);


INSERT INTO store(store_id, locale)
    VALUES('1', '555 Silly Way, Sioux City, IA 51104');

INSERT INTO book(book_name, author, details)
    VALUES('1', 'Fundamentals of Information Systems Security', 'David Kim and Michael G. Solomon', 'Third Edition');

INSERT INTO book(book_name, author, details)
    VALUES('2', 'IT Auditing', 'Mike Kegerreis, Mike Schiller, Chris Davis', 'Using Controls To Protect Information Assets');

INSERT INTO book(book_name, author, details)
    VALUES('3', 'Guide To Network Defense and Countermeasures', 'Randy Weaver, Dawn Weaver, Dean Farwood', 'Third Edition');

INSERT INTO book(book_name, author)
    VALUES('4', 'Elementary Information Security', 'Richard E. Smith');

INSERT INTO book(book_name, author, details)
    VALUES('5', 'Access Control and Identity Management', 'Mike Chapple', 'Third Edition');

INSERT INTO book(book_name, author, details)
    VALUES('6', 'Python Crash Course', 'Eric Matthes', 'A Hands-On, Project-based Introduction to Programming');

INSERT INTO book(book_name, author, details)
    VALUES('7', 'The Basics of Digital Forensics', 'John Sammons', 'Second Edition, The Primer for Getting Started in Digital Forensics');

INSERT INTO book(book_name, author, details)
    VALUES('8', 'NoSQL', 'Pramod J. Sadalage and Martin Fowler', 'A Brief Guide to the Emerging World of Polyglot Persistence');

INSERT INTO book(book_name, author)
    VALUES('9', 'Sams Teach Yourself SQL in 10 Minutes', 'Ben Forta');

/*
    insert user
*/ 
INSERT INTO user(first_name, last_name) 
    VALUES('1', 'Ricky', 'Bobby');

INSERT INTO user(first_name, last_name)
    VALUES('2', 'Cole', 'Trickle');

INSERT INTO user(first_name, last_name)
    VALUES('3', 'Richard', 'Petty');

/*
    insert wishlist records 
*/
INSERT INTO wishlist(wishlist_id, user_id, book_id) 
    VALUES ('1', '1', '5');

INSERT INTO wishlist(wishlist_id, user_id, book_id)
    VALUES ('3', '2', '4');

INSERT INTO wishlist(wishlist_id, user_id, book_id)
    VALUES ('2', '3', '1');
