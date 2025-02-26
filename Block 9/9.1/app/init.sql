-- Create the Home Assistant database
CREATE DATABASE homeassistant;
-- Create the user with a password
CREATE USER homeassistant WITH PASSWORD 'admin';
-- Grant all privileges on the homeassistant database to the homeassistant user
GRANT ALL PRIVILEGES ON DATABASE homeassistant TO homeassistant;