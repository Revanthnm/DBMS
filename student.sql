
create table student(
    regno varchar2(10),Sname varchar2(20),major varchar2(20),Bdate date,
    PRIMARY KEY (regno)
    );

create table course(
    course_no int,cname varchar2(15),dept varchar2(15),
    primary key(course_no)
    );
    
create table text(
    isbn int,book_title varchar2(15),publisher varchar2(20),author varchar2(20),
    primary key (isbn)
    );

create table book_adoption(
    course_no int,sem int,isbn int,
    foreign key(course_no)REFERENCES course(course_no),
    foreign key(isbn)REFERENCES text(isbn)
    );
    
create table enrool(
    regno varchar2(10),course_no int ,sem int ,marks int,
    foreign key(regno) references student(regno),
    foreign key(course_no) REFERENCES course(course_no)
    );
    
insert into student values ('&regno','&sname','&major','&bdate');
insert into course values ('&COURSE_no','&CNAME','&DEPT');
insert into text values (&isbn,'&book_title','&publisher','&author');
insert into book_adoption values (&course_no,&sem,&isbn);
insert into enrool values ('&regno',&course_no,&sem,&marks);

select * from student;
select * from course;
select *from text;
select *from book_adoption;
select * from enrool;


select course.course_no,text.isbn,text.book_title from course,text,book_adoption
where course.COURSE_NO=book_adoption.COURSE_NO and book_adoption.ISBN=text.ISBN and course.DEPT='cse' order by text.BOOK_TITLE
group by course_no having count(*)>2 ;
