/* Delete the tables if they already exist */
drop table if exists Movie;
drop table if exists Reviewer;
drop table if exists Rating;
/* Create the schema for our tables */
create table Movie(mID int, title text, year int, director text);
create table Reviewer(rID int, name text);
create table Rating(rID int, mID int, stars int, ratingDate date);
/* Populate the tables with our data */
insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into Movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
insert into Movie values(106, 'Snow White', 1937, null);
insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');
insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');
insert into Rating values(201, 101, 2, '2011-01-22');
insert into Rating values(201, 101, 4, '2011-01-27');
insert into Rating values(202, 106, 4, null);
insert into Rating values(203, 103, 2, '2011-01-20');
insert into Rating values(203, 108, 4, '2011-01-12');
insert into Rating values(203, 108, 2, '2011-01-30');
insert into Rating values(204, 101, 3, '2011-01-09');
insert into Rating values(205, 103, 3, '2011-01-27');
insert into Rating values(205, 104, 2, '2011-01-22');
insert into Rating values(205, 108, 4, null);
insert into Rating values(206, 107, 3, '2011-01-15');
insert into Rating values(206, 106, 5, '2011-01-19');
insert into Rating values(207, 107, 5, '2011-01-20');
insert into Rating values(208, 104, 3, '2011-01-02');
/*------------------------------------------------*/
INSERT INTO Reviewer VALUES(209,"Roger Elbert");
select title from Movie where director="Steven Spielberg";
select mID from Rating WHERE stars='3' or stars='5';
select * from Rating;
select * from Movie where director IS NULL;
SELECT rID,mID from Rating where ratingDate IS NOT NULL;
select DISTINCT title from Movie join Rating on Movie.mID=Rating.mID where rID=203;
SELECT distinct name from Reviewer join Rating on Reviewer.rID=Rating.rID JOIN Movie on Rating.mID=Movie.mID 
where title="Gone with the Wind";
/*List the details of movies reviewed by both 205 and 203.*/
Select distinct Movie.mid,title,year,director 
from Movie,Rating r1,Rating r2 
where r1.mid = Movie.mid and (r1.rid = '203' and r2.rid = '205') and r1.mid = r2.mid ;
/*Find the names of movies which are reviewed by Chris Jackson or James Cameron.*/
select title from Movie join Rating on Movie.mID = Rating.mID JOIN Reviewer on
Reviewer.rID=Rating.rID where Reviewer.name="Chris Jackson" or Reviewer.name="James Ca
meron";
/*Display ratings of movies which are reviewed by two different reviewers.*/
select Movie.mID,title,year,director,r1.rID,r2.rID from Movie JOIN Rating as r1
 ON Movie.mID=r1.mID JOIN Rating as r2 on r1.mID=r2.mID WHERE r1.rID <> r2.rID;
/*Find the titles of all movies that have no ratings.*/
SELECT title from Movie left outer join Rating on Movie.mID=Rating.mID WHERE stars is null;
/*For all movies that have not been reviewed, return the movies id and titles. (use left join)*/
SELECT Movie.mID,title from Movie LEFT join Rating on Movie.mID=Rating.mID WHERE rID IS NULL;
/*List the names of Directors who have directed more than one movie.*/
select distinct director from Movie group by director having count(mID)>1;
/*List the title and the number of times a movie was reviewed.*/
select title,count(Movie.mID) from Movie join Rating on Movie.mID=Rating.
mID group by title ;
select title,count(Rating.rID) from Movie join Rating on Movie.mID=Rating
.mID group by title ;
/*Find the rating and the total number of movies that recieved a rating of 4 and the number of
movies with a rating of 5*/
select stars,count(*) from Rating group by stars having stars=4 or stars=5;
/*For each movie that has at least one rating, find the highest number of stars that movie
received. Return the movie title and number of stars. Sort by movie title.*/
select title,max((stars)) from Movie join Rating on Movie.mID=Rating.mID group by title;
select title,max((stars)) from Movie join Rating on Movie.mID=Rating.mID group by title order by title;
/*For each movie, return the title and the 'rating spread', that is, the difference between highest
and lowest ratings given to that movie. Sort by rating spread from highest to lowest, then by
movie title.*/
select title,max(stars)-min(stars) AS spread from Movie join Rating on Movie.mID=Rating.mID group by title order by spread desc,title;
/*Find the names of movies with the highest rating*/
select title,stars from Movie join Rating on Movie.mID=Rating.mID where
stars= (select max(stars) FROM Rating);
/*Find the names of movies with a rating higher than highest rating given by 205.*/
select title,stars from Movie join Rating on Movie.mID=Rating.mID where
stars > (select max(stars) FROM Rating where rID=205);
/*List the id and title of movie which was reviewed the maximum number of times.*/
select m.mID,title,count(*) 
from Rating r,Movie m 
where r.mID=m.mID group by mID,title 
having count(*)=(select max(x.cnt) from (select count(*) as cnt from Rating group by mID)as x);
