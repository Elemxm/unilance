
-- 1

CREATE VIEW average_user_rating
AS
  SELECT
    User.id AS user_id,
    AVG(Rating.stars) AS average_rating
FROM
    user User
    LEFT JOIN rating Rating ON User.id = Rating.rated_user_id
GROUP BY
    User.id;


-- 2 
CREATE VIEW recent_job_listings
AS
	SELECT 
		job_title, job_description, reward
FROM 
	job_listing
WHERE 
	job_listing.status = 'NEW';

-- 3
CREATE VIEW contract_details
AS
	SELECT
		contract.id AS contract_id,
		contract.created_date,
		contract.payment_status,
		contract.payment_date,
		application.application_status,
		job_listing.job_title,
		user.username AS applicant_username,
		user.email AS applicant_email
FROM
    job_listing
    JOIN contract ON job_listing.id = contract.job_listing_id
    JOIN application ON contract.application_id = application.job_listing_id
    JOIN employee ON application.employee_id = employee.id
    JOIN user ON employee.user_id = user.id