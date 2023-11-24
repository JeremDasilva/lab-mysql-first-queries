USE apple_store;

SELECT * FROM apple_store.applestore2;

/* QUESTION 1: Which are the different genres?*/
SELECT DISTINCT 
	prime_genre
FROM
	applestore2;


/* QUESTION 2: Which is the genre with more apps rated?*/
SELECT
	prime_genre,
    COUNT(rating_count_tot) AS count
FROM
	applestore2
WHERE
	rating_count_tot > 0
GROUP BY
	prime_genre
ORDER BY
	count DESC
LIMIT 1;


/* QUESTION 3: Which is the genre with more apps?*/
SELECT
	prime_genre,
    COUNT(id) AS count
FROM 
	applestore2
GROUP BY 
	prime_genre
ORDER BY 
	count DESC
LIMIT 1;


/* QUESTION 4: Which is the one with less?*/
SELECT
	prime_genre,
    COUNT(id) AS count
FROM
	applestore2
GROUP BY
	prime_genre
ORDER BY
	count ASC
LIMIT 1;


/* QUESTION 5: Take the 10 apps most rated.*/
SELECT 
	*
FROM
	applestore2
ORDER BY
	rating_count_tot DESC
LIMIT 10;


/* QUESTION 6: Take the 10 apps best rated by users.*/
SELECT 
	*
FROM
	applestore2
ORDER BY
	user_rating DESC, Column1 ASC
LIMIT 10;


/* QUESTION 7: Take a look on the data you retrieved in the question 5. Give some insights.
It seemsm that the apps with the most rating counts are the most popular ones */


/* QUESTION 8: Take a look on the data you retrieved in the question 6. Give some insights.
First of all it is important that everyone look at the same. That is why I have ordered first by user rating and then by Column 1.
On these 10 lines, we see that 9 of them are not free. I also see that some have unusual names */


/* QUESTION 9: Now compare the data from questions 5 and 6. What do you see?
Data in Q6 are mostly games while data in Q5 are a mix of games and social networks. Also, we see that data in Q5, the most famous apps, have a lower rating than data in Q6*/


/* QUESTION 10: How could you take the top 3 regarding the user ratings but also the number of votes?*/
SELECT 
	*
FROM
	applestore2
ORDER BY
	user_rating DESC, rating_count_tot DESC
LIMIT 3;

/* QUESTION 11:  Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?*/
SELECT 
	*
FROM
	applestore2
ORDER BY
	rating_count_tot DESC
LIMIT 50;

/* I think people do care about the price. I am using the query above, displaying the most rated apps.
I would assume that the more rating you have, the more user you have : if you get 10 ratings, ou need at least 10 users.
Assuming that, and looking at the column price for the top 50, there is only 6 paying app.
Saying so, I would say YES people care about prices
