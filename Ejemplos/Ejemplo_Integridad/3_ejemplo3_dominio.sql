-- seleccionado base de datos

USE Ejemplo_Integridad_DB

GO

-- limpiando las tablas
DROP TABLE IF EXISTS Personas
DROP TABLE IF EXISTS Localidades

GO

CREATE TABLE Localidades
(
  Id INT PRIMARY KEY,
  Nombre VARCHAR(100) NOT NULL
)

GO

INSERT INTO Localidades(Id, Nombre)
VALUES
(1, 'Paraná'),
(2, 'La Paz'),
(3, 'Hernandarias'),
(4, 'Hasenkamp')

GO

CREATE TABLE Personas
(
  Id INT PRIMARY KEY,
  Nombre VARCHAR(100) NOT NULL,
  Id_LugarNacimiento INT NOT NULL,
 CONSTRAINT  FK_Personas_Id_LugarNacimiento 
        FOREIGN KEY (Id_LugarNacimiento) 
        REFERENCES Localidades(Id)
)

GO

INSERT INTO Personas(Id, Nombre, Id_LugarNacimiento)
VALUES
(1, 'Daniel', 1),
(2, 'Andres', 2),
(3, 'Daniela', 2),
(4, 'Andrés', 1),
(5, 'Armando', 1),
(6, 'Arturo', 3)

--Consultando el listado de nombres y su lugar de nacimiento

SELECT p.Id, p.Nombre, l.Nombre AS LugarNacimiento
FROM Personas p
INNER JOIN Localidades l
    ON p.Id_LugarNacimiento = l.Id
ORDER BY L.Nombre