
USE Ejemplo_Integridad_DB

GO

SELECT name
FROM sys.foreign_keys
WHERE parent_object_id = OBJECT_ID('Personas');
--CONSTRAINT FK_Personas_Localidades
--FOREIGN KEY (Id_LugarNacimiento) REFERENCES Localidades(Id)

ALTER TABLE Personas
DROP CONSTRAINT FK__Personas__Id_Lug__1AD3FDA4;

ALTER TABLE Personas
DROP CONSTRAINT FK_Personas_Localidades

GO

DROP TABLE IF EXISTS Personas
DROP TABLE IF EXISTS Localidades

GO

CREATE TABLE Localidades
(
  Id INT PRIMARY KEY,
  Nombre VARCHAR(100) NOT NULL UNIQUE
)

GO

CREATE TABLE Personas
(
  Id INT PRIMARY KEY,
  Nombre VARCHAR(100) NOT NULL,
  Id_LugarNacimiento INT NOT NULL REFERENCES Localidades(Id),
)

GO

INSERT INTO Localidades(Id, Nombre)
VALUES
(1, 'Paraná'),
(2, 'La Paz'),
(3, 'Hernandarias'),
(4, 'Hasenkamp')

GO

INSERT INTO Personas(Id, Nombre, Id_LugarNacimiento)
VALUES
(1, 'Daniel', 1),
(2, 'Andres', 2),
(3, 'Daniela', 2),
(4, 'Andrés', 1),
(5, 'Armando', 1),
(6, 'Arturo', 3)


GO

SELECT p.Id, p.Nombre, l.Nombre AS LugarNacimiento
FROM Personas p
INNER JOIN Localidades l
    ON p.Id_LugarNacimiento = l.Id
ORDER BY L.Nombre