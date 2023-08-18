CREATE DATABASE catalogue_of_things;

CREATE TABLE items(
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE
)

CREATE TABLE labels (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  color VARCHAR(255),
  title VARCHAR(255),
  items TEXT[]
);

CREATE TABLE books (
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  can_be_archived BOOLEAN,
  cover_state VARCHAR(255),
  publisher VARCHAR(255),
  genre_id INT NULL REFERENCES genres(id) ON DELETE CASCADE,
  author_id INT NULL REFERENCES authors(id) ON DELETE CASCADE,
  label_id INT NULL REFERENCES labels(id) ON DELETE CASCADE,
  PRIMARY KEY(id)
);

CREATE TABLE authors (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(150),
  last_name VARCHAR(150),
  items TEXT[]
  PRIMARY KEY(id)
)

CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY,
  multiplayer BOOLEAN,
  publish_date DATE,
  last_played DATE
  can_be_archived BOOLEAN,
  genre_id INT NULL REFERENCES genres(id) ON DELETE CASCADE,
  author_id INT NULL REFERENCES authors(id) ON DELETE CASCADE,
  label_id INT NULL REFERENCES labels(id) ON DELETE CASCADE,
  PRIMARY KEY(id)
)

CREATE TABLE music_album (
  id INT GENERATED NOT NULL,
  on_spotify BOOLEAN,
  publish_date DATE,
  archived BOOLEAN 
  genre_id INT NULL REFERENCES genres(id) ON DELETE CASCADE,
  author_id INT NULL REFERENCES authors(id) ON DELETE CASCADE,
  label_id INT NULL REFERENCES labels(id) ON DELETE CASCADE, 
):

CREATE TABLE genre (
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(150),
  items TEXT []
);
