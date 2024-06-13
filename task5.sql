--1.Получите список всех студентов, зачисленных на определенный курс, отсортированный по фамилии.
select s.student_id, s.first_name, s.last_name, s.email from enrollments e
    join students s on e.student_id = s.student_id
where course_id = 1
order by last_name;	

--2.Получите список курсов с указанием количества студентов, зачисленных на каждый курс.
select c.course_id, c.course_name, count(e.student_id) as students_count from courses c
	left join enrollments e on e.course_id = c.course_id
group by c.course_id;

--3.Получите список студентов, которые имеют средний балл (GPA) выше определенного значения.
select * from students 
where gpa > 4;

--4.Получите полную информацию о зачислениях (включая имя студента и название курса), произошедших в течение последнего месяца.
select s.first_name, s.last_name, c.course_name, e.enrollment_date, e.grade from enrollments e
	join students s on e.student_id = s.student_id
	join courses c on e.course_id = c.course_id
where date_part('month', e.enrollment_date) = date_part('month', current_date)
	and date_part('year', e.enrollment_date) = date_part('year', current_date);

--5.Получите список студентов, у которых нет номера телефона, отсортированный по дате зачисления.
select * from students
where phone_number is null
order by enrollment_date;

--6.Получите список курсов, которые проводятся в определенном департаменте, и отсортируйте их по количеству кредитов.
select * from courses 
where department = 'Institute of Computer Science'
order by credits;

--7.Получите полную информацию о студентах, включая курсы, на которые они зачислены, и их оценки по этим курсам.
select s.student_id, s.first_name, s.last_name, s.email, s.phone_number, c.course_name, e.grade from students s
	join enrollments e on s.student_id = e.student_id
	join courses c on e.course_id = c.course_id;

--8.Получите список студентов, которые зачислены более чем на один курс.
select s.student_id, s.first_name, s.last_name, s.email, s.phone_number from students s
	join enrollments e on s.student_id = e.student_id
	join courses c on e.course_id = c.course_id
group by s.student_id
having count(*) > 1;

--9.Получите список студентов, которые зачислены на курсы из разных департаментов.
select s.student_id, s.first_name, s.last_name, s.email, s.phone_number from students s
	join enrollments e on s.student_id = e.student_id
	join courses c on e.course_id = c.course_id
group by s.student_id
having count(distinct department) > 1;

--10.Получите список курсов, на которые не зачислен ни один студент.
select c.course_id, c.course_name, c.description, c.credits, c.department from courses c
	left join enrollments e on c.course_id = e.course_id
group by c.course_id
having count(student_id) = 0;

--11.Получите список студентов, которые зачислены на все курсы из определенного департамента.
select s.student_id, s.first_name, s.last_name, s.email from enrollments e
	join students s on s.student_id = e.student_id
	join courses c on c.course_id = e.course_id
where c.department = 'Institute of Computer Science'
group by s.student_id
having count(*) = (
	select count(*) from courses 
	where department = 'Institute of Computer Science'
);

--12.Найдите студентов, которые зачислены на курс с наибольшим количеством кредитов.
select s.student_id, s.first_name, s.last_name, s.email from enrollments e
	join students s on e.student_id = s.student_id
where e.course_id = (
		select course_id from courses 
		where credits = (
				select max(credits) from courses
		)
);

--13.Получите средний балл (GPA) для каждого студента, который зачислен на курсы, и отсортируйте студентов по этому среднему баллу.
select s.student_id, s.first_name, avg(grade) as average_grade from enrollments e
	join students s on s.student_id = e.student_id
group by s.student_id
order by average_grade;

--14.Получите список студентов, которые были зачислены на курсы в течение последнего года.
select distinct s.student_id, s.first_name, s.last_name, s.email from enrollments e
	join students s on s.student_id = e.student_id
where date_part('year', e.enrollment_date) = date_part('year', current_date);

--15.Получите список студентов и их количество курсов, на которые они зачислены, отсортированный по количеству курсов.
select s.student_id, s.first_name,s.last_name, s.email, count(*) as courses_count from enrollments e
	join students s on s.student_id = e.student_id
group by s.student_id
order by courses_count;