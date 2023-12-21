-- Find all my unread messages
SELECT user.username, user.email, message.message, message.date
FROM message JOIN user ON message.sender_user_id = user.id
WHERE recipient_user_id = 1;