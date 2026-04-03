-- PROJECT: SOCIAL MEDIA ANALYTICS -- --
-- To Create socialmedia_db database
CREATE DATABASE IF NOT EXISTS socialmedia_db;
Use socialmedia_db
/* Today's challenge-KEYS, CONSTRAINTS, INSERT/UPDATE/DELETE 
Challenge 1 — Posts Table with Constraints
Create a posts table:
Column -Type  -Constraint
post_id-INT- PK, auto_increment
user_id- INT -FK → users.user_id
caption-TEXT
posted_at-DATETIME ->DEFAULT CURRENT-TIMESTAMP

Challenge 2 – Followers Table
Create a followers table:
Column-Type-->Constraint
follower_id-INT-->FK → users.user_id
following_id-INT-->FK → users.user_id
follow_date-DATETIME-->DEFAULT CURRENT_TIMESTAMP */

CREATE TABLE users(
user_id INT AUTO_INCREMENT PRIMARY KEY, 
user_name VARCHAR(50) NOT NULL UNIQUE, 
email VARCHAR(100) NOT NULL UNIQUE
);


create table if not exists posts(
 post_id INT PRIMARY KEY AUTO_INCREMENT,
 user_id INT,
 caption TEXT,
 posted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (user_id) REFERENCES users(user_id)
);

create table if not exists followers(
follower_id INT,
following_id INT,
follow_date DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (follower_id) references users(user_id),
FOREIGN KEY (following_id) references users(user_id)
);

--- INSERT --
INSERT INTO users(user_name,email)
VALUES ('kavi','kavi@gmail.com'),
('arun','arun@yahoo.com'),
('malar','malar@hotmail.com'),
('vinoth','vinoth@email.com'),
('bala','bala@gmailcom'),
('rekha','rekha@yahoo.com'),
('divya','divyaa@hotmail.com'),
('ajith','ajith@email.com'),
('deepa','deepa@gmail.com'),
('jonathan','jonathan@yahoo.com'),
('bruce','bruce@hotmail.com'),
('glory','glory@email.com');
select * from users;

insert into posts(
    user_id,caption,posted_at)values
    ("1", "Golden Day",'2024-02-15 12:58:07'),
    ("2", "Lost in the pink city",'2025-01-01 15:01:35'),
    ("3", "Morning view are most peacefull.",'2024-07-25 17:05:55'),
    ("4", "Friends outing day ",'2025-10-01 11:35:06'),
    ("5", "Need a peacefull life ",'2024-09-09 06:45:36'),
    ("6", "womens day celebration.",'2023-12-25 19:35:44'),
    ("7", "Another day, another masterpiece.",'2024-11-06 07:10:59'),
    ("8", "No filter needed for this view. ",'2024-04-11 05:30:22'),
    ("9", "sunkissed glow face",'2024-12-15 08:33:22'),
    ("10", "blessed day . ",'2024-12-01 06:00:25'),
    ("11", "have a nice day",'2024-12-07 08:00:25'),
    ("12", "started with a divine blessing.",'2025-12-01 09:00:25');
  
    select*from posts;
    
    INSERT INTO followers (follower_id, following_id) VALUES
("1", "2"),
("1", "3"),
("2", "3"),
("3", "4"),
("4", "5"),
("5", "6"),
("6", "7"),
("7", "8"),
("8", "9"),
("9","10"),
("10", "11"),
("11", "12"),
("12","1");
select * from followers;

-- distinct,where,in,between,null checks
-- challenge 1 - filter users
-- Retrieve all users whose name starts with "a".
select * from users 
where user_name like 'a%';

-- posts filter 
-- get posts posted between '2024-01-01, and '2024-12-31'.
select * from posts
where posted_at between '2024-01-01' AND '2024-12-31';

-- NULL checks
-- find posts that have null captions.
Select * from posts 
where caption is NULL;

-- IN CLAUSE
-- Find users whose email domain is in ;
SELECT*FROM users
WHERE email LIKE '%@gmail.com'
OR email LIKE '%@hotmail.com'
OR email LIKE '%@yahoo.com';

select * from posts;

-- SESSION 31 – ORDER BY, GROUP BY, LIMIT, HAVING -- 
-- Challenge 1 — Top Active Users / Sort users by number of posts (DESC) and LIMIT 5 --
SELECT user_id,COUNT(post_id) as No_of_posts FROM posts
GROUP BY user_id
ORDER BY No_of_posts DESC
LIMIT 5;

