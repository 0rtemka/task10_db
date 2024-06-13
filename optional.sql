--Создайте представление (VIEW), которое объединяет информацию о студентах и их зачислениях на курсы.
create or replace view students_enrollments 
as select s.student_id, s.first_name, s.last_name, s.email, c.course_id, c.course_name, c.description, e.enrollment_date, e.grade from enrollments e 
	join students s on e.student_id = s.student_id
	join courses c on e.course_id = c.course_id;

--Создайте хранимую процедуру для добавления нового студента и автоматического зачисления его на определенный курс.
create procedure insert_student(
	first_name varchar,
	last_name varchar,
	date_of_birth date, 
	email varchar, 
	enrollment_date date, 
	cid integer, -- id курса, на который будет зачислен новый студент
	phone_number varchar default null, 
	address varchar default null,
	gpa decimal default null
)
language plpgsql
as 
$$
declare 
	sid integer;
begin
    insert into students(first_name, last_name, date_of_birth, email, phone_number, address, enrollment_date, gpa) 
    values(first_name, last_name, date_of_birth, email, phone_number, address, enrollment_date, gpa)
    returning student_id into sid;

    insert into enrollments (student_id, course_id, enrollment_date, grade)
    values (sid, cid, current_date, null);
end
$$

