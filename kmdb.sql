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
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS characters;


-- Create new tables, according to your domain model
CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year INTEGER,
  rating TEXT
);

CREATE TABLE characters (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  character_name TEXT,
  movie_id INTEGER,
  people_id INTEGER
);

CREATE TABLE directors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_id INTEGER,
  people_id INTEGER
);

CREATE TABLE people (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary

-- Insert data into movies table
INSERT INTO movies (title, year, rating)
VALUES ("Batman Begins", 2005, "PG-13");

INSERT INTO movies (title, year, rating)
VALUES ("The Dark Knight", 2008, "PG-13");

INSERT INTO movies (title, year, rating)
VALUES ("The Dark Knight Rises", 2012, "PG-13");

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

-- Insert data into characters table
INSERT INTO characters (character_name, movie_id, people_id)
VALUES ("Bruce Wayne", 1, 1);

INSERT INTO characters (character_name, movie_id, people_id)
VALUES ("Alfred", 1, 2);

INSERT INTO characters (character_name, movie_id, people_id)
VALUES ("Ra's Al Ghul", 1, 3);

INSERT INTO characters (character_name, movie_id, people_id)
VALUES ("Rachel Dawes", 1, 4);

INSERT INTO characters (character_name, movie_id, people_id)
VALUES ("Commissioner Gordon", 1, 5);

INSERT INTO characters (character_name, movie_id, people_id)
VALUES ("Bruce Wayne", 2, 1);

INSERT INTO characters (character_name, movie_id, people_id)
VALUES ("Joker", 2, 6);

INSERT INTO characters (character_name, movie_id, people_id)
VALUES ("Harvey Dent", 2, 7);

INSERT INTO characters (character_name, movie_id, people_id)
VALUES ("Alfred", 2, 2);

INSERT INTO characters (character_name, movie_id, people_id)
VALUES ("Rachel Dawes", 2, 8);

INSERT INTO characters (character_name, movie_id, people_id)
VALUES ("Bruce Wayne", 3, 1);

INSERT INTO characters (character_name, movie_id, people_id)
VALUES ("Commissioner Gordon", 3, 5);

INSERT INTO characters (character_name, movie_id, people_id)
VALUES ("Bane", 3, 9);

INSERT INTO characters (character_name, movie_id, people_id)
VALUES ("John Blake", 3, 10);

INSERT INTO characters (character_name, movie_id, people_id)
VALUES ("Selina Kyle", 3, 11);

-- Insert data about director
INSERT INTO directors (movie_id, people_id)
VALUES (1, 12);

INSERT INTO directors (movie_id, people_id)
VALUES (2, 12);

INSERT INTO directors (movie_id, people_id)
VALUES (3, 12);

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
SELECT movies.title, movies.year, movies.rating, people.name
FROM movies
  INNER JOIN directors on movies.id = directors.movie_id
  INNER JOIN people on directors.people_id = people.id;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output
-- TODO!