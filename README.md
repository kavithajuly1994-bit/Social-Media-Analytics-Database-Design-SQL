Social Media Platform Database Design and Analysis (SQL)
A SQL-based project that designs and analyzes a relational database system simulating a social media platform. The project focuses on managing user data, posts, and interactions such as likes, comments, and followers while generating insights using SQL queries.

📖 Table of Contents
* Project Overview
* Database Description
* Tables & Schema
* Features Implemented
* SQL Concepts Covered
* Key Insights
* How to Use

📊 Project Overview
* This project involves designing and implementing a relational database for a social media platform using SQL.

* The main objective is to store and manage user activities such as posts, likes, comments, and followers, and to analyze user engagement through SQL queries.

🗂️ Database Description
The database represents a simplified social media application where users can:
* Create posts
* Like and comment on posts
* Follow other users
* Analyze engagement and activity patterns
  
🛠️ Tables & Schema
Users
* user_id (Primary Key)
* user_name
* email
  
Posts
* post_id (Primary Key)
* user_id (Foreign Key)
* caption
* posted_at
  
Followers
* follower_id
* following_id
* follow_date
  
Comments
* comment_id (Primary Key)
* post_id
* user_id
* comment_text
* commented_at
  
Likes
* like_id (Primary Key)
* post_id
* user_id
* liked_at
  
Hashtags
* Tag_id
* Tag_name
  
Post_hashtag
* post_id
* tag_id


🚀 Features Implemented
* Database creation using DDL (CREATE TABLE)
* Data insertion and manipulation using DML (INSERT, UPDATE, DELETE)
* Relationship management using Primary and Foreign Keys
* Querying and filtering using SQL conditions
  
📊 SQL Concepts Covered
* Filtering: WHERE, LIKE, IN, BETWEEN, NULL checks
* Sorting & Grouping: ORDER BY, GROUP BY, HAVING, LIMIT
* Joins: INNER JOIN, LEFT JOIN
* Aggregate Functions: COUNT()
* Subqueries
* Views
* Stored Procedures
* User Defined Functions
* Triggers
  
💡 Key Insights
* Content quality drives engagement more than posting frequency
* A small group of users act as top influencers generating most interactions
* High activity does not always translate to high engagement
* Viral posts are identified by significantly higher likes and comments
* Trending hashtags and peak activity periods reveal user behavior patterns
