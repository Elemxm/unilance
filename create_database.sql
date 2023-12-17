DROP SCHEMA IF EXISTS `student`;
CREATE SCHEMA `student`;
USE `student`;

-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: student
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS user;
CREATE TABLE user (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(255) NOT NULL,
    username        VARCHAR(50) NOT NULL,
    password        VARCHAR(255) NOT NULL,
    email           VARCHAR(255) NOT NULL,
    created_at      TIMESTAMP,
    location        VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE employee (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    user_id         INT,
    date_of_birth   DATE,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE company (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    user_id         INT,
    founded_date    DATE,
    VAT_number      INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE job_listing (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    company_id          INT,
    job_title           VARCHAR(50),
    job_description     TEXT,
    experience_level    ENUM('BEGINNER', 'INTERMEDIATE', 'EXPERT'),
    status              ENUM('NEW', 'ONGOING', 'DONE'),
    start_date          TIMESTAMP,
    end_date            TIMESTAMP,
    location            VARCHAR(255),
    reward              DECIMAL(10, 2),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE category (
    id				INT AUTO_INCREMENT PRIMARY KEY,
    name   			VARCHAR(255) UNIQUE NOT NULL,
    description     TEXT
);

CREATE TABLE skill (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    category_id 	INT,
    name            VARCHAR(50),
    description     TEXT,
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE user_skill (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    skill_id    INT,
    user_id     INT,
    FOREIGN KEY (skill_id) REFERENCES skill(id),
    FOREIGN KEY (user_id) REFERENCES employee(id)
);

CREATE TABLE job_listing_category (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    job_listing_id      INT,
    category_id         INT,
    FOREIGN KEY (job_listing_id) REFERENCES job_listing(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE job_listing_skill (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    job_listing_id      INT,
    skill_id            INT,
    FOREIGN KEY (job_listing_id) REFERENCES job_listing(id),
    FOREIGN KEY (skill_id) REFERENCES skill(id)
);

CREATE TABLE message (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    sender_user_id      INT NOT NULL,
    recipient_user_id   INT NOT NULL,
    message             TEXT,
    date                TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read             BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (sender_user_id) REFERENCES user(id),
    FOREIGN KEY (recipient_user_id) REFERENCES user(id)
);

CREATE TABLE rating (
    id                      INT AUTO_INCREMENT PRIMARY KEY,
    stars                   INT,
    date                    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rating_user_id          INT,
    rated_user_id           INT,
    description				TEXT,
    FOREIGN KEY (rating_user_id) REFERENCES user(id),
    FOREIGN KEY (rated_user_id) REFERENCES user(id)
);

CREATE TABLE application (
    id                      INT AUTO_INCREMENT PRIMARY KEY,
    job_listing_id          INT NOT NULL,
    employee_id             INT NOT NULL,
    created_date            TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    application_status      ENUM('NEW', 'PROCESSED', 'ACCEPTED', 'REJECTED') NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (job_listing_id) REFERENCES job_listing(id)
);

CREATE TABLE contract (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    job_listing_id      INT NOT NULL,
    application_id      INT NOT NULL,
    created_date        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_status      ENUM('PENDING', 'COMPLETED', 'FAILED') NOT NULL,
    payment_date        TIMESTAMP,
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (job_listing_id) REFERENCES job_listing(id)
);
