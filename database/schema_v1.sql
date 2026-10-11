CREATE TABLE customers (
    customer_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(25) NOT NULL,
    address VARCHAR(255),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE work_orders (
    work_order_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    priority VARCHAR(20) NOT NULL DEFAULT 'MEDIUM' CHECK (priority IN ('LOW', 'MEDIUM', 'HIGH', 'URGENT')),
    status VARCHAR(20) NOT NULL DEFAULT 'NEW' CHECK (status IN ('NEW', 'SCHEDULED', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED')),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    customer_id BIGINT NOT NULL,

    CONSTRAINT fk_work_order_customer
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
    ON DELETE RESTRICT
);

CREATE TABLE technicians (
    technician_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(25) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE skills (
    skill_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE technician_skills (
    technician_id BIGINT NOT NULL REFERENCES technicians(technician_id),
    skill_id BIGINT NOT NULL REFERENCES skills(skill_id),
    PRIMARY KEY (technician_id, skill_id)
);

CREATE INDEX idx_work_orders_customer_id ON work_orders(customer_id);
CREATE INDEX idx_technician_skills_skill_id ON technician_skills(skill_id);