-- Challenge 2 — Group by Posts Per Day Group posts by DATE(posted_at) and return: date total posts Only show days with more than 10 posts (HAVING) --
select date(posted_at) as post_date, count(post_id) as total_posts from posts
Group by post_date 
Having total_posts > 1;

-- Session -32 - Joins,Union,Built In Functions
-- Challenge 1 Comments Table --
create table if not exists comments(
 comment_id int primary key auto_increment,
 post_id int,
 user_id int,
 comment_text Text,
 commemted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 Foreign Key (post_id) REFERENCES posts(post_id),
 Foreign key (user_id) REFERENCES users(user_id)
 );
 
 create table if not exists likes(
 like_id int primary key auto_increment,
 post_id int,
 user_id int,
 liked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 Foreign Key (post_id) REFERENCES posts(post_id),
 Foreign key (user_id) REFERENCES users(user_id)
 );
 

INSERT INTO comments (post_id, user_id, comment_text) VALUES
(27, 6, 'Nice one'),
(28, 7, 'Great post'),
(29, 8, 'Loved it'),
(30, 9, 'Cool'),
(31, 10, 'Amazing day'),
(32, 11, 'Good painting'),
(33, 12, 'Super mountain view');
 
 select * from comments;
 
 INSERT INTO likes (post_id, user_id) values
 (27, 2),
(27, 3),
(28, 1),
(28, 4),
(29, 5),
(30, 6),
(31, 7),
(32, 8),
(33, 9),
(34, 10),
(35, 11),
(36, 12),
(37, 2),
(38, 3);

select * from likes;

-- chellenge 2 JOIN Report --
-- Display:  post_id, username, caption, total likes, total comments.*/--    
select p.post_id,u.user_name,p.caption,count(distinct l.like_id)as 'total_likes',count(distinct c.comment_id)as 'total_comments'
from posts p
JOIN users u ON u.user_id=p.user_id
LEFT JOIN comments c ON c.post_id=p.post_id
LEFT JOIN likes l ON l.post_id=p.post_id    
GROUP BY p.post_id,u.user_name,p.caption;

-- Chellenge 3 Built in Functions - Built-in Functions
-- Show usernames in UPPER case. Extract month name from posted_at. Return the length of each caption.*/--
SELECT UPPER(user_name) user_name FROM users;
SELECT MONTHNAME(posted_at) Month_Posted FROM posts;
SELECT LENGTH(caption) Length_of_caption FROM posts;

-- Chellenge 4  Union --
-- Combine list of users who commented or liked--
SELECT user_id FROM comments
UNION
SELECT user_id FROM likes;	

-- Session -33 - FUNCTIONS, SUBQUERIES, STORED PROCEDURES
-- Challenge 1 — User Defined Function --
-- Create a function: 
-- GetUserEngagement(user_id) Returns total likes + comments made by the user --
delimiter //
DELIMITER //

