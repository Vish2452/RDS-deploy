-- =============================================================================
-- Create the cicd user for Liquibase deployments
-- Run this once using the master (dbadmin) credentials
-- =============================================================================

DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'cicd') THEN
        CREATE ROLE cicd WITH LOGIN PASSWORD current_setting('cicd.password');
        RAISE NOTICE 'Role cicd created.';
    ELSE
        -- Update password in case it changed
        EXECUTE format('ALTER ROLE cicd WITH PASSWORD %L', current_setting('cicd.password'));
        RAISE NOTICE 'Role cicd already exists, password updated.';
    END IF;
END
$$;

-- Grant privileges on the target database
GRANT CONNECT ON DATABASE appdb TO cicd;
GRANT USAGE ON SCHEMA public TO cicd;
GRANT CREATE ON SCHEMA public TO cicd;

-- Grant privileges on existing and future objects
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO cicd;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO cicd;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON TABLES TO cicd;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON SEQUENCES TO cicd;
