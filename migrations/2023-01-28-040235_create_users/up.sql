CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(64) UNIQUE NOT NULL,
  email VARCHAR(64) UNIQUE NOT NULL,
  pass_hash VARCHAR(1024) NOT NULL,
  avatar_id SERIAL REFERENCES avatars(id),
  first_name VARCHAR(64) NOT NULL,
  last_name VARCHAR(64) NOT NULL,
  birth_date DATE NOT NULL,
  verifed BOOLEAN NOT NULL DEFAULT FALSE
)

CREATE TABLE cubes (
  id SERIAL PRIMARY KEY,
  owner_id SERIAL REFERENCES users(id),
  name_cube VARCHAR(256) NOT NULL,
  description_cube VARCHAR(10000) NOT NULL,
)

CREATE TABLE cube_likes (
  id SERIAL PRIMARY KEY,
  user_id SERIAL REFERENCES users(id),
  cube_id SERIAL REFERENCES cubes(id)
)

CREATE TABLE cards (
  id SERIAL PRIMARY KEY,
  external_id VARCHAR(1024)NOT NULL,
  faction_id SERIAL REFERENCES factions(id), 
  name_card VARCHAR(64) UNIQUE NOT NULL,
  type_card VARCHAR(64) NOT NULL,
  cost_card NUMERIC NOT NULL,
  image_url VARCHAR UNIQUE NOT NULL
)

CREATE TABLE cube_cards (
  cube_id SERIAL REFERENCES cubes(id),
  cards_id SERIAL REFERENCES cards(id),
  count NUMERIC NOT NULL
)