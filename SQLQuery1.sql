
--DROP TABLE Departments;
--DROP TABLE Groups;
--DROP TABLE Faculties;
--DROP TABLE Teachers;
GO

CREATE TABLE Curators
(
	Id int PRIMARY KEY IDENTITY (1,1),
	Name NVARCHAR(MAX) NOT NULL CHECK (Name != N''),
	Surname NVARCHAR(MAX) NOT NULL CHECK (Surname != N'')
)
GO

CREATE TABLE Faculties
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Financing MONEY NOT NULL CHECK (Financing >=0) DEFAULT 0,
	Name NVARCHAR(100) NOT NULL CHECK (Name != N'') UNIQUE
)

GO

CREATE TABLE Subjects
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(100) NOT NULL CHECK (Name != N'') UNIQUE
)
GO

CREATE TABLE Teachers
(
	Id INT PRIMARY KEY IDENTITY (1,1),
	Name NVARCHAR(MAX) NOT NULL CHECK(Name != N''),
	Salary MONEY NOT NULL CHECK (Salary >0),
	Surname NVARCHAR(MAX) NOT NULL CHECK(Surname != N'')
)

CREATE TABLE Lectures
(
	Id INT PRIMARY KEY IDENTITY (1,1),
	LectureRoom NVARCHAR(MAX) NOT NULL CHECK(LectureRoom != N''),
	SubjectId INT FOREIGN KEY REFERENCES Subjects(Id),
	TeacherId INT FOREIGN KEY REFERENCES Teachers(Id)
)
GO

 CREATE TABLE Departments
 (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Financing MONEY NOT NULL UNIQUE CHECK(Financing != 0),
	Name NVARCHAR(100) NOT NULL UNIQUE CHECK (Name != N''),
	FacultyId INT FOREIGN KEY REFERENCES Faculties(Id) NOT NULL
 )
 GO

 CREATE TABLE Groups
 (
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(100) NOT NULL UNIQUE CHECK(Name != N''),
	Year INT NOT NULL CHECK (Year BETWEEN 1 AND 5),
	DepartmentId INT FOREIGN KEY REFERENCES Departments(Id),
 )

 GO

 CREATE TABLE GroupsCurators
 (
	Id INT PRIMARY KEY IDENTITY (1,1),
	CuratorId INT FOREIGN KEY REFERENCES Curators(Id),
	GroupId INT FOREIGN KEY REFERENCES Groups(Id)
 )
GO
CREATE TABLE GroupsLectures
(
	Id INT PRIMARY KEY IDENTITY (1,1),
	GroupId INT FOREIGN KEY REFERENCES Groups(Id),
	LecturesId INT FOREIGN KEY REFERENCES Lectures(Id)
)

