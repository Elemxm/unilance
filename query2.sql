-- Find all my ratings 
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