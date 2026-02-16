--liquibase formatted sql

--changeset cicd:5 labels:test context:all
--comment: Create products table to test RDS connectivity
CREATE TABLE IF NOT EXISTS products (
    id            BIGSERIAL PRIMARY KEY,
    name          VARCHAR(200)   NOT NULL,
    description   TEXT,
    price         NUMERIC(10,2)  NOT NULL DEFAULT 0.00,
    in_stock      BOOLEAN        NOT NULL DEFAULT TRUE,
    created_at    TIMESTAMPTZ    NOT NULL DEFAULT NOW(),
    updated_at    TIMESTAMPTZ    NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_products_name ON products(name);
--rollback DROP TABLE IF EXISTS products;

--changeset cicd:6 labels:test context:all
--comment: Insert sample product to confirm RDS write access
INSERT INTO products (name, description, price) VALUES
    ('Test Product', 'Inserted by Liquibase to verify RDS connectivity', 9.99);
--rollback DELETE FROM products WHERE name = 'Test Product';
