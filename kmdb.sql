-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy
-- - Movie data includes the movie title, year released, MPAA rating,
--   and director
-- - A movie has a single director
-- - A person can be the director of and/or play a role in a movie
-- - Everything you need to do in this assignment is marked with TODO!

-- Rubric
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
--   (10 points)
-- - Insertion of "Batman" sample data into tables (5 points)
-- - Selection of data, so that something similar to the following sample
--   "report" can be achieved (5 points)

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.

DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS characters;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS roles;

-- Create new tables, according to your domain model

-- My domain model has 5 tables: movies, people, characters, directors, and roles in movies

-- Create movie table for basic information with foreign id that connects to director table
CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year INTEGER,
  rating TEXT,
  director_id INTEGER
);

-- Create table of all relevant people who can be roles or directors
CREATE TABLE people (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);

-- Create characters table for all characters in universe
CREATE TABLE characters (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  character_name TEXT
);

-- Create table of directors with foreign id for person
CREATE TABLE directors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  people_id INTEGER
);

-- Create roles table for cast within movies, that has foreign ids linking to particular movies, characters, and people
CREATE TABLE roles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  character_id INTEGER,
  movie_id INTEGER,
  people_id INTEGER
);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary

-- Insert data into movies table
INSERT INTO movies (title, year, rating, director_id)
VALUES ("Batman Begins", 2005, "PG-13", 1);

INSERT INTO movies (title, year, rating, director_id)
VALUES ("The Dark Knight", 2008, "PG-13", 1);

INSERT INTO movies (title, year, rating, director_id)
VALUES ("The Dark Knight Rises", 2012, "PG-13", 1);

-- Insert data into people table
INSERT INTO people (name)
VALUES ("Christian Bale");

INSERT INTO people (name)
VALUES ("Michael Caine");

INSERT INTO people (name)
VALUES ("Liam Neeson");

INSERT INTO people (name)
VALUES ("Katie Holmes");

INSERT INTO people (name)
VALUES ("Gary Oldman");

INSERT INTO people (name)
VALUES ("Heath Ledger");

INSERT INTO people (name)
VALUES ("Aaron Eckhart");

INSERT INTO people (name)
VALUES ("Maggie Gyllenhaal");

INSERT INTO people (name)
VALUES ("Tom Hardy");

INSERT INTO people (name)
VALUES ("Joseph Gordon-Levitt");

INSERT INTO people (name)
VALUES ("Anne Hathaway");

INSERT INTO people (name)
VALUES ("Christopher Nolan");

-- Insert data about characters
INSERT INTO characters (character_name)
VALUES ("Bruce Wayne");

INSERT INTO characters (character_name)
VALUES ("Alfred");

INSERT INTO characters (character_name)
VALUES ("Ra's Al Ghul");

INSERT INTO characters (character_name)
VALUES ("Rachel Dawes");

INSERT INTO characters (character_name)
VALUES ("Commissioner Gordon");

INSERT INTO characters (character_name)
VALUES ("Joker");

INSERT INTO characters (character_name)
VALUES ("Harvey Dent");

INSERT INTO characters (character_name)
VALUES ("Bane");

INSERT INTO characters (character_name)
VALUES ("John Blake");

INSERT INTO characters (character_name)
VALUES ("Selina Kyle");

-- Insert data about director
INSERT INTO directors (people_id)
VALUES (12);

-- Insert data into roles table about roles in specific movies
-- Represents cast combinations in particular movie credits
INSERT INTO roles (character_id, movie_id, people_id)
VALUES (1, 1, 1);

INSERT INTO roles (character_id, movie_id, people_id)
VALUES (2, 1, 2);

INSERT INTO roles (character_id, movie_id, people_id)
VALUES (3, 1, 3);

INSERT INTO roles (character_id, movie_id, people_id)
VALUES (4, 1, 4);

INSERT INTO roles (character_id, movie_id, people_id)
VALUES (5, 1, 5);

INSERT INTO roles (character_id, movie_id, people_id)
VALUES (1, 2, 1);

INSERT INTO roles (character_id, movie_id, people_id)
VALUES (6, 2, 6);

INSERT INTO roles (character_id, movie_id, people_id)
VALUES (7, 2, 7);

INSERT INTO roles (character_id, movie_id, people_id)
VALUES (2, 2, 2);

INSERT INTO roles (character_id, movie_id, people_id)
VALUES (4, 2, 8);

INSERT INTO roles (character_id, movie_id, people_id)
VALUES (1, 3, 1);

INSERT INTO roles (character_id, movie_id, people_id)
VALUES (5, 3, 5);

INSERT INTO roles (character_id, movie_id, people_id)
VALUES (8, 3, 9);

INSERT INTO roles (character_id, movie_id, people_id)
VALUES (9, 3, 10);

INSERT INTO roles (character_id, movie_id, people_id)
VALUES (10, 3, 11);

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
SELECT movies.title, movies.year, movies.rating, people.name
FROM movies
  INNER JOIN directors on movies.director_id = directors.id
  INNER JOIN people on directors.people_id = people.id;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""

-- The SQL statement for the cast output
SELECT movies.title, people.name, characters.character_name
FROM roles
  INNER JOIN movies on roles.movie_id = movies.id
  INNER JOIN people on roles.people_id = people.id
  INNER JOIN characters on roles.character_id = characters.id;

--------------------------------
-- My output for both reports:

-- Movies
-- ======

-- Batman Begins  2005        PG-13       Christopher Nolan
-- The Dark Knig  2008        PG-13       Christopher Nolan
-- The Dark Knig  2012        PG-13       Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins  Christian Bale  Bruce Wayne   
-- Batman Begins  Michael Caine   Alfred        
-- Batman Begins  Liam Neeson     Ra's Al Ghul  
-- Batman Begins  Katie Holmes    Rachel Dawes  
-- Batman Begins  Gary Oldman     Commissioner G
-- The Dark Knig  Christian Bale  Bruce Wayne   
-- The Dark Knig  Heath Ledger    Joker         
-- The Dark Knig  Aaron Eckhart   Harvey Dent   
-- The Dark Knig  Michael Caine   Alfred        
-- The Dark Knig  Maggie Gyllenh  Rachel Dawes  
-- The Dark Knig  Christian Bale  Bruce Wayne   
-- The Dark Knig  Gary Oldman     Commissioner G
-- The Dark Knig  Tom Hardy       Bane          
-- The Dark Knig  Joseph Gordon-  John Blake    
-- The Dark Knig  Anne Hathaway   Selina Kyle