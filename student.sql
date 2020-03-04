CREATE TABLE BRANCH(
    BRANCH_NAME VARCHAR2(25),
    BRANCHCITY VARCHAR2(25),
    ASSETS REAL,
    PRIMARY KEY(BRANCH_NAME)
    );

CREATE TABLE ACCOUNTS(
    ACCNO INT,
    BRANCH_NAME VARCHAR2(25),
    BALANCE REAL,
    PRIMARY KEY(ACCNO),
    FOREIGN KEY(BRANCH_NAME) REFERENCES BRANCH(BRANCH_NAME) ON DELETE CASCADE
    );

CREATE TABLE CUSTOMERS(
    CUSTOMER_NAME VARCHAR(25),
    CUSTOMER_STREET VARCHAR2(25),
    CUSTOMER_CITY VARCHAR2(25),
    PRIMARY KEY(CUSTOMER_NAME)
    );
    
CREATE TABLE DEPOSITOR(
    CUSTOMER_NAME VARCHAR(25),
    ACCNO INT,
    PRIMARY KEY(CUSTOMER_NAME, ACCNO),
    FOREIGN KEY(CUSTOMER_NAME) REFERENCES CUSTOMERs(CUSTOMER_NAME) ON DELETE CASCADE,
    FOREIGN KEY(ACCNO) REFERENCES ACCOUNTS(ACCNO) ON DELETE CASCADE
    );

CREATE TABLE LOAN(
    LOAN_NUMBER INT,
    BRANCH_NAME VARCHAR2(25),
    AMOUNT REAL,
    PRIMARY KEY(LOAN_NUMBER),
    FOREIGN KEY(BRANCH_NAME) REFERENCES BRANCH(BRANCH_NAME) ON DELETE CASCADE
    );
    
CREATE TABLE BORROWER(
    CUSTOMER_NAME VARCHAR2(25),
    LOAN_NUMBER INT,
    PRIMARY KEY(CUSTOMER_NAME),
    FOREIGN KEY(CUSTOMER_NAME) REFERENCES CUSTOMERS(CUSTOMER_NAME) ON DELETE CASCADE,
    FOREIGN KEY(LOAN_NUMBER) REFERENCES LOAN(LOAN_NUMBER) ON DELETE CASCADE
    );

INSERT INTO BRANCH VALUES('&BRANCH_NAME', '&BRANCHCITY', &ASSETS);
INSERT INTO ACCOUNTS VALUES(&ACCNO, '&BRANCH_NAME', &BALANCE);
INSERT INTO CUSTOMERS VALUES('&CUSTOMER_NAME', '&CUSTOMER_STREET', '&CUSTOMER_CITY');
INSERT INTO DEPOSITOR VALUES('&CUSTOMER_NAME', &ACCNO);
INSERT INTO LOAN VALUES(&LOAN_NUMBER, '&BRANCH_NAME', &AMOUNT);
INSERT INTO BORROWER VALUES('&CUSTOMER_NAME', &LOAN_NUMBER);

SELECT * FROM BRANCH;
SELECT * FROM ACCOUNTS;
SELECT * FROM CUSTOMERS;
SELECT * FROM DEPOSITOR;
SELECT * FROM LOAN;
SELECT * FROM BORROWER;

*******************************************************************************


create table student(
    regno varchar2(10),Sname varchar2(20),major varchar2(20),Bdate date,
    PRIMARY KEY (regno)
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