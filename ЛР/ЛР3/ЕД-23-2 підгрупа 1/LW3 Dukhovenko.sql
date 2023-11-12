--��������� ���� ����� 
CREATE DATABASE STUDENTS
--���������� �� ���� ����� "STUDENTS"
USE STUDENTS




--��������� �������

--��������� ������� "PersonalInfo
CREATE TABLE PersonalInfo (

StudentID INT PRIMARY KEY,

FirstName NVARCHAR(50),

LastName NVARCHAR(50),

DateOfBirth DATE

);



--��������� ������� "AcademicInfo"
CREATE TABLE AcademicInfo (

RecordID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

Faculty NVARCHAR(100),

Curator NVARCHAR(100),

EnrollmentYear INT

);



--��������� ������� "ContactInfo"
CREATE TABLE ContactInfo (

ContactID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

Email NVARCHAR(100),

PhoneNumber NVARCHAR(15)

);


--�������� � ���������� ������� "ContactInfo":
--������ �������� "Address"
ALTER TABLE ContactInfo ADD Address NVARCHAR(200);

--��������� �������� "PhoneNumber"
ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;


--������� ��'� ������� "Email" �� "EmailAddress"
EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';



--������� ��� ����� ��� ������� "Faculty" � ������� "AcademicInfo" �� NVARCHAR(150):
ALTER TABLE AcademicInfo
ALTER COLUMN Faculty NVARCHAR(150);



--������ ���� ������� "Extracurricular"
CREATE TABLE Extracurricular (

ActivityID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

ActivityName NVARCHAR(100),

JoinDate DATE

);



--ϳ��� �������� ����, �� ������� ���� �������� ���������, ��������� ��:
DROP TABLE Extracurricular;

--��������� ���� ����� "TEACHER"
CREATE DATABASE TEACHER;
--ϳ��� �������� ��������� ���� �����
DROP DATABASE TEACHER;

--���������� �� ������� ���� �����
USE STUDENTS;

--������ ��� ����� ����� �� ������� "PersonalInfo"
INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)

VALUES

(1, '���������', '������', '2000-05-15'),

(2, '����', '��������', '2001-03-22'),

(3, '������', '���������', '1999-10-10');


