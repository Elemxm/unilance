-- Find the all my applications and details about them 
SELECT 
	job_listing.job_title, 
	application.application_status, 
    user.name AS company_name 
FROM 
	application 
JOIN job_listing ON application.job_listing_id = job_listing.id
JOIN company ON job_listing.company_id = company.id
JOIN user ON user.id = company.user_id
WHERE 
	employee_id = 1;