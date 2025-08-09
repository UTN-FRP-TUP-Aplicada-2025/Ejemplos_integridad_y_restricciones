USE Ejemplo_Integridad_DB

DROP TABLE IF EXISTS Localidades

GO

CREATE TABLE Localidades
(
  Id INT PRIMARY KEY,
  Nombre VARCHAR(100)
)

GO

INSERT INTO Localidades(Id, Nombre)
VALUES
(1, 'Parana'),
(2, 'La Paz'),
(3, 'Hernandarias'),
(4, 'Hasenkamp')

GO


DROP TABLE IF EXISTS Personas

GO

CREATE TABLE Personas
(
  Id INT PRIMARY KEY,
  Nombre VARCHAR(100),
  Id_LugarNacimiento INT
)

GO

INSERT INTO Personas(Id, Nombre, 
                    Id_LugarNacimiento)
VALUES
(1, 'Daniela', 1),
(2, 'Andrés', 2),
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