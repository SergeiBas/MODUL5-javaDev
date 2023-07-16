CREATE TYPE EXP AS ENUM ('Trainee', 'Junior', 'Middle','Senior');

CREATE TABLE worker
(
    ID       SERIAL PRIMARY KEY,
    NAME     varchar(1000) NOT NULL,
    BIRTHDAY DATE,
    LEVEL    EXP           NOT NULL,
    SALARY   INT
);

ALTER TABLE worker
    ADD CONSTRAINT check_min_length CHECK ( length(NAME) >= 2 );

ALTER TABLE worker
    ADD CONSTRAINT check_date check ( extract(YEAR FROM BIRTHDAY) > 1900 );

ALTER TABLE worker
    ADD CONSTRAINT check_salary check ( SALARY >= 100 AND SALARY <= 100000);

CREATE TABLE client
(
    ID   SERIAL PRIMARY KEY,
    NAME varchar(1000) NOT NULL
);

ALTER TABLE client
    ADD CONSTRAINT check_min_length CHECK ( length(NAME) >= 2 );

CREATE TABLE project
(
    ID          SERIAL PRIMARY KEY,
    CLIENT_ID   INT,
    START_DATE  DATE,
    FINISH_DATE DATE
);

ALTER TABLE project
    ADD CONSTRAINT client_id_fk
        FOREIGN KEY (CLIENT_ID)
            REFERENCES client (id);

CREATE TABLE project_worker
(
    PROJECT_ID INT,
    WORKER_ID  INT,
    PRIMARY KEY (PROJECT_ID, WORKER_ID),
    FOREIGN KEY (PROJECT_ID) REFERENCES project (ID),
    FOREIGN KEY (WORKER_ID) REFERENCES worker (ID)
);