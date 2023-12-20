-- 1
SELECT user.id, user.name, avg(rating.stars), count(rating.rating_user_id)
FROM user JOIN rating ON user.id = rating.rated_user_id
WHERE user.id = 1;

-- 2
SELECT 
	rating.*,
    rating_user.username AS rater_username,
    rated_user.username AS rated_username
FROM 
	rating
JOIN 
	user AS rating_user ON rating.rating_user_id = rating_user.id
JOIN
	user AS rated_user ON rating.rated_user_id = rated_user.id
WHERE 
	rating_user.id = 1;

-- 3
SELECT *
FROM application JOIN employee ON application.employee_id = employee.id
WHERE application.job_listing_id = 4;

-- 4
SELECT 
	job_listing.job_title, 
	application.application_status, 
    job_listing.company_id
FROM 
	application 
JOIN 
	job_listing 
ON 
	application.job_listing_id = job_listing.id
WHERE 
	employee_id = 1;

-- 5
SELECT user.username, user.email, message.message, message.date
FROM message JOIN user ON message.sender_user_id = user.id
WHERE recipient_user_id = 1;