GO
-- Curators
INSERT INTO Curators (Name, Surname) VALUES (N'John', N'Doe');
INSERT INTO Curators (Name, Surname) VALUES (N'Jane', N'Smith');
INSERT INTO Curators (Name, Surname) VALUES (N'Emily', N'Johnson');
INSERT INTO Curators (Name, Surname) VALUES (N'Michael', N'Williams');
INSERT INTO Curators (Name, Surname) VALUES (N'Chris', N'Brown');
INSERT INTO Curators (Name, Surname) VALUES (N'David', N'Martin');
INSERT INTO Curators (Name, Surname) VALUES (N'Linda', N'Taylor');
INSERT INTO Curators (Name, Surname) VALUES (N'James', N'Anderson');
GO
-- Faculties
INSERT INTO Faculties (Financing, Name) VALUES (2000000, N'Faculty of Computer Science');
INSERT INTO Faculties (Financing, Name) VALUES (1500000, N'Faculty of Programming');
INSERT INTO Faculties (Financing, Name) VALUES (1000000, N'Faculty of Robotics');
INSERT INTO Faculties (Financing, Name) VALUES (1200000, N'Faculty of Artificial Intelligence');
INSERT INTO Faculties (Financing, Name) VALUES (1100000, N'Faculty of Data Science');
GO
-- Subjects
INSERT INTO Subjects (Name) VALUES (N'Computer Science');
INSERT INTO Subjects (Name) VALUES (N'Programming');
INSERT INTO Subjects (Name) VALUES (N'Robotics');
INSERT INTO Subjects (Name) VALUES (N'Artificial Intelligence');
INSERT INTO Subjects (Name) VALUES (N'Database Theory');
INSERT INTO Subjects (Name) VALUES (N'Machine Learning');
INSERT INTO Subjects (Name) VALUES (N'Algorithms');
GO
-- Teachers
INSERT INTO Teachers (Name, Surname, Salary) VALUES (N'Alex', N'Johnson', 70000);
INSERT INTO Teachers (Name, Surname, Salary) VALUES (N'Linda', N'Williams', 75000);
INSERT INTO Teachers (Name, Surname, Salary) VALUES (N'Robert', N'Miller', 80000);
INSERT INTO Teachers (Name, Surname, Salary) VALUES (N'Susan', N'Wilson', 72000);
INSERT INTO Teachers (Name, Surname, Salary) VALUES (N'Karen', N'Moore', 68000);
INSERT INTO Teachers (Name, Surname, Salary) VALUES (N'Paul', N'Thomas', 69000);
INSERT INTO Teachers (Name, Surname, Salary) VALUES (N'Mary', N'Taylor', 71000);
INSERT INTO Teachers (Name, Surname, Salary) VALUES (N'George', N'White', 76000);
GO
-- Lectures
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES (N'Room 101', 1, 1);
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES (N'Room 102', 2, 2);
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES (N'Room 103', 3, 3);
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES (N'Room 104', 4, 4);
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES (N'Room 105', 5, 5);
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES (N'Room 106', 6, 6);
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES (N'Room 107', 7, 7);
INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES (N'Room 108', 1, 8);
GO
-- Departments
INSERT INTO Departments (Financing, Name, FacultyId) VALUES (500000, N'Department of Software Engineering', 1);
INSERT INTO Departments (Financing, Name, FacultyId) VALUES (300000, N'Department of Applied Programming', 2);
INSERT INTO Departments (Financing, Name, FacultyId) VALUES (400000, N'Department of Robotics', 3);
INSERT INTO Departments (Financing, Name, FacultyId) VALUES (350000, N'Department of AI Systems', 4);
INSERT INTO Departments (Financing, Name, FacultyId) VALUES (450000, N'Department of Data Analysis', 5);
GO
-- Groups
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group CS1', 1, 1);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group PRG1', 2, 2);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group ROB1', 3, 3);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group AI1', 1, 4);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group DS1', 2, 5);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group CS2', 2, 1);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group PRG2', 3, 2);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group ROB2', 1, 3);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group AI2', 2, 4);
INSERT INTO Groups (Name, Year, DepartmentId) VALUES (N'Group DS2', 3, 5);
GO
-- GroupsCurators
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (1, 1);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (2, 2);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (3, 3);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (4, 4);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (5, 5);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (1, 6);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (6, 7);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (7, 8);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (8, 9);
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES (3, 10);
GO
-- GroupsLectures
INSERT INTO GroupsLectures (GroupId, LecturesId) VALUES (1, 1);
INSERT INTO GroupsLectures (GroupId, LecturesId) VALUES (2, 2);
INSERT INTO GroupsLectures (GroupId, LecturesId) VALUES (3, 3);
INSERT INTO GroupsLectures (GroupId, LecturesId) VALUES (4, 4);
INSERT INTO GroupsLectures (GroupId, LecturesId) VALUES (5, 5);
INSERT INTO GroupsLectures (GroupId, LecturesId) VALUES (6, 1);
INSERT INTO GroupsLectures (GroupId, LecturesId) VALUES (7, 6);
INSERT INTO GroupsLectures (GroupId, LecturesId) VALUES (8, 7);
INSERT INTO GroupsLectures (GroupId, LecturesId) VALUES (9, 3);
INSERT INTO GroupsLectures (GroupId, LecturesId) VALUES (10, 4);

--Запити
--1. Вивести всі можливі пари рядків викладачів та груп.
GO
SELECT
	Teachers.Name, Teachers.Surname, Groups.Name AS GroupName
FROM
	Teachers
JOIN
	Lectures ON Lectures.TeacherId = Teachers.Id
JOIN
	GroupsLectures ON GroupsLectures.LecturesId = Lectures.Id
JOIN
	Groups ON GroupsLectures.GroupId = Groups.Id
	
