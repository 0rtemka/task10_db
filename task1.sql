create database UniversityDB;

create table students(
    student_id serial primary key,
    first_name varchar not null,
    last_name varchar not null,
    date_of_birth date not null,
    email varchar unique not null,
    phone_number varchar,
    address varchar,
    enrollment_date date not null,
    gpa decimal
);

create table courses (
    course_id serial primary key,
    course_name varchar not null,
    description varchar,
    credits integer not null,
    department varchar not null
);

create table enrollments (
    enrollment_id serial primary key,
    student_id integer references students(student_id)
        on delete cascade,
    course_id integer references courses(course_id)
        on delete cascade,
    enrollment_date date not null,
    grade integer
);