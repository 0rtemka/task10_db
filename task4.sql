delete from students where student_id = 2;

delete from courses     
    where course_id not in (
        select distinct c.course_id 
        from enrollments e 
            join courses c on e.course_id = c.course_id 
        );