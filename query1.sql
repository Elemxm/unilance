-- Find how many people have rated me and my average rating 
SELECT user.id, user.name, avg(rating.stars), count(rating.rating_user_id)
FROM user JOIN rating ON user.id = rating.rated_user_id
WHERE user.id = 1;