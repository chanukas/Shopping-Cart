DROP DATABASE SHOPPING_CART;
CREATE DATABASE SHOPPING_CART;
USE SHOPPING_CART;

CREATE TABLE ITEM_CATEGORY (
    ID INT(50) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DESCRIPTION VARCHAR(500) NOT NULL
);

INSERT INTO ITEM_CATEGORY(DESCRIPTION) VALUES
('LapTop Computer'),
('Desktop Computer');

CREATE TABLE ITEM(
    ID INT(50) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DESCRIPTION VARCHAR(500) NOT NULL,
    PRICE DECIMAL(10,2) NOT NULL,
    QTY_ON_HAND INT(100) NOT NULL,
    ITEM_CATEGORY_ID INT(50) NOT NULL,
    FOREIGN KEY (ITEM_CATEGORY_ID) REFERENCES ITEM_CATEGORY(ID)
);

INSERT INTO ITEM(DESCRIPTION,PRICE,QTY_ON_HAND,ITEM_CATEGORY_ID)VALUES
('Laptop Ram DDR3L 4GB','6500.00',10,1),
('Desktop Ram DDR4 8GB','12500.00',50,2);

CREATE TABLE CUSTOMER(
    ID INT(50) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    MOBILE VARCHAR(50) NOT NULL,
    USER_NAME VARCHAR(50) NOT NULL,
    PASSWORD VARCHAR(400) NOT NULL
);

INSERT INTO CUSTOMER(NAME,MOBILE,USER_NAME,PASSWORD) VALUES
('Chanuka Sandaruwan','0764855970','chanuka','123456'),
('Sadeesha Eranga','0778445654','sadi','123');



