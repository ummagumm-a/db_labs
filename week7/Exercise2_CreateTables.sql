CREATE TABLE IF NOT EXISTS Schools
(
    Id INT PRIMARY KEY,
    Name VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Teachers
(
    Id INT PRIMARY KEY,
    Name VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Courses
(
    Id INT PRIMARY KEY,
    Name VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Rooms
(
    Id INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Publishers
(
    Id INT PRIMARY KEY,
    Name VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Books
(
    Id INT PRIMARY KEY,
    name character varying(50),
    pulbisherId integer NOT NULL,
    CONSTRAINT "books_pulbisherId_fkey" FOREIGN KEY (pulbisherId)
        REFERENCES public.publishers (Id)
);
CREATE TABLE IF NOT EXISTS Loanbooks
(
    schoolId integer NOT NULL,
    teacherId integer NOT NULL,
    courseId integer NOT NULL,
    roomId integer NOT NULL,
    grade integer NOT NULL,
    bookId integer NOT NULL,
    loanDate date NOT NULL,
    CONSTRAINT "loanbooks_pkey" PRIMARY KEY (schoolId, teacherId, courseId, roomId, bookId),
    CONSTRAINT "loanbooks_bookId_fkey" FOREIGN KEY (bookId)
        REFERENCES public.books (Id),
    CONSTRAINT "loanbooks_courseId_fkey" FOREIGN KEY (courseId)
        REFERENCES public.courses (Id),
    CONSTRAINT "loanbooks_roomId_fkey" FOREIGN KEY (roomId)
        REFERENCES public.rooms (Id),
    CONSTRAINT "loanbooks_schoolId_fkey" FOREIGN KEY (schoolId)
        REFERENCES public.schools (Id),
    CONSTRAINT "loanbooks_teacherId_fkey" FOREIGN KEY (teacherId)
        REFERENCES public.teachers (Id) 
);
