## Possible user queries (either its emplyer either its employee)

### 1. List all jobs that are available (not done) and order by status (new first) date (closest day first) 
```SQL
SELECT *
FROM job_listing
WHERE status <> 'DONE'
ORDER BY
	FIELD(status, 'NEW', ONGOING) DESC,
	ABS(DATEDIFF(CURRENT_TIMESTAMP, COALESCE(start_date), CURRENT_TIMESTAMP)) -- ensure that closest start date comes first and list after those the job listings without start_date
```

### 2. Get all job listing details including category and skills
```SQL
SELECT jl.id, jl.job_title, jl.job_description, c.category_name, s.name as skill_name
FROM job_listing jl
JOIN job_listing_category jlc ON jl.id = jlc.job_listing_id
JOIN category c ON jlc.category_id = c.id
LEFT JOIN job_listing_skill jls ON jl.id = jls.job_listing_id
LEFT JOIN skill s ON jls.skill_id = s.id
WHERE jl.id = 1; -- Replace 1 with the desired job listing ID

```

### 3. List all users that have applied for a specific job listing (with id `10` for example)
```SQL
SELECT u.id, u.name, u.email
FROM user u
JOIN application a ON u.id = a.user_id
WHERE a.job_listing_id = 10 -- job_listing 10 is an example of a job post
```

### 4. Employer average rating for user 7 (u may extract that as a function for MySQL db)
```SQL
SELECT AVG(r.starts) as average_rating
FROM ratings r
JOIN user_status us ON r.rating_user_status_id = us.id
WHERE us.type = 'EMPLOYER'
	AND us.user_id = 7; -- example id of user (you do not need to join the table of user if you know the user id)
```

### 5. List users with the highest average rating first (round the number to have 2 decimals)
```SQL
SELECT u.id, u.name, ROUND(AVG(r.stars), 2) as average_rating
FROM user u
JOIN user_status us ON u.id = us.user_id
LEFT JOIN ratings r ON us.id = r.rating_user_status_id
GROUP BY u.id, u.name
ORDER BY average_rating ASC;
```

### 6. List users that are perfect fit for job listing with id 99 (for premium pornhub members only)
> The most complex query I could think of

This query returns a list of users and then how much fit they have on my job based only on their skills.
For example if I have 8 skills at my job listing and there is a user that has all of them, then the fit is `100%`. if he has 6 of them then the perfentage is `75%`. Users with 0% are exluded from the list.
```SQL
SELECT
    u.id,
    u.name,
    -- Calculate fit percentage based on matching skills
    ROUND(
        (COUNT(DISTINCT jls.skill_id) / (SELECT COUNT(DISTINCT skill_id) FROM job_listing_skill WHERE project_id = 1)) * 100,
        2
    ) as fit_percentage
FROM
    user u
JOIN
    job_listing_skill jls ON u.id = jls.skill_id
WHERE
    u.id NOT IN (
        -- Exclude users with 0% fit (no matching skills)
        SELECT DISTINCT u.id
        FROM user u
        WHERE u.id NOT IN (
            SELECT u.id
            FROM user u
            JOIN job_listing_skill jls ON u.id = jls.skill_id
            WHERE jls.project_id = 99 -- Replace 1 with the desired job listing ID
        )
    )
GROUP BY
    u.id, u.name
ORDER BY
    fit_percentage DESC;

```
