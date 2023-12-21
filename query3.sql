-- Find all the applications that have been made for my job listing
SELECT user.username, user.email, application.created_date AS application_date
FROM application JOIN employee ON application.employee_id = employee.id
	JOIN user ON employee.user_id = user.id
WHERE application.job_listing_id = 4;