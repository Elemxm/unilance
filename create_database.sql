CREATE TABLE user (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    name            TEXT,
    date_of_birth   TIMESTAMP,
    username        TEXT NOT NULL,
    password        TEXT NOT NULL,
    email           VARCHAR(255) UNIQUE NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_status (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT,
    type        ENUM('EMPLOYEE', 'EMPLOYER'),
    rating      INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE job_listing (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    employer_user_id    INT,
    job_title           TEXT,
    job_description     TEXT,
    experience_level    ENUM('BEGINNER', 'INTERMEDIATE', 'EXPERT'),
    status              ENUM('NEW', 'ONGOING', 'DONE'),
    start_date          TIMESTAMP,
    end_date            TIMESTAMP,
    location            TEXT,
    reward              INT,
    FOREIGN KEY (employer_user_id) REFERENCES user(id),
);

CREATE TABLE category (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    category_name   VARCHAR(255) UNIQUE NOT NULL,
    description     TEXT
);

CREATE TABLE skill (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    name        TEXT,
    description TEXT,
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE job_listing_category (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    job_listing_id          INT,
    category_id         INT,
    FOREIGN KEY (job_listing_id) REFERENCES job_listing(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE job_listing_skill (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    job_listing_id  INT,
    skill_id    INT,
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
    rating_user_status_id   INT,
    rated_user_status_id    INT,
    FOREIGN KEY (rating_user_status_id) REFERENCES user_status(id),
    FOREIGN KEY (rated_user_status_id) REFERENCES user_status(id)
);

CREATE TABLE application (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    job_listing_id      INT NOT NULL,
    user_id             INT NOT NULL,
    created_date        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    application_status  ENUM('NEW', 'PROCESSED', 'ACCEPTED', 'REJECTED') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (job_listing_id) REFERENCES job_listing(id)
);

CREATE TABLE contract (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    job_listing_id          INT NOT NULL,
    employee_user_id    INT NOT NULL,
    employer_user_id    INT NOT NULL,
    amount              DECIMAL(10, 2) NOT NULL,
    created_date        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_status      ENUM('PENDING', 'COMPLETED', 'FAILED') NOT NULL,
    payment_date        TIMESTAMP,
    FOREIGN KEY (employer_user_id) REFERENCES user(id),
    FOREIGN KEY (employee_user_id) REFERENCES user(id),
    FOREIGN KEY (job_listing_id) REFERENCES job_listing(id)
);