--2. Вивести назви факультетів, фонд фінансування кафедр
--яких перевищує фонд фінансування факультету.
GO
SELECT
	Departments.Name AS DepartmentName, Faculties.Name AS FacultieName
FROM
	Departments
JOIN
	Faculties ON Departments.FacultyId = Faculties.Id
WHERE
	Faculties.Financing>Departments.Financing
--3. Вивести прізвища кураторів груп та назви груп, які вони
--курирують.
GO
SELECT
	Curators.Name, Curators.Surname, Groups.Name AS GroupName
FROM
	Curators
JOIN
	GroupsCurators ON GroupsCurators.CuratorId = Curators.Id
JOIN
	Groups ON	GroupsCurators.GroupId = Groups.Id

--4. Вивести імена та прізвища викладачів, які читають лекції
--у групі “P107”.
GO
SELECT
	Teachers.Name, Teachers.Surname
FROM 
	Teachers
JOIN
	Lectures ON Lectures.TeacherId = Teachers.Id
JOIN
	GroupsLectures ON GroupsLectures.LecturesId = Lectures.Id
JOIN
	Groups ON GroupsLectures.GroupId = Groups.Id
WHERE
	Groups.Name = 'Group AI1'

--5. Вивести прізвища викладачів та назви факультетів, на яких
--вони читають лекції.
GO
SELECT
	Teachers.Surname, Departments.Name AS DepartnemtName
FROM
	Teachers
JOIN
	Lectures ON Lectures.TeacherId = Teachers.Id
JOIN
	GroupsLectures ON GroupsLectures.LecturesId = Lectures.Id
JOIN
	Groups ON GroupsLectures.GroupId = Groups.Id
JOIN
	Departments ON Groups.DepartmentId = Departments.Id

--6. Вивести назви кафедр та назви груп, які до них належать.
GO
SELECT 
    Departments.Name AS DepartmentName,
    Groups.Name AS GroupName
FROM 
    Departments,Groups
WHERE
	Departments.Id = Groups.DepartmentId
--7. Вивести назви дисциплін, які читає викладач “Samantha
--Adams”.
SELECT 
    Subjects.Name AS SubjectName
FROM 
    Lectures
JOIN 
    Subjects ON Lectures.SubjectId = Subjects.Id
JOIN 
    Teachers ON Lectures.TeacherId = Teachers.Id
WHERE 
    Teachers.Name = 'Alex' 
--8. Вивести назви кафедр, де читається дисципліна “Database
--Theory”.
SELECT
	Departments.Name AS DepartmentsName
FROM
	GroupsLectures
JOIN
	Groups ON GroupsLectures.GroupId = Groups.Id
JOIN
	Departments ON Groups.DepartmentId = Departments.Id
JOIN
	Lectures ON GroupsLectures.LecturesId = Lectures.Id
JOIN
	Subjects ON Lectures.SubjectId = Subjects.Id
WHERE
	Subjects.Name = 'Database Theory'

--9. Вивести назви груп, що належать до факультету Computer
--Science.
GO
SELECT
	Groups.Name AS GroupName
FROM
	Groups
JOIN
	Departments ON Groups.DepartmentId = Departments.FacultyId
WHERE
	Departments.Name = 'Department of Robotics'

--10. Вивести назви груп 5-го курсу, а також назву факультетів,
--до яких вони належать.
GO
SELECT 
	Departments.Name AS DepartmentName, Groups.Name AS GroupName
FROM
	Groups
JOIN
	Departments ON Groups.DepartmentId = Departments.Id
WHERE
	Groups.Year = 3

--11. Вивести повні імена викладачів та лекції, які вони читають (назви дисциплін та груп), причому відібрати лише ті
--лекції, що читаються в аудиторії “B103”.
GO
SELECT
	Teachers.Name, Teachers.Surname, Subjects.Name AS SubjectName, Groups.Name AS GroupName
FROM
	Teachers
JOIN
	Lectures ON Lectures.TeacherId = Teachers.Id
JOIN
	Subjects ON Lectures.SubjectId = Subjects.Id
JOIN
	GroupsLectures ON GroupsLectures.LecturesId = Lectures.Id
JOIN
	Groups ON GroupsLectures.GroupId = Groups.Id
WHERE
	Lectures.LectureRoom = 'Room 104'
