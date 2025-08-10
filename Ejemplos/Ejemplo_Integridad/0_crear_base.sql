


USE MASTER

GO

IF DB_ID('Ejemplo_Integridad_DB') IS NOT NULL
BEGIN
    ALTER DATABASE Ejemplo_Integridad_DB 
    SET SINGLE_USER 
    WITH ROLLBACK IMMEDIATE; --desconecta a todos los usuarios
    
    DROP DATABASE Ejemplo_Integridad_DB;
END

GO

CREATE DATABASE Ejemplo_Integridad_DB;

