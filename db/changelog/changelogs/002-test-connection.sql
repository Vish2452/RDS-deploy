--liquibase formatted sql

--changeset cicd:3 labels:test context:all
--comment: Create test_connection table to verify Liquibase connectivity
CREATE TABLE IF NOT EXISTS test_connection (
    id          BIGSERIAL PRIMARY KEY,
    message     VARCHAR(255)  NOT NULL DEFAULT 'Liquibase connection successful',
    tested_at   TIMESTAMPTZ   NOT NULL DEFAULT NOW()
);
--rollback DROP TABLE IF EXISTS test_connection;

--changeset cicd:4 labels:test context:all
--comment: Insert a test row to confirm write access
INSERT INTO test_connection (message) VALUES ('Hello from Liquibase!');
--rollback DELETE FROM test_connection WHERE message = 'Hello from Liquibase!';
