USE Ejemplo_Integridad_DB
GO

-- Probando insertar dos personas con mismo id

INSERT INTO Personas(Id, Nombre, Id_LugarNacimiento)
VALUES
(1, 'Cecilia', 1);
-- Violation of PRIMARY KEY constraint 'PK__Personas__3214EC078DFC3B8A'. Cannot insert duplicate key in object 'dbo.Personas'. The duplicate key value is (1).

GO

-- Probando insertar una persona sin nombre

INSERT INTO Personas (Id, Nombre, Id_LugarNacimiento)
VALUES
(7, NULL, 1);

-- Cannot insert the value NULL into column 'Nombre', table 'Ejemplo_Integridad_DB.dbo.Personas'; column does not allow nulls. INSERT fails.

GO

-- Probando insertar una persona con Id_LugarNacimiento que no existe en localidades

INSERT INTO Personas ( Id, Nombre, Id_LugarNacimiento)
VALUES
(7, 'Cecilia', 100); --100 no existe en localidades

-- The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Localidades_PERSONAS". The conflict occurred in database "Ejemplo_Integridad_DB", table "dbo.Localidades", column 'Id'.
