Create database PlusCinema
USE PlusCinema
 CREATE TABLE Movies(
     Id int PRIMARY key IDENTITY,
     Tittle NVARCHAR(255)Not Null,
     IMDbRating decimal Not Null,
     Duration INTEGER NOT NULL,
     DirectorId int REFERENCES Directors(Id),
 )
 
 CREATE TABLE Genres(
    Id int primary key identity,
    Name NVARCHAR(255) NOT NULL
)

Create TABLE MoviesGenres(
    Id int primary key IDENTITY,
    MovieId int REFERENCES Movies(Id),
    GenreId int REFERENCES Genres(Id),
)

CREATE TABLE Actors(
    Id int primary key identity,
    Name NVARCHAR(255) NOT NULL,
    SurName NVARCHAR(255) NOT NULL,
)

CREATE TABLE MovieActors(
    Id int primary key identity,
    MovieId int REFERENCES Movies(Id),
    ActorId int REFERENCES Actors(Id)
)
CREATE table Directors(
    Id int PRIMARY KEY IDENTITY,
    Name NVARCHAR(255) NOT NULL,
    SurName NVARCHAR(255) NOT NULL,
)

CREATE VIEW GetFullMoviesInfo 
AS
SELECT Movies.Tittle,Movies.IMDbRating,Genres.Name 'GenreName',Directors.Name 'DirectorName',Actors.Name 'ActorName',Actors.SurName
FROM Movies
JOIN Genres
ON Genres.Id=Movies.Id
JOIN Directors
ON Directors.Id=Movies.Id
JOIN Actors
ON Actors.Id=Movies.Id

SELECT * from GetFullMoviesInfo