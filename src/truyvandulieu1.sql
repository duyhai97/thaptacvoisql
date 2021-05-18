select * from student
where studentName like 'h%';

select * from class
where class.startDate = 12
group by startDate =12;

select * from subject
where credit >=3 and credit<=5;

update student
set classID_ngoai = 3
where studentID = 8;

select studentName,subName,mark from mark
                                         join student s on mark.studentID_Ngoai = s.studentID
                                         join subject s2 on s2.subID = mark.subID_Ngoai
order by mark asc,studentName;