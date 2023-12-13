CREATE TABLE user (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(255) NOT NULL,
    username        VARCHAR(50) NOT NULL,
    password        VARCHAR(255) NOT NULL,
    email           VARCHAR(255) UNIQUE NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rating          DECIMAL(2, 1),
    location        VARCHAR(255),
);


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
    category_name   VARCHAR(255) UNIQUE NOT NULL PRIMARY KEY,
    description     TEXT
);

CREATE TABLE skill (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    category_id     INT,
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
    FOREIGN KEY (rating_use_id) REFERENCES user(id),
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