CREATE FUNCTION GetUserEngagement(p_user_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_likes INT DEFAULT 0;
    DECLARE total_comments INT DEFAULT 0;
    SELECT COUNT(*) INTO total_likes FROM likes 
    WHERE user_id = p_user_id;
	SELECT COUNT(*) INTO total_comments FROM comments 
    WHERE user_id = p_user_id;
    RETURN total_likes + total_comments;
END //

DELIMITER ;

SELECT * FROM likes;
select GetUserEngagement(3) as engagement;

-- Challenge 2 Subquery
-- Find users who have more followers than the average follower count --
SELECT following_id, COUNT(follower_id) AS follower_count
FROM followers
GROUP BY following_id
HAVING COUNT(follower_id) > (
    SELECT AVG(f_count)
    FROM (
        SELECT COUNT(follower_id) AS f_count
        FROM followers
        GROUP BY following_id
    ) AS avg_table
);

-- Challenge 3 — Stored Procedure --
-- Stored procedure to retrieve all posts for a given username --
CREATE PROCEDURE Posts(IN user_name VARCHAR(50))
BEGIN
    SELECT p.*
    FROM posts p
    JOIN users u ON p.user_id = u.user_id
    WHERE u.user_name = user_name
END //
delimiter ;
CALL Posts('arun');

select * from users;
SELECT user_id FROM users WHERE user_name = 'arun';

-- SESSION 34 – VIEWS & TRIGGERS --
-- Challenge 1 — View --
-- Create a view post_summary showing: post_id, username, caption,total likes,total comments --
create view post_summary as
select p.post_id, u.user_name, 
(SELECT COUNT(*) FROM likes l WHERE l.post_id = p.post_id) AS total_likes,
(SELECT COUNT(*) FROM comments c WHERE c.post_id = p.post_id) AS total_comments
from posts p
join users u on p.user_id=u.user_id;
select * from post_summary;

-- Challenge 2 — Trigger --
-- Trigger on likes table:-- 
-- When a user likes a post, insert a row into a new table: notifications (user_id, message, created_at) --
CREATE TABLE IF NOT EXISTS notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    message VARCHAR(350),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER like_notification
AFTER INSERT ON likes
FOR EACH ROW
BEGIN
    DECLARE post_owner INT;

    -- Get the post owner's user_id
    SELECT user_id INTO post_owner
    FROM posts
    WHERE post_id = NEW.post_id;

    -- Insert notification
    INSERT INTO notifications (user_id, message)
    VALUES (
        post_owner,
        CONCAT('User ', NEW.user_id, ' liked your post')
    );
END //

DELIMITER ;
INSERT INTO likes (post_id, user_id) VALUES (27, 2);
select * from notifications;

-- SESSION 36 – FINAL PROJECT: SOCIAL MEDIA ANALYTICS --
-- Top influencers (users with highest total engagement) --
SELECT 
    user_name,
    GetUserEngagement(user_id) AS total_engagement
FROM users
ORDER BY total_engagement DESC
LIMIT 5;
-- virality report (posts with unusually high engagement) --
SELECT * FROM post_summary;
SELECT post_id,user_name,caption,total_likes + total_comments Total_engagement
FROM post_summary
HAVING Total_engagement > 
(SELECT AVG(total_engagement_val) FROM 
(SELECT post_id,total_likes + total_comments total_engagement_val FROM post_summary HAVING total_engagement_val <> 0) average_engagement);

-- User activity timeline (daily/weekly posting patterns)
SELECT DAYNAME(posted_at) day_of_week, COUNT(*) Total_posts
FROM posts
GROUP BY day_of_week
ORDER BY total_posts DESC; -- 

-- Follower growth (who gained the most followers recently)
INSERT INTO followers (follower_id, following_id) VALUES
(1, 2),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5),
(11, 6),
(12, 6),
(2, 1);
SELECT * FROM followers;
SELECT * FROM users;
SELECT 
    u.user_name,
    COUNT(f.follower_id) AS total_followers
FROM followers f
JOIN users u ON f.following_id = u.user_id
GROUP BY f.following_id, u.user_name
ORDER BY total_followers DESC;

-- arun,malar,bala,rekha,vinoth has more than 2 follower
SELECT * FROM posts;
-- Trending hashtags (most used hashtags in last 30 days)

CREATE TABLE IF NOT EXISTS hashtags (
    tag_id INT PRIMARY KEY AUTO_INCREMENT,
    tag_name VARCHAR(50) UNIQUE
);

INSERT INTO hashtags (tag_name) VALUES 
('#SQLTips'), 
('#DataAnalytics'), 
('#Codingtech'), 
('#pythontips'), 
('#DatabaseDesign'), 
('#WebDeveloper'), 
('#powerBI'), 
('#MachineLearning'), 
('#Innovation'), 
('#creativethinking');

CREATE TABLE IF NOT EXISTS post_hashtags (
    post_id INT,
    tag_id INT,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (tag_id) REFERENCES hashtags(tag_id)
);

select * from hashtags;


INSERT INTO post_hashtags (post_id, tag_id) VALUES
(27, 3),   -- #Codingtech
(27, 1),   -- #SQLTips
(28, 10),  -- #creativethinking
(28, 9),   -- #Innovation
(29, 2),   -- #DataAnalytics
(29, 4),   -- #pythontips
(30, 7),   -- #powerBI
(30, 10),  -- #creativethinking
(31, 5),   -- #DatabaseDesign
(31, 9),   -- #Innovation
(32, 10),  -- #creativethinking
(33, 3),   -- #Codingtech
(33, 8),   -- #MachineLearning
(34, 6),   -- #WebDeveloper
(34, 4),   -- #pythontips
(35, 9),   -- #Innovation
(36, 1),   -- #SQLTips
(37, 7),   -- #powerBI
(38, 5);   -- #DatabaseDesign
select * from post_hashtags;


SELECT 
    h.tag_name, 
    COUNT(ph.post_id) AS total_uses
FROM hashtags h
JOIN post_hashtags ph ON h.tag_id = ph.tag_id
JOIN posts p ON ph.post_id = p.post_id
WHERE p.posted_at >= DATE_SUB('2025-03-25', INTERVAL 30 DAY) -- Matching your 2025 data
GROUP BY h.tag_id, h.tag_name
ORDER BY total_uses DESC
LIMIT 5;

-- #creative thinking is the trending hashtags in last 30 days 
