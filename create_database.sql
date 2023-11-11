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
    -- id          INT AUTO_INCREMENT PRIMARY KEY,
    -- is_employee BOOLEAN,
    user_id     INT,
    type        ENUM('EMPLOYEE', 'EMPLOYER'),
    rating      INT,
    FOREIGN KEY (user_id) REFERENCES user(id),
    PRIMARY KEY (user_id, type)
);

CREATE TABLE educational_institutions (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    name            TEXT,
    website         VARCHAR(255),
    contact_email   VARCHAR(100),
    contact_phone   VARCHAR(20)
);

CREATE TABLE project (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    employee_user_id    INT,
    employer_user_id    INT,
    job_title           TEXT,
    job_description     TEXT,
    status              ENUM('NEW', 'ONGOING', 'DONE'),
    start_date          TIMESTAMP,
    end_date            TIMESTAMP,
    location            TEXT,
    reward              INT,
    FOREIGN KEY (employee_user_id) REFERENCES user(id),
    FOREIGN KEY (employer_user_id) REFERENCES user(id),
);

CREATE TABLE skill_category (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    category_name   VARCHAR(255) UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE skill (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    name        TEXT,
    description TEXT,
    FOREIGN KEY (category_id) REFERENCES skill_category(id)
);

CREATE TABLE project_skill_category (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    project_id          INT,
    skill_category_id   INT,
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (skill_category_id) REFERENCES skill_category(id)
);

CREATE TABLE project_skill (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    project_id  INT,
    skill_id    INT,
    FOREIGN KEY (project_id) REFERENCES project(id),
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

CREATE TABLE ratings (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    stars           INT,
    date            TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rating_user_id  INT,
    rated_user_id   INT,
    
    --FOREIGN KEY (rating_user_id, rating_user_is_employee) REFERENCES user_status(user_id, is_employee),
    --FOREIGN KEY (rating_user_id, !rating_user_is_employee) REFERENCES user_status(user_id, is_employee),
    --rating_user_is_employee BOOLEAN

    FOREIGN KEY (rating_user_id) REFERENCES user_status(user_id, type),
    FOREIGN KEY (rated_user_id) REFERENCES user_status(user_id, type)
);

CREATE TABLE transactions (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    project_id          INT NOT NULL,
    employee_user_id    INT NOT NULL,
    employer_user_id    INT NOT NULL,
    amount              DECIMAL(10, 2) NOT NULL,
    created_date        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_status      ENUM('pending', 'completed', 'failed') NOT NULL,
    payment_date        TIMESTAMP,
    FOREIGN KEY (employer_user_id) REFERENCES user(id),
    FOREIGN KEY (employee_user_id) REFERENCES user(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);


--             LIST
-- 1) educational_institutions
-- 2) problem with user status + Sxolia!
-- 3) Sundesh ratings me user status
-- 4) 
-- 5)