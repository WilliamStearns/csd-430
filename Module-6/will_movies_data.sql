/*
  William Stearns
  12/19/25
  CSD430 Module 5
  This script creates the CSD430 database, adds the student1 user,
  and populates the movies table with 10 initial records.
*/

-- Create the Database
CREATE DATABASE IF NOT EXISTS CSD430;
USE CSD430;

-- Create the User 'student1' with password 'pass' as required
CREATE USER IF NOT EXISTS 'student1'@'localhost' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON CSD430.* TO 'student1'@'localhost';
FLUSH PRIVILEGES;

-- DROP TABLE ensures that re-running the script doesn't create duplicate records
DROP TABLE IF EXISTS will_movies_data;

-- Create the table using the format <firstname>_movies_data
CREATE TABLE will_movies_data (
    movie_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    director VARCHAR(100),
    release_year INT,
    genre VARCHAR(50),
    rating DECIMAL(3,1),
    PRIMARY KEY (movie_id)
);

-- Populate the table with 10 records
INSERT INTO will_movies_data (title, director, release_year, genre, rating) VALUES
('Inception', 'Christopher Nolan', 2010, 'Sci-Fi', 8.8),
('The Godfather', 'Francis Ford Coppola', 1972, 'Crime', 9.2),
('Pulp Fiction', 'Quentin Tarantino', 1994, 'Crime', 8.9),
('The Dark Knight', 'Christopher Nolan', 2008, 'Action', 9.0),
('Schindler List', 'Steven Spielberg', 1993, 'Drama', 9.0),
('Forrest Gump', 'Robert Zemeckis', 1994, 'Drama', 8.8),
('The Matrix', 'Lana Wachowski', 1999, 'Sci-Fi', 8.7),
('Goodfellas', 'Martin Scorsese', 1990, 'Biography', 8.7),
('Seven', 'David Fincher', 1995, 'Mystery', 8.6),
('Interstellar', 'Christopher Nolan', 2014, 'Sci-Fi', 8.6);

-- Final select to verify data for screenshots
SELECT * FROM will_movies_data;