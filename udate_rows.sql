INSERT INTO application
VALUES	(1, 1, 1, '2023-02-01 09:00:00', 'PROCESSED'),
		(2, 2, 2, '2023-01-25 08:00:00', 'ACCEPTED'),	
		(3, 3, 3, '2023-02-20 10:45:09', 'NEW'),
		(4, 4, 4, '2023-01-05 08:11:00', 'REJECTED'),
        (5, 5, 5, '2023-01-06 15:48:22', 'PROCESSED');

INSERT INTO user
VALUES 		(1, 'John Doe', 'johndoe', '********', 'john@example.com', '2023-01-01 10:00:00', 'Ikoniou 28, Thessaloniki, 54453'),
			(2, 'Jane Smith', 'janesmith', '********', 'jane@example.com', '2023-01-02 11:00:00', 'Dim. Gounari 24, Thessaloniki, 54622'),
			(3, 'Bob Brown', 'bobbrown', '********', 'bob@example.com', '2023-01-03 12:00:00', 'Delfon 128, Thessaloniki, 54643'),
			(4, 'Alice Green', 'alicegreen', '********', 'alice@example.com', '2023-01-04 13:00:00', 'Valaoritou 19, Thessaloniki, 54625'),
			(5, 'Charlie Black', 'charlieblack', '********', 'charlie@example.com', '2023-01-05 14:00:00', 'Sofouli 89, Thessaloniki, 55131');

INSERT INTO user_skill
VALUES 			(11, 102, 10),
				(35, 68, 35),
				(44, 541, 75),
				(85, 681, 95),
				(125, 351, 5);

INSERT INTO category
VALUES				(1, 'Graphic Design & Multimedia', 'This category encompasses a wide range of writing services, including copywriting for marketing materials, blog and article writing, technical documentation, editing, and creative content creation.'),
                    (2, 'Programming & Development', 'Developers in this category specialize in creating websites, mobile apps, software solutions, and managing databases. Whether it’s front–end design or back-end functionality, skilled developers...'),
                    (3, 'Writing & Content', 'This category encompasses a wide range of writing services, including copywriting for marketing materials, blog and article writing, technical documentation, editing, and creative content creation'),
                    (4, 'Digital Marketing', 'Digital marketing professionals excel in online strategies, including SEO to improve search visibility, social media management, email marketing campaigns, PPC advertising, and content marketing for brand promotion.'),
                    (5, 'Creative Arts', 'Language experts offer translation services, language tutoring, and proofreading. This category is essential for businesses and individuals looking to communicate effectively across diverse linguistic backgrounds.');

INSERT INTO company
VALUES 				(11, 17, '2001-09-25', 483917489),
					(10, 19, '1997-02-18', 472917481),
					(91, 51, '1997-02-01', 481749186),
					(58, 81, '2001-10-20', 897690175),
					(15, 812, '2001-02-27', 173983210);

INSERT INTO contract 
VALUES 	(165, 1, 1, '2023-02-02 10:00:00', 'PENDING', '2022-06-22 09:00:00'),
		(26, 2, 2, '2023-01-25 15:30:00', 'COMPLETED', '2023-02-28 16:00:00'),
        (3, 3, 3, '2023-02-12 09:00:00', 'PENDING', '2023-04-19 15:01:08'),
        (441, 4, 4, '2023-03-05 14:00:00', 'COMPLETED', '2023-03-31 17:00:00'),
        (544, 5, 5, '2023-01-20 08:00:00', 'PENDING', '2023-08-30 14:41:51');


INSERT INTO employee
VALUES 	(1, 1, '2004-05-29'),
		(2, 2, '2000-08-12'),
        (3, 3, '1998-01-05'),
        (4, 4, '1999-12-30'),
        (5, 5, '2003-07-24');

INSERT INTO job_listing_category
VALUES 		(12, 125, 165),
			(23, 244, 255),	
			(52, 544, 543),
			(564, 458, 854),
			(562, 555, 231);

INSERT INTO job_listing
VALUES 		
			(1, 2, 'Graphic Design', 'Looking for a graphic designer for branding...', 'INTERMEDIATE', 'NEW', '2023-02-01 10:15:59', '2023-02-15 16:04:05', 'Remote', 300),
			(2, 2, 'Web Developer', 'Need a developer to create a responsive website', 'EXPERT', 'DONE', '2023-01-20 08:14:34', '2023-03-01 19:28:06', 'New York', 1000),
			(3, 4, 'SEO Specialist', 'Searching for an SEO specialist to improve website rank', 'INTERMEDIATE', 'NEW', '2023-02-10 19:06:37', '2023-04-10 03:29:16', 'Remote', 600),
			(4, 4, 'Content Writer', 'Looking for a content writer with tech industry experience', 'BEGINNER', 'ONGOING', '2023-03-01 12:05:19', '2023-04-01 13:34:35', 'Remote', 500),
			(5, 2, 'Data Analyst', 'Data analyst needed for market analysis project', 'EXPERT', 'NEW', '2023-01-15 15:06:58', '2023-02-28 04:24:12', 'Athens', 1200);

INSERT INTO job_listing_skill
VALUES 		(10, 121, 13),
			(25, 452, 15),
			(65, 851, 35),
			(95, 1203, 26),
			(222, 258, 21);

INSERT INTO message
VALUES 		(43214, 110, 255, 'Hi there, I am interested in Graphic Design...', '2023-02-01 09:15:00', 0),
			(12345, 26, 1, 'Thank you for applying. Can you share your portfolio?', '2023-02-01 19:31:32', 1),
			(8241, 3, 1, 'Any news on this?', '2023-03-06 12:25:00', 0),
			(4135, 4, 5671, 'Fine by me!', '2022-03-12 04:50:22', 1),
			(143142, 5, 643, 'Did you check this?', '2022-06-04 07:18:00', 0);

INSERT INTO Rating
VALUES 		(1, 5, '2023-03-01 12:00:00', 2, 1, 'This user did a really good job'),
			(2, 2, '2023-03-02 14:30:00', 1, 2, 'This user did not do good job'),
			(3, 1, '2022-12-12 04:36:14', 3, 5, 'Complete unprofessional work, ruined my project!'),
			(4, 5, '2021-10-30 12:25:14', 4, 3, 'Excelled at everything! Would recommend'),
			(5, 4, '2023-06-12 04:45:49', 5, 4, 'He needed some improvement but overall great job');

INSERT INTO skill
VALUES 		(201, 105, 'Photoshop', 'Proficient in Adobe Photoshop'),
			(2, 24, 'JavaScript', 'Experienced in JavaScript coding'),
			(953, 8, 'Team Spirit', 'Experienced in working with large Teams'),
			(154, 95, 'ESP32 Microcontrolers', 'Have successfully collected data from sensors in order to build an application for smart light bulbs'),
			(54, 102, 'Python Programming language', 'Great coding skills and knowledge of libraries used in machine learning applications ');
