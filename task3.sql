update students 
    set address = 'Stark st. 99', phone_number = '+87006009999'
    where student_id = 2;

update courses 
    set description = 'Algorithms and data structures for programmers' 
    where course_id = 3;

update enrollments 
    set grade = 5
    where enrollment_id = 3;