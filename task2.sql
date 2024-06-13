insert into students (first_name, last_name, date_of_birth, email, phone_number, address, enrollment_date, gpa)
values 
    ('John', 'Doe', '2001-08-01', 'doe123@stud.ru', '+88005553535', 'Wall st. 10', '2018-09-01', 4.5),
    ('Anthony', 'Stark', '2002-10-22', 'stark@stud.ru', null, 'Star st. 21', '2019-09-01', 5),
    ('Freddie', 'Kruger', '2001-06-18', 'screamy@stud.ru', '+88055352535', 'Elm st. 1', '2018-09-01', 4),
    ('Antoine', 'Janvan', '2003-01-27', 'ajvan@stud.ru', null, 'Laska st. 8', '2020-09-01', 3.5),
    ('Lionel', 'Messi', '2002-04-19', 'baloon@stud.ru', '+88115354535', 'Catalon st. 16', '2019-09-01', 5),
    ('Catty', 'Hilton', '2002-06-23', 'thehills@stud.ru', '+88213558542', 'Hills st. 16', '2019-09-01', null);

insert into courses (course_name, description, credits, department) 
values 
    ('Math', 'Math course for beginners', 4, 'Math Institute'),
    ('Physics', null, 3, 'Physics Institute'),
    ('Algorithms Theory', 'Algorithms theory course for programmers', 5, 'Institute of Computer Science'),
    ('Operating Systems', null, 6, 'Institute of Computer Science'),
    ('Databases', null, 4, 'Institute of Computer Science'),
    ('Probability theory', 'Probability theory for beginners', 2, 'Math Institute');

insert into enrollments (student_id, course_id, enrollment_date, grade) 
values 
    (1, 1, '2019-02-01', 5),
    (1, 2, '2020-02-01', 4),
    (2, 1, '2020-02-01', 5),
    (3, 2, '2021-09-01', 4),
    (4, 3, '2022-02-01', 3),
    (4, 4, '2024-02-01', null),
    (4, 5, '2022-02-01', 4),
    (5, 4, '2021-09-01', 5),
    (5, 1, '2024-06-01', null),
    (5, 3, '2024-06-01', null);