use qlsv1;

select address, count(studentName) from student;

select subName,avg(mark) from mark
join subject s on s.subID = mark.subID_Ngoai
group by subName;

select studentName, avg(mark) as 'diemtb' from mark
join student s on s.studentID = mark.studentID_Ngoai
group by studentName
having diemtb < 15 ;

select studentName, avg(mark) as diemtb from mark
join student s on s.studentID = mark.studentID_Ngoai
group by studentName
having diemtb >= all (select avg(mark) from mark
group by mark);



