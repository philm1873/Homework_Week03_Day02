DROP TABLE IF EXISTS bounties;

CREATE TABLE bounties(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty INT2,
  danger_level VARCHAR(255)
);
