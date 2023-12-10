--liquibase formatted sql

--changeset Volkov:create_table_user
create table users
(
    username varchar(50) primary key,
    password varchar(80),
    email    varchar(50) unique
);

--changeset Volkov:create_table_roles
create table roles
(
    name varchar(50) primary key
);

--changeset Volkov:create_table_users_roles
create table users_roles
(
    user_username varchar(50) not null,
    role_name     varchar(50) not null,
    primary key (user_username, role_name),
    foreign key (user_username) references users (username),
    foreign key (role_name) references roles (name)
);


--changeset Volkov:create_table_tasks
create table tasks
(
    id             bigserial primary key,
    stage_director varchar(50) not null,
    foreign key (stage_director) references users (username)
);

--changeset volkov:create_table_executors
create table executors
(
    id       bigserial primary key,
    username varchar(50) not null,
    task_id  bigint      not null,
    foreign key (username) references users (username),
    foreign key (task_id) references tasks (id)
);

