-- Demo Samples on Creating Users and Roles
-- See the available roles
SELECT rolname FROM pg_roles;

-- Revoke all existing privileges from 'public' role
REVOKE CREATE ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON DATABASE MyDB FROM PUBLIC;

-- Create roles
CREATE ROLE admin LOGIN PASSWORD 'admin' SUPERUSER;
CREATE ROLE security CREATEROLE;
CREATE ROLE readonly;
CREATE ROLE readwrite;

-- Create group role, by convention has no LOGIN privilege
CREATE ROLE visitor;
CREATE ROLE cphgroup INHERIT; 

-- create users
CREATE USER Dora LOGIN PASSWORD 'admin' SUPERUSER;
CREATE USER Louise WITH PASSWORD 'louise' VALID UNTIL '2020-12-31';;
CREATE USER Arne WITH LOGIN PASSWORD 'arne' CREATEDB;

-- add users to group
GRANT cphgroup TO Louise;
GRANT cphgroup TO Arne;

-- Grant priviledges to roles
-- GRANT CONNECT ON DATABASE MyDB TO readonly;  -- permission to connect
GRANT USAGE ON SCHEMA public TO readonly;   -- permission to use
GRANT SELECT ON TABLE student TO visitor;    -- permission to read
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly; -- does not include future objects
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO readonly; -- to include objects, created in future 

-- GRANT CONNECT ON DATABASE MyDB TO readwrite;
GRANT USAGE, CREATE ON SCHEMA public TO readwrite;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO readwrite;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO readwrite;

-- Grant privileges to users
GRANT readonly TO cphgroup;
GRANT readonly TO visitor;
GRANT readwrite TO arne;

-- Revoke priviledges
REVOKE readwrite FROM arne;
REVOKE readonly FROM visitors;
