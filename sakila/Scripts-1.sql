CREATE DATABASE bd_Seguimiento_Academico_G4;
USE bd_Seguimiento_Academico_G4;

-- Crear un usuario con permisos limitados
CREATE USER IF NOT EXISTS 'Jorge'@'localhost' IDENTIFIED BY 'Pas@123asG';
GRANT SELECT, INSERT, UPDATE, DELETE ON bd_Seguimiento_Academico_G4.* TO 'Jorge'@'localhost';

CREATE USER IF NOT EXISTS 'Niss'@'localhost' IDENTIFIED BY 'DF@123F&c';
GRANT SELECT, INSERT ON bd_Seguimiento_Academico_G4.* TO 'Niss'@'localhost';

-- Crear un usuario administrador
CREATE USER IF NOT EXISTS 'Admin'@'localhost' IDENTIFIED BY 'Admin$%456!';
GRANT ALL PRIVILEGES ON bd_Seguimiento_Academico_G4.* TO 'Admin'@'localhost';

-- Tabla Persona
CREATE TABLE PERSONA(
    ci INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    fechanaci DATE,
    telefono VARCHAR(20),
    email VARCHAR(100),
    nacionalidad VARCHAR(50),
    genero CHAR(1)
);

-- Tabla Estudiante
CREATE TABLE ESTUDIANTE(
    ciEstudiante INT PRIMARY KEY,
    regUniv VARCHAR(20),
    FOREIGN KEY (ciEstudiante) REFERENCES PERSONA(ci)
);

-- Tabla Docente
CREATE TABLE DOCENTE(
	idDocente INT PRIMARY KEY,
	titulo VARCHAR(100) NOT NULL,
	FOREIGN KEY (idDocente) REFERENCES PERSONA(ci)
);

-- Tabla Materia
CREATE TABLE MATERIA(
    idMateria INT PRIMARY KEY,
    nombreMateria VARCHAR(100),
    semestre INT NOT NULL
);

-- Tabla Mencion
CREATE TABLE MENCION(
    idMencion INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);


-- Tabla Mencion
CREATE TABLE AULA(
    idAula INT PRIMARY KEY,
    siglaAula VARCHAR(20) NOT NULL
);

-- Tabla Inscripcion
CREATE TABLE INSCRIPCION(
    idInscripcion INT PRIMARY KEY,
    ciEstudiante INT,
    fechaInscripcion DATE NOT NULL, 
    gestion VARCHAR(10) NOT NULL,
    FOREIGN KEY (ciEstudiante) REFERENCES ESTUDIANTE(ciEstudiante)
);

-- Tabla Paralelo Entidad Debil
CREATE TABLE PARALELO (
    idParalelo VARCHAR(1),
    idMateria INT,
    idDocente INT,
    dia VARCHAR(20),
    horaInicio TIME,
    horaFin TIME,
    PRIMARY KEY (idMateria, idParalelo),  -- Clave primaria compuesta
    FOREIGN KEY (idMateria) REFERENCES MATERIA(idMateria),
    FOREIGN KEY (idDocente) REFERENCES DOCENTE(idDocente)
);

-- Tabla CURSA (modificada para referencia correcta a PARALELO)
CREATE TABLE CURSA (
    idMateria INT,
    idAula INT,
    idParalelo VARCHAR(1),
    PRIMARY KEY (idMateria, idAula, idParalelo),
    FOREIGN KEY (idAula) REFERENCES AULA(idAula),
    FOREIGN KEY (idMateria, idParalelo) REFERENCES PARALELO(idMateria, idParalelo)
);


-- Tabla maxi_mat
CREATE TABLE MAXI_MAT (
    idMateria INT,
    idMencion INT,
    PRIMARY KEY (idMateria, idMencion),
    FOREIGN KEY (idMateria) REFERENCES MATERIA(idMateria),
    FOREIGN KEY (idMencion) REFERENCES MENCION(idMencion)
);

-- Tabla CONTIENE (modificada para referencia correcta a PARALELO)
CREATE TABLE CONTIENE (
    idMateria INT,
    idMencion INT,
    idInscripcion INT,
    idParalelo VARCHAR(1),
    nota DECIMAL(5,2),
    PRIMARY KEY (idMateria, idMencion, idInscripcion, idParalelo),
    FOREIGN KEY (idMencion) REFERENCES MENCION(idMencion),
    FOREIGN KEY (idInscripcion) REFERENCES INSCRIPCION(idInscripcion),
    FOREIGN KEY (idMateria, idParalelo) REFERENCES PARALELO(idMateria, idParalelo)
);

--Insertar datos
INSERT INTO PERSONA (ci, nombre, apellidos, fechanaci, telefono, email, nacionalidad, genero) VALUES
(1001, 'Juan', 'Pérez López', '2002-05-14', 71234567, 'juanPerez@gmail.com', 'Boliviana', 'Masculino'),
(1002, 'María', 'Gómez Rivas', '2003-03-22', 72345678, 'mariaGomez@gmail.com', 'Boliviana', 'Femenino'),
(1003, 'Carlos', 'Rodríguez Díaz', '2001-09-30', 73456789, 'carlosRodriguez@gmail.com', 'Boliviana', 'Masculino'),
(1004, 'Lucía', 'Torres Vargas', '2002-11-18', 74567890, 'luciaTorres@gmail.com', 'Boliviana', 'Femenino'),
(1005, 'José', 'Mamani Quispe', '2000-01-08', 75678901, 'joseMamani@gmail.com', 'Boliviana', 'Masculino'),
(1006, 'Ana', 'Cruz Fernández', '2003-07-21', 76789012, 'anaCruz@fcpn.edu.bo', 'Boliviana', 'Femenino'),
(1007, 'Luis', 'Flores Medina', '2001-06-12', 77890123, 'luisFlores@fcpn.edu.bo', 'Boliviana', 'Masculino'),
(1008, 'Elena', 'Ríos Salazar', '2002-02-25', 78901234, 'elenaRios@fcpn.edu.bo', 'Boliviana', 'Femenino'),
(1009, 'Miguel', 'Vargas Pinto', '2000-10-17', 79012345, 'miguelVargas@fcpn.edu.bo', 'Boliviana', 'Masculino'),
(1010, 'Carmen', 'López Andrade', '2001-12-05', 70123456, 'carmenLopez@fcpn.edu.bo', 'Boliviana', 'Femenino'),
(1011, 'Andrés', 'Salinas Rojas', '2002-04-10', 70234567, 'andresSalinas@fcpn.edu.bo', 'Boliviana', 'Masculino'),
(1012, 'Valeria', 'Morales Castro', '2003-08-29', 70345678, 'valeriaMorales@fcpn.edu.bo', 'Boliviana', 'Femenino'),
(1013, 'Diego', 'Navarro Guzmán', '2001-03-19', 70456789, 'diegoNavarro@fcpn.edu.bo', 'Boliviana', 'Masculino'),
(1014, 'Fernanda', 'Cordero Lima', '2002-06-24', 70567890, 'fernandaCordero@fcpn.edu.bo', 'Boliviana', 'Femenino'),
(1015, 'Jorge', 'Herrera Céspedes', '2000-12-01', 70678901, 'jorgeHerrera@fcpn.edu.bo', 'Boliviana', 'Masculino'),
(1016, 'Paola', 'Mendoza Velasco', '2003-11-13', 70789012, 'paolaMendoza@fcpn.edu.bo', 'Boliviana', 'Femenino'),
(1017, 'Ricardo', 'Ortiz Molina', '2001-05-07', 70890123, 'ricardoOrtiz@umsa.bo', 'Boliviana', 'Masculino'),
(1018, 'Sofía', 'Rojas Aguilar', '2002-09-16', 70901234, 'sofiaRojas@umsa.bo', 'Boliviana', 'Femenino'),
(1019, 'Daniel', 'Camacho Ruiz', '2000-08-11', 71012345, 'danielCamacho@umsa.bo', 'Boliviana', 'Masculino'),
(1020, 'Gabriela', 'Fuentes Aliaga', '2001-01-28', 71123456, 'gabrielaFuentes@umsa.bo', 'Boliviana', 'Femenino'),
(1021, 'Mateo', 'Gutiérrez Roca', '2002-07-09', 71234568, 'mateoGutierrez@umsa.bo', 'Boliviana', 'Masculino'),
(1022, 'Camila', 'Ibáñez Zamora', '2003-02-15', 71345678, 'camilaIbanez@umsa.bo', 'Boliviana', 'Femenino'),
(1023, 'Tomás', 'Reyes Cuéllar', '2001-10-03', 71456789, 'tomasReyes@umsa.bo', 'Boliviana', 'Masculino'),
(1024, 'Nicole', 'Peña Arce', '2002-03-27', 71567890, 'nicolePena@umsa.bo', 'Boliviana', 'Femenino'),
(1025, 'Sebastián', 'Cardozo Peredo', '2000-06-06', 71678901, 'sebastianCardozo@umsa.bo', 'Boliviana', 'Masculino'),
(1026, 'Mariana', 'Quiroga Soria', '2003-12-19', 71789012, 'marianaQuiroga@umsa.bo', 'Boliviana', 'Femenino'),
(1027, 'Bruno', 'Lara Montaño', '2001-11-04', 71890123, 'brunoLara@umsa.bo', 'Boliviana', 'Masculino'),
(1028, 'Isabela', 'Aliaga Villarroel', '2002-08-26', 71901234, 'isabelaAliaga@umsa.bo', 'Boliviana', 'Femenino'),
(1029, 'Felipe', 'Zeballos Arias', '2000-04-16', 72012345, 'felipeZeballos@umsa.bo', 'Boliviana', 'Masculino'),
(1030, 'Ariana', 'Gonzales Lema', '2001-09-12', 72123456, 'arianaGonzales@umsa.bo', 'Boliviana', 'Femenino'),
(1031, 'Samuel', 'Rivera Guzmán', '2002-02-07', 72234567, 'samuelRivera@umsa.bo', 'Peruana', 'Masculino'),
(1032, 'Daniela', 'López Acosta', '2003-03-12', 72345679, 'danielaLopez@umsa.bo', 'Argentina', 'Femenino'),
(1033, 'Martín', 'Sánchez Herrera', '2001-06-28', 72456780, 'martinSanchez@umsa.bo', 'Chilena', 'Masculino'),
(1034, 'Laura', 'Ramos Ortega', '2002-11-20', 72567891, 'lauraRamos@umsa.bo', 'Colombiana', 'Femenino'),
(1035, 'Alejandro', 'Vega Méndez', '2000-09-05', 72678902, 'alejandroVega@umsa.bo', 'Venezolana', 'Masculino'),
(1036, 'Patricia', 'Delgado León', '2003-10-17', 72789013, 'patriciaDelgado@umsa.bo', 'Mexicana', 'Femenino'),
(1037, 'Adrián', 'Ríos Padilla', '2001-01-14', 72890124, 'adrianRios@umsa.bo', 'Ecuatoriana', 'Masculino'),
(1038, 'Carla', 'Silva Paredes', '2002-04-22', 72901235, 'carlaSilva@umsa.bo', 'Uruguaya', 'Femenino'),
(1039, 'Oscar', 'Paz Villalobos', '2000-12-08', 73012346, 'oscarPaz@umsa.bo', 'Paraguaya', 'Masculino'),
(1040, 'Renata', 'Moreno Céspedes', '2001-05-30', 73123457, 'renataMoreno@umsa.bo', 'Brasilera', 'Femenino'),
(1041, 'Julián', 'Montenegro Arce', '2002-06-15', 73234568, 'julianMontenegro@umsa.bo', 'Boliviana', 'Masculino'),
(1042, 'Mónica', 'Aguilar Ríos', '2003-01-27', 73345679, 'monicaAguilar@umsa.bo', 'Argentina', 'Femenino'),
(1043, 'Cristian', 'Fernández Suárez', '2001-07-11', 73456780, 'cristianFernandez@gmail.com', 'Colombiana', 'Masculino'),
(1044, 'Natalia', 'Vargas Crespo', '2002-08-19', 73567891, 'nataliaVargas@gmail.com', 'Peruana', 'Femenino'),
(1045, 'Iván', 'Díaz Rivero', '2000-10-03', 73678902, 'ivanDiaz@gmail.com', 'Chilena', 'Masculino'),
(1046, 'Alejandra', 'Gutiérrez Soliz', '2003-04-23', 73789013, 'alejandraGutierrez@gmail.com', 'Venezolana', 'Femenino'),
(1047, 'Franco', 'Molina Cárdenas', '2001-02-18', 73890124, 'francoMolina@gmail.com', 'Mexicana', 'Masculino'),
(1048, 'Tatiana', 'Ramírez Céspedes', '2002-09-25', 73901235, 'tatianaRamirez@gmail.com', 'Ecuatoriana', 'Femenino'),
(1049, 'Axel', 'Morales Peñaranda', '2000-05-20', 74012346, 'axelMorales@gmail.com', 'Brasilera', 'Masculino'),
(1050, 'Verónica', 'Salvatierra Blanco', '2001-12-10', 74123457, 'veronicaSalvatierra@gmail.com', 'Uruguaya', 'Femenino'),
(1051, 'Roberto', 'Cáceres Guzmán', '1980-03-14', 75123456, 'robertoCaceres@gmail.com', 'Boliviana', 'Masculino'),
(1052, 'Silvia', 'Villarroel Rosas', '1978-11-02', 75234567, 'silviaVillarroel@gmail.com', 'Boliviana', 'Femenino'),
(1053, 'Enrique', 'Perales Molina', '1985-07-23', 75345678, 'enriquePerales@gmail.com', 'Argentina', 'Masculino'),
(1054, 'Lorena', 'Castro Delgado', '1979-09-17', 75456789, 'lorenaCastro@gmail.com', 'Colombiana', 'Femenino'),
(1055, 'Alfredo', 'Méndez Rojas', '1982-02-10', 75567890, 'alfredoMendez@gmail.com', 'Peruana', 'Masculino'),
(1056, 'Patricia', 'Acosta León', '1981-08-26', 75678901, 'patriciaAcosta@gmail.com', 'Chilena', 'Femenino'),
(1057, 'Fernando', 'Ruiz Campos', '1977-12-05', 75789012, 'fernandoRuiz@gmail.com', 'Venezolana', 'Masculino'),
(1058, 'Isabel', 'Medina Ortega', '1984-04-18', 75890123, 'isabelMedina@gmail.com', 'Mexicana', 'Femenino'),
(1059, 'Javier', 'Salazar Quiroga', '1980-01-08', 75901234, 'javierSalazar@gmail.com', 'Ecuatoriana', 'Masculino'),
(1060, 'Claudia', 'Zúñiga Paredes', '1976-06-22', 76012345, 'claudiaZuniga@gmail.com', 'Uruguaya', 'Femenino'),
(1061, 'Héctor', 'Peñaloza Vargas', '1983-05-30', 76123456, 'hectorPenaloza@gmail.com', 'Boliviana', 'Masculino'),
(1062, 'Rosa', 'Mamani Ticona', '1981-09-19', 76234567, 'rosaMamani@gmail.com', 'Boliviana', 'Femenino'),
(1063, 'Marcelo', 'Gonzales Roca', '1979-03-27', 76345678, 'marceloGonzales@gmail.com', 'Argentina', 'Masculino'),
(1064, 'Luisa', 'Romero Céspedes', '1982-10-14', 76456789, 'luisaRomero@gmail.com', 'Colombiana', 'Femenino'),
(1065, 'Víctor', 'Ortega Fernández', '1985-07-07', 76567890, 'victorOrtega@gmail.com', 'Peruana', 'Masculino'),
(1066, 'Carolina', 'Fuentes Chávez', '1980-11-30', 76678901, 'carolinaFuentes@gmail.com', 'Chilena', 'Femenino'),
(1067, 'Ramiro', 'López Medrano', '1978-08-15', 76789012, 'ramiroLopez@gmail.com', 'Venezolana', 'Masculino'),
(1068, 'Nancy', 'Quispe Aliaga', '1976-12-20', 76890123, 'nancyQuispe@gmail.com', 'Mexicana', 'Femenino'),
(1069, 'Gustavo', 'Roca Ibáñez', '1983-04-11', 76901234, 'gustavoRoca@gmail.com', 'Ecuatoriana', 'Masculino'),
(1070, 'Rebeca', 'Delgadillo Pinto', '1981-02-08', 77012345, 'rebecaDelgadillo@gmail.com', 'Uruguaya', 'Femenino');


INSERT INTO ESTUDIANTE (ciEstudiante, regUniv) VALUES
(1001, 2023001),
(1002, 2023002),
(1003, 2023003),
(1004, 2023004),
(1005, 2023005),
(1006, 2023006),
(1007, 2023007),
(1008, 2023008),
(1009, 2023009),
(1010, 2023010),
(1011, 2023011),
(1012, 2023012),
(1013, 2023013),
(1014, 2023014),
(1015, 2023015),
(1016, 2023016),
(1017, 2023017),
(1018, 2023018),
(1019, 2023019),
(1020, 2023020),
(1021, 2023021),
(1022, 2023022),
(1023, 2023023),
(1024, 2023024),
(1025, 2023025),
(1026, 2023026),
(1027, 2023027),
(1028, 2023028),
(1029, 2023029),
(1030, 2023030),
(1031, 2023031),
(1032, 2023032),
(1033, 2023033),
(1034, 2023034),
(1035, 2023035),
(1036, 2023036),
(1037, 2023037),
(1038, 2023038),
(1039, 2023039),
(1040, 2023040),
(1041, 2023041),
(1042, 2023042),
(1043, 2023043),
(1044, 2023044),
(1045, 2023045),
(1046, 2023046),
(1047, 2023047),
(1048, 2023048),
(1049, 2023049),
(1050, 2023050);

INSERT INTO DOCENTE (idDocente, titulo) VALUES
(1051, 'Licenciado en Ciencias de la Computación'),
(1052, 'Doctor en Ingeniería de Sistemas'),
(1053, 'Licenciado en Ingeniería Informática'),
(1054, 'Magíster en Ciencias de la Computación'),
(1055, 'Licenciado en Tecnologías de Información'),
(1056, 'Doctor en Inteligencia Artificial'),
(1057, 'Licenciado en Matemáticas Aplicadas'),
(1058, 'Magíster en Seguridad de la Información'),
(1059, 'Licenciado en Ingeniería Electrónica'),
(1060, 'Doctor en Ciencias de la Computación'),
(1061, 'Licenciado en Sistemas de Información'),
(1062, 'Licenciado en Inteligencia Artificial'),
(1063, 'Magíster en Ciencias de la Computación'),
(1064, 'Doctor en Informática Industrial'),
(1065, 'Licenciado en Ingeniería Industrial'),
(1066, 'Magíster en Tecnología de la Información'),
(1067, 'Licenciado en Seguridad Informática'),
(1068, 'Doctor en Tecnologías de Información'),
(1069, 'Magíster en Ciencias de la Computación'),
(1070, 'Licenciado en Desarrollo de Software');

INSERT INTO INSCRIPCION (idInscripcion, fechaInscripcion, gestion, ciEstudiante) VALUES
(1, '2022-03-15', '2022-1', 1001),
(2, '2022-04-17', '2022-2', 1001),
(3, '2023-02-20', '2023-1', 1001),
(4, '2023-07-01', '2023-2', 1001),
(5, '2024-05-22', '2024-1', 1001),
(6, '2025-01-10', '2025-2', 1001),

(7, '2022-06-15', '2022-2', 1002),
(8, '2023-03-12', '2023-1', 1002),
(9, '2023-08-05', '2023-2', 1002),
(10, '2024-02-11', '2024-1', 1002),
(11, '2025-04-02', '2025-2', 1002),

(12, '2022-11-10', '2022-1', 1003),
(13, '2023-01-29', '2023-1', 1003),
(14, '2023-05-17', '2023-2', 1003),
(15, '2024-03-25', '2024-1', 1003),
(16, '2025-02-15', '2025-2', 1003),

(17, '2022-04-09', '2022-1', 1004),
(18, '2022-10-14', '2022-2', 1004),
(19, '2023-07-18', '2023-2', 1004),
(20, '2024-01-03', '2024-1', 1004),
(21, '2025-05-20', '2025-2', 1004),

(22, '2022-12-21', '2022-1', 1005),
(23, '2023-06-06', '2023-2', 1005),
(24, '2024-09-01', '2024-1', 1005),
(25, '2025-03-25', '2025-2', 1005),

(26, '2022-08-11', '2022-2', 1006),
(27, '2023-05-02', '2023-1', 1006),
(28, '2023-11-21', '2023-2', 1006),
(29, '2024-02-14', '2024-1', 1006),
(30, '2025-09-04', '2025-2', 1006),

(31, '2022-03-23', '2022-1', 1007),
(32, '2023-01-11', '2023-1', 1007),
(33, '2023-09-30', '2023-2', 1007),
(34, '2024-04-25', '2024-1', 1007),
(35, '2025-10-18', '2025-2', 1007),

(36, '2022-07-20', '2022-2', 1008),
(37, '2023-04-03', '2023-1', 1008),
(38, '2023-10-28', '2023-2', 1008),
(39, '2024-06-19', '2024-1', 1008),
(40, '2025-01-30', '2025-2', 1008),

(41, '2022-10-12', '2022-1', 1009),
(42, '2023-08-02', '2023-2', 1009),
(43, '2024-05-09', '2024-1', 1009),
(44, '2025-04-22', '2025-2', 1009),

(45, '2022-02-14', '2022-1', 1010),
(46, '2023-07-27', '2023-2', 1010),
(47, '2024-01-11', '2024-1', 1010),
(48, '2025-06-17', '2025-2', 1010),

(49, '2022-01-05', '2022-1', 1011),
(50, '2023-06-08', '2023-2', 1011),
(51, '2023-12-14', '2023-1', 1011),
(52, '2024-07-10', '2024-1', 1011),
(53, '2025-02-22', '2025-2', 1011),

(54, '2022-04-19', '2022-1', 1012),
(55, '2023-09-17', '2023-2', 1012),
(56, '2024-03-05', '2024-1', 1012),
(57, '2025-08-08', '2025-2', 1012),

(58, '2022-05-01', '2022-2', 1013),
(59, '2023-11-03', '2023-1', 1013),
(60, '2024-08-17', '2024-1', 1013),

(61, '2023-02-03', '2023-1', 1014),
(62, '2023-09-11', '2023-2', 1014),
(63, '2024-06-21', '2024-1', 1014),
(64, '2025-03-19', '2025-2', 1014),

(65, '2022-07-05', '2022-1', 1015),
(66, '2023-04-16', '2023-2', 1015),
(67, '2024-10-02', '2024-1', 1015),
(68, '2025-11-01', '2025-2', 1015),

(69, '2022-11-30', '2022-2', 1016),
(70, '2023-06-22', '2023-1', 1016),
(71, '2024-01-18', '2024-1', 1016),
(72, '2025-05-06', '2025-2', 1016),

(73, '2022-09-27', '2022-1', 1017),
(74, '2023-02-13', '2023-1', 1017),
(75, '2023-08-19', '2023-2', 1017),
(76, '2024-04-11', '2024-1', 1017),
(77, '2025-07-12', '2025-2', 1017),

(78, '2022-03-10', '2022-2', 1018),
(79, '2023-05-29', '2023-1', 1018),
(80, '2024-12-09', '2024-1', 1018),
(81, '2025-02-28', '2025-2', 1018),

(82, '2022-10-25', '2022-1', 1019),
(83, '2023-01-03', '2023-2', 1019),
(84, '2024-07-15', '2024-1', 1019),
(85, '2025-06-26', '2025-2', 1019),

(86, '2022-04-01', '2022-1', 1020),
(87, '2023-08-25', '2023-2', 1020),
(88, '2024-10-14', '2024-1', 1020),
(89, '2025-04-18', '2025-2', 1020),

(90, '2022-11-04', '2022-2', 1021);


INSERT INTO MENCION (idMencion, nombre) VALUES
(201, 'Ingeniería de Sistemas'),
(202, 'Inteligencia Artificial'),
(203, 'Informática Industrial'),
(204, 'Redes y Tecnologías de la Información'),
(205, 'Seguridad de la Información'),
(206, 'Ciencias de la Computación'),
(207, 'Desarrollo de Software');


INSERT INTO MATERIA (idMateria, nombreMateria, semestre) VALUES
(301, 'Matemáticas I', 1),
(302, 'Programación I', 1),
(303, 'Física I', 1),
(304, 'Química', 1),
(305, 'Introducción a la Ingeniería', 1),
(306, 'Matemáticas II', 2),
(307, 'Programación II', 2),
(308, 'Física II', 2),
(309, 'Circuitos Eléctricos', 2),
(310, 'Algebra Lineal', 2),
(311, 'Estructuras de Datos', 3),
(312, 'Matemáticas III', 3),
(313, 'Teoría de Circuitos', 3),
(314, 'Bases de Datos', 3),
(315, 'Probabilidad y Estadística', 3),
(316, 'Redes de Computadoras', 4),
(317, 'Arquitectura de Computadores', 4),
(318, 'Algoritmos Avanzados', 4),
(319, 'Fundamentos de Redes', 4),
(320, 'Microprocesadores', 4),
(321, 'Lenguajes de Programación', 5),
(322, 'Sistemas Operativos', 5),
(323, 'Cálculo I', 5),
(324, 'Ingeniería de Software', 5),
(325, 'Matemáticas Discretas', 5),
(326, 'Redes Avanzadas', 6),
(327, 'Análisis de Sistemas', 6),
(328, 'Programación Orientada a Objetos', 6),
(329, 'Sistemas de Información', 6),
(330, 'Teoría de la Computación', 6),
(331, 'Cálculo II', 7),
(332, 'Redes de Área Local', 7),
(333, 'Seguridad en Redes', 7),
(334, 'Base de Datos Relacionales', 7),
(335, 'Inteligencia Artificial I', 7),
(336, 'Estructuras Avanzadas de Datos', 8),
(337, 'Electrónica Digital', 8),
(338, 'Sistemas Digitales', 8),
(339, 'Lenguajes Formales', 8),
(340, 'Redes Inalámbricas', 8),
(341, 'Cálculo III', 9),
(342, 'Sistemas Distribuidos', 9),
(343, 'Big Data', 9),
(344, 'Optimización de Algoritmos', 9),
(345, 'Interacción Humano-Computadora', 9),
(346, 'Seguridad de la Información', 10),
(347, 'Ciberseguridad', 10),
(348, 'Computación Cuántica', 10),
(349, 'Lenguajes de Programación Funcional', 10),
(350, 'Procesadores y Arquitectura', 10),
(351, 'Minería de Datos', 11),
(352, 'Redes Sociales', 11),
(353, 'Sistemas Inteligentes', 11),
(354, 'Métodos Numéricos', 11),
(355, 'Desarrollo Web', 11),
(356, 'Teoría de Grafos', 12),
(357, 'Programación Concurrente', 12),
(358, 'Sistemas Expertos', 12),
(359, 'Computación Gráfica', 12),
(360, 'Internet de las Cosas (IoT)', 12),
(361, 'Arquitectura de Software', 13),
(362, 'Sistemas de Control', 13),
(363, 'Aplicaciones Móviles', 13),
(364, 'Visión Artificial', 13),
(365, 'Procesamiento de Imágenes', 13),
(366, 'Inteligencia Artificial II', 14),
(367, 'Análisis de Sentimientos', 14),
(368, 'Computación en la Nube', 14),
(369, 'Blockchain', 14),
(370, 'Robótica', 14);
INSERT INTO PARALELO (idParalelo, idMateria, dia, horaInicio, horaFin, idDocente) VALUES
('B', 301, 'Jueves', '08:00:00', '10:00:00', 1068),
('F', 301, 'Martes', '16:00:00', '18:00:00', 1057),
('C', 301, 'Lunes', '14:00:00', '16:00:00', 1053),
('E', 301, 'Lunes', '10:00:00', '12:00:00', 1060),
('C', 302, 'Miercoles', '12:00:00', '14:00:00', 1059),
('D', 303, 'Lunes', '10:00:00', '12:00:00', 1051),
('A', 303, 'Lunes', '16:00:00', '18:00:00', 1055),
('C', 303, 'Jueves', '12:00:00', '14:00:00', 1065),
('E', 303, 'Viernes', '08:00:00', '10:00:00', 1051),
('F', 304, 'Lunes', '14:00:00', '16:00:00', 1067),
('A', 304, 'Viernes', '10:00:00', '12:00:00', 1061),
('E', 304, 'Miercoles', '08:00:00', '10:00:00', 1061),
('A', 305, 'Jueves', '14:00:00', '16:00:00', 1069),
('A', 306, 'Martes', '16:00:00', '18:00:00', 1055),
('B', 306, 'Viernes', '12:00:00', '14:00:00', 1063),
('C', 306, 'Jueves', '08:00:00', '10:00:00', 1057),
('E', 306, 'Viernes', '14:00:00', '16:00:00', 1063),
('C', 307, 'Jueves', '12:00:00', '14:00:00', 1061),
('E', 307, 'Miercoles', '10:00:00', '12:00:00', 1070),
('A', 307, 'Viernes', '08:00:00', '10:00:00', 1068),
('E', 308, 'Jueves', '08:00:00', '10:00:00', 1056),
('C', 308, 'Viernes', '10:00:00', '12:00:00', 1054),
('B', 308, 'Lunes', '10:00:00', '12:00:00', 1065),
('E', 309, 'Martes', '08:00:00', '10:00:00', 1065),
('B', 309, 'Miercoles', '12:00:00', '14:00:00', 1058),
('A', 309, 'Lunes', '08:00:00', '10:00:00', 1064),
('D', 310, 'Lunes', '16:00:00', '18:00:00', 1069),
('C', 310, 'Jueves', '12:00:00', '14:00:00', 1055),
('C', 311, 'Jueves', '12:00:00', '14:00:00', 1069),
('F', 311, 'Miercoles', '08:00:00', '10:00:00', 1060),
('A', 311, 'Martes', '16:00:00', '18:00:00', 1057),
('E', 311, 'Martes', '14:00:00', '16:00:00', 1070),
('D', 312, 'Lunes', '14:00:00', '16:00:00', 1065),
('E', 313, 'Miercoles', '08:00:00', '10:00:00', 1053),
('B', 313, 'Viernes', '10:00:00', '12:00:00', 1052),
('C', 313, 'Miercoles', '16:00:00', '18:00:00', 1059),
('F', 313, 'Viernes', '08:00:00', '10:00:00', 1057),
('D', 314, 'Jueves', '08:00:00', '10:00:00', 1057),
('C', 314, 'Martes', '10:00:00', '12:00:00', 1056),
('F', 315, 'Lunes', '12:00:00', '14:00:00', 1053),
('E', 316, 'Lunes', '12:00:00', '14:00:00', 1051),
('D', 317, 'Miercoles', '14:00:00', '16:00:00', 1070),
('E', 318, 'Lunes', '16:00:00', '18:00:00', 1059),
('F', 318, 'Martes', '12:00:00', '14:00:00', 1064),
('D', 319, 'Miercoles', '10:00:00', '12:00:00', 1054),
('C', 319, 'Miercoles', '08:00:00', '10:00:00', 1059),
('F', 319, 'Miercoles', '16:00:00', '18:00:00', 1060),
('B', 319, 'Miercoles', '12:00:00', '14:00:00', 1063),
('F', 320, 'Miercoles', '16:00:00', '18:00:00', 1053),
('B', 320, 'Viernes', '16:00:00', '18:00:00', 1051),
('D', 320, 'Jueves', '14:00:00', '16:00:00', 1060),
('C', 320, 'Lunes', '10:00:00', '12:00:00', 1059),
('F', 321, 'Jueves', '12:00:00', '14:00:00', 1060),
('E', 321, 'Lunes', '16:00:00', '18:00:00', 1070),
('E', 322, 'Jueves', '12:00:00', '14:00:00', 1063),
('D', 322, 'Martes', '08:00:00', '10:00:00', 1060),
('F', 322, 'Viernes', '12:00:00', '14:00:00', 1058),
('F', 323, 'Lunes', '10:00:00', '12:00:00', 1065),
('A', 323, 'Viernes', '14:00:00', '16:00:00', 1060),
('E', 323, 'Miercoles', '14:00:00', '16:00:00', 1070),
('A', 324, 'Martes', '12:00:00', '14:00:00', 1059),
('F', 324, 'Jueves', '10:00:00', '12:00:00', 1063),
('E', 324, 'Viernes', '16:00:00', '18:00:00', 1054),
('D', 324, 'Miercoles', '08:00:00', '10:00:00', 1063),
('F', 325, 'Lunes', '10:00:00', '12:00:00', 1069),
('D', 326, 'Lunes', '14:00:00', '16:00:00', 1067),
('C', 327, 'Jueves', '14:00:00', '16:00:00', 1066),
('B', 327, 'Jueves', '12:00:00', '14:00:00', 1057),
('A', 328, 'Viernes', '16:00:00', '18:00:00', 1058),
('D', 328, 'Miercoles', '08:00:00', '10:00:00', 1064),
('E', 329, 'Jueves', '12:00:00', '14:00:00', 1056),
('C', 329, 'Miercoles', '14:00:00', '16:00:00', 1052),
('B', 329, 'Jueves', '08:00:00', '10:00:00', 1051),
('E', 330, 'Viernes', '14:00:00', '16:00:00', 1054),
('D', 330, 'Miercoles', '16:00:00', '18:00:00', 1062),
('C', 330, 'Lunes', '16:00:00', '18:00:00', 1055),
('A', 331, 'Lunes', '10:00:00', '12:00:00', 1069),
('B', 331, 'Viernes', '14:00:00', '16:00:00', 1053),
('C', 331, 'Jueves', '12:00:00', '14:00:00', 1061),
('D', 331, 'Lunes', '10:00:00', '12:00:00', 1059),
('B', 332, 'Viernes', '16:00:00', '18:00:00', 1058),
('E', 332, 'Viernes', '08:00:00', '10:00:00', 1059),
('A', 333, 'Jueves', '10:00:00', '12:00:00', 1069),
('A', 334, 'Lunes', '10:00:00', '12:00:00', 1056),
('A', 335, 'Viernes', '12:00:00', '14:00:00', 1065),
('C', 335, 'Martes', '14:00:00', '16:00:00', 1068),
('E', 336, 'Lunes', '08:00:00', '10:00:00', 1064),
('E', 337, 'Martes', '16:00:00', '18:00:00', 1061),
('A', 337, 'Miercoles', '10:00:00', '12:00:00', 1056),
('D', 337, 'Viernes', '16:00:00', '18:00:00', 1065),
('D', 338, 'Lunes', '10:00:00', '12:00:00', 1068),
('B', 338, 'Jueves', '16:00:00', '18:00:00', 1067),
('C', 338, 'Martes', '12:00:00', '14:00:00', 1063),
('E', 338, 'Jueves', '14:00:00', '16:00:00', 1064),
('F', 339, 'Miercoles', '16:00:00', '18:00:00', 1070),
('B', 340, 'Viernes', '12:00:00', '14:00:00', 1068),
('C', 340, 'Miercoles', '14:00:00', '16:00:00', 1069),
('E', 340, 'Jueves', '16:00:00', '18:00:00', 1064),
('D', 341, 'Jueves', '10:00:00', '12:00:00', 1070),
('C', 341, 'Lunes', '08:00:00', '10:00:00', 1064),
('B', 342, 'Martes', '14:00:00', '16:00:00', 1057),
('C', 342, 'Miercoles', '08:00:00', '10:00:00', 1062),
('E', 342, 'Jueves', '16:00:00', '18:00:00', 1062),
('D', 342, 'Viernes', '08:00:00', '10:00:00', 1061),
('A', 343, 'Lunes', '08:00:00', '10:00:00', 1066),
('F', 343, 'Viernes', '08:00:00', '10:00:00', 1061),
('C', 344, 'Miercoles', '12:00:00', '14:00:00', 1062),
('F', 344, 'Lunes', '10:00:00', '12:00:00', 1068),
('A', 344, 'Miercoles', '16:00:00', '18:00:00', 1069),
('D', 345, 'Martes', '08:00:00', '10:00:00', 1054),
('E', 345, 'Lunes', '16:00:00', '18:00:00', 1065),
('F', 346, 'Martes', '10:00:00', '12:00:00', 1058),
('C', 346, 'Martes', '12:00:00', '14:00:00', 1061),
('E', 347, 'Lunes', '14:00:00', '16:00:00', 1060),
('A', 347, 'Lunes', '16:00:00', '18:00:00', 1057),
('F', 347, 'Miercoles', '12:00:00', '14:00:00', 1061),
('C', 347, 'Jueves', '12:00:00', '14:00:00', 1058),
('F', 348, 'Lunes', '12:00:00', '14:00:00', 1056),
('C', 349, 'Jueves', '12:00:00', '14:00:00', 1053),
('D', 349, 'Lunes', '16:00:00', '18:00:00', 1051),
('C', 350, 'Jueves', '08:00:00', '10:00:00', 1057),
('A', 350, 'Viernes', '08:00:00', '10:00:00', 1052),
('E', 350, 'Lunes', '16:00:00', '18:00:00', 1054),
('C', 351, 'Miercoles', '14:00:00', '16:00:00', 1061),
('F', 351, 'Jueves', '10:00:00', '12:00:00', 1067),
('A', 351, 'Lunes', '12:00:00', '14:00:00', 1061),
('E', 352, 'Jueves', '08:00:00', '10:00:00', 1061),
('D', 352, 'Miercoles', '08:00:00', '10:00:00', 1064),
('D', 353, 'Lunes', '10:00:00', '12:00:00', 1062),
('A', 353, 'Viernes', '12:00:00', '14:00:00', 1060),
('A', 354, 'Jueves', '16:00:00', '18:00:00', 1054),
('F', 354, 'Miercoles', '14:00:00', '16:00:00', 1057),
('D', 354, 'Miercoles', '10:00:00', '12:00:00', 1070),
('A', 355, 'Miercoles', '10:00:00', '12:00:00', 1052),
('F', 355, 'Jueves', '10:00:00', '12:00:00', 1064),
('E', 356, 'Viernes', '08:00:00', '10:00:00', 1068),
('F', 357, 'Lunes', '12:00:00', '14:00:00', 1061),
('D', 357, 'Lunes', '08:00:00', '10:00:00', 1062),
('A', 357, 'Viernes', '14:00:00', '16:00:00', 1058),
('B', 357, 'Miercoles', '10:00:00', '12:00:00', 1057),
('E', 358, 'Martes', '16:00:00', '18:00:00', 1057),
('B', 358, 'Viernes', '16:00:00', '18:00:00', 1056),
('F', 359, 'Jueves', '10:00:00', '12:00:00', 1062),
('D', 359, 'Lunes', '12:00:00', '14:00:00', 1054),
('E', 360, 'Lunes', '10:00:00', '12:00:00', 1069),
('A', 360, 'Lunes', '12:00:00', '14:00:00', 1063),
('C', 360, 'Viernes', '16:00:00', '18:00:00', 1068),
('F', 360, 'Miercoles', '10:00:00', '12:00:00', 1069),
('F', 361, 'Martes', '10:00:00', '12:00:00', 1061),
('B', 362, 'Jueves', '10:00:00', '12:00:00', 1057),
('F', 363, 'Viernes', '08:00:00', '10:00:00', 1056),
('A', 363, 'Miercoles', '08:00:00', '10:00:00', 1058),
('F', 364, 'Martes', '08:00:00', '10:00:00', 1051),
('E', 365, 'Jueves', '14:00:00', '16:00:00', 1063),
('D', 365, 'Jueves', '12:00:00', '14:00:00', 1058),
('B', 365, 'Martes', '08:00:00', '10:00:00', 1066),
('A', 365, 'Martes', '12:00:00', '14:00:00', 1066),
('E', 366, 'Viernes', '16:00:00', '18:00:00', 1064),
('E', 367, 'Miercoles', '16:00:00', '18:00:00', 1055),
('D', 367, 'Lunes', '12:00:00', '14:00:00', 1052),
('C', 367, 'Lunes', '16:00:00', '18:00:00', 1061),
('F', 367, 'Viernes', '08:00:00', '10:00:00', 1056),
('B', 368, 'Miercoles', '12:00:00', '14:00:00', 1069),
('C', 368, 'Martes', '08:00:00', '10:00:00', 1053),
('F', 368, 'Martes', '12:00:00', '14:00:00', 1069),
('A', 368, 'Viernes', '08:00:00', '10:00:00', 1057),
('C', 369, 'Viernes', '14:00:00', '16:00:00', 1060),
('A', 369, 'Jueves', '10:00:00', '12:00:00', 1066),
('B', 369, 'Miercoles', '16:00:00', '18:00:00', 1053),
('D', 370, 'Lunes', '08:00:00', '10:00:00', 1067),
('F', 370, 'Viernes', '12:00:00', '14:00:00', 1060);


INSERT INTO MAXI_MAT (idMateria, idMencion) VALUES
(301, 201), 
(301, 202), 
(302, 203), 
(302, 204), 
(303, 205),
(304, 206), 
(304, 207), 
(305, 201), 
(305, 202), 
(306, 203),
(307, 204), 
(308, 205), 
(309, 206), 
(310, 207), 
(311, 201),
(312, 202), 
(313, 203), 
(314, 204), 
(315, 205), 
(316, 206),
(317, 207), 
(318, 201), 
(319, 202), 
(320, 203), 
(321, 204),
(322, 205), 
(323, 206), 
(324, 207), 
(325, 201), 
(326, 202),
(327, 203), 
(328, 204), 
(329, 205), 
(330, 206), 
(331, 207),
(332, 201), 
(333, 202), 
(334, 203), 
(335, 204), 
(336, 205),
(337, 206), 
(338, 207), 
(339, 201), 
(340, 202), 
(341, 203),
(342, 204), 
(343, 205), 
(344, 206), 
(345, 207), 
(346, 201),
(347, 202), 
(348, 203), 
(349, 204), 
(350, 205), 
(351, 206),
(352, 207), 
(353, 201), 
(354, 202), 
(355, 203), 
(356, 204),
(357, 205), 
(358, 206), 
(359, 207), 
(360, 201), 
(361, 202),
(362, 203), 
(363, 204), 
(364, 205), 
(365, 206), 
(366, 207),
(367, 201), 
(368, 202), 
(369, 203), 
(370, 204);


INSERT INTO AULA (idAula, siglaAula) VALUES
(401, 'P1-A1'),
(402, 'P1-A2'),
(403, 'P1-A3'),
(404, 'P1-A4'),
(405, 'P1-A5'),
(406, 'P2-B1'),
(407, 'P2-B2'),
(408, 'P2-B3'),
(409, 'P2-B4'),
(410, 'P2-B5'),
(411, 'P3-C1'),
(412, 'P3-C2'),
(413, 'P3-C3'),
(414, 'P3-C4'),
(415, 'P3-C5'),
(416, 'P4-D1'),
(417, 'P4-D2'),
(418, 'P4-D3'),
(419, 'P4-D4'),
(420, 'P4-D5'),
(421, 'P5-E1'),
(422, 'P5-E2'),
(423, 'P5-E3'),
(424, 'P5-E4'),
(425, 'P5-E5');

-- Inserciones para CURSA (completamente compatibles con tus datos de PARALELO)
INSERT INTO CURSA (idMateria, idAula, idParalelo) VALUES
-- Matemáticas I (301) - Paralelos existentes: B, F, C, E
(301, 401, 'B'),
(301, 402, 'F'),
(301, 403, 'C'),
(301, 404, 'E'),

-- Programación I (302) - Paralelo existente: C
(302, 405, 'C'),

-- Física I (303) - Paralelos existentes: D, A, C, E
(303, 406, 'D'),
(303, 407, 'A'),
(303, 408, 'C'),
(303, 409, 'E'),

-- Química (304) - Paralelos existentes: F, A, E
(304, 410, 'F'),
(304, 411, 'A'),
(304, 412, 'E'),

-- Introducción a la Ingeniería (305) - Paralelo existente: A
(305, 413, 'A'),

-- Matemáticas II (306) - Paralelos existentes: A, B, C, E
(306, 414, 'A'),
(306, 415, 'B'),
(306, 416, 'C'),
(306, 417, 'E'),

-- Programación II (307) - Paralelos existentes: C, E, A
(307, 418, 'C'),
(307, 419, 'E'),
(307, 420, 'A'),

-- Física II (308) - Paralelos existentes: E, C, B
(308, 421, 'E'),
(308, 422, 'C'),
(308, 423, 'B'),

-- Circuitos Eléctricos (309) - Paralelos existentes: E, B, A
(309, 424, 'E'),
(309, 425, 'B'),
(309, 401, 'A'),

-- Álgebra Lineal (310) - Paralelos existentes: D, C
(310, 402, 'D'),
(310, 403, 'C'),

-- Estructuras de Datos (311) - Paralelos existentes: C, F, A, E
(311, 404, 'C'),
(311, 405, 'F'),
(311, 406, 'A'),
(311, 407, 'E'),

-- Matemáticas III (312) - Paralelo existente: D
(312, 408, 'D'),

-- Teoría de Circuitos (313) - Paralelos existentes: E, B, C, F
(313, 409, 'E'),
(313, 410, 'B'),
(313, 411, 'C'),
(313, 412, 'F'),

-- Bases de Datos (314) - Paralelos existentes: D, C
(314, 413, 'D'),
(314, 414, 'C'),

-- Probabilidad y Estadística (315) - Paralelo existente: F
(315, 415, 'F'),

-- Redes de Computadoras (316) - Paralelo existente: E
(316, 416, 'E'),

-- Arquitectura de Computadores (317) - Paralelo existente: D
(317, 417, 'D'),

-- Algoritmos Avanzados (318) - Paralelos existentes: E, F
(318, 418, 'E'),
(318, 419, 'F'),

-- Fundamentos de Redes (319) - Paralelos existentes: D, C, F, B
(319, 420, 'D'),
(319, 421, 'C'),
(319, 422, 'F'),
(319, 423, 'B'),

-- Microprocesadores (320) - Paralelos existentes: F, B, D, C
(320, 424, 'F'),
(320, 425, 'B'),
(320, 401, 'D'),
(320, 402, 'C');


INSERT INTO CONTIENE (idMateria, idMencion, idInscripcion, idParalelo, nota) VALUES
(301, 201, 1, 'B', 85.30), 
(302, 202, 1, 'C', 79.10),   
(303, 203, 1, 'A', 92.50), 
(304, 206, 1, 'A', 88.20),
(305, 201, 1, 'A', 76.50),
(306, 203, 2, 'B', 81.40),
(307, 204, 2, 'E', 93.70),
(308, 205, 2, 'C', 85.00),

(309, 206, 3, 'A', 79.80),
(310, 207, 3, 'C', 91.20),
(311, 201, 3, 'F', 84.60),

(312, 202, 4, 'D', 87.90),
(313, 203, 4, 'B', 78.30),
(314, 204, 4, 'C', 82.10),

(315, 205, 5, 'F', 89.50),
(316, 206, 5, 'E', 76.80),
(317, 207, 5, 'D', 94.20),

(318, 201, 6, 'F', 83.70),
(319, 202, 6, 'B', 88.40),
(320, 203, 6, 'C', 77.90),

(301, 201, 7, 'F', 85.60),
(302, 202, 7, 'C', 90.10),
(303, 203, 7, 'D', 82.30),

(304, 206, 8, 'E', 79.40),
(305, 201, 8, 'A', 91.70),
(306, 203, 8, 'C', 86.20),

(307, 204, 9, 'A', 84.50),
(308, 205, 9, 'E', 93.80),
(309, 206, 9, 'B', 78.10),

(310, 207, 10, 'D', 87.40),
(311, 201, 10, 'E', 89.90),
(312, 202, 10, 'D', 81.60),

(313, 203, 11, 'F', 92.30),
(314, 204, 11, 'D', 85.70),
(315, 205, 11, 'F', 79.20),

(316, 206, 12, 'E', 88.50),
(317, 207, 12, 'D', 83.10),
(318, 201, 12, 'E', 90.40),

(319, 202, 13, 'C', 77.80),
(320, 203, 13, 'F', 86.90),
(321, 204, 13, 'F', 94.20),

(322, 205, 14, 'D', 82.70),
(323, 206, 14, 'A', 89.10),
(324, 207, 14, 'F', 78.40),

(325, 201, 15, 'F', 85.60),
(326, 202, 15, 'D', 91.30),
(327, 203, 15, 'B', 83.90),

(328, 204, 16, 'A', 87.20),
(329, 205, 16, 'B', 79.50),
(330, 206, 16, 'D', 92.80),

(331, 207, 17, 'A', 84.10),
(332, 201, 17, 'B', 88.70),
(333, 202, 17, 'A', 76.90),

(334, 203, 18, 'A', 93.40),
(335, 204, 18, 'C', 85.80),
(336, 205, 18, 'E', 81.20),

(337, 206, 19, 'A', 89.50),
(338, 207, 19, 'C', 77.80),
(339, 201, 19, 'F', 94.10),

(340, 202, 20, 'B', 82.60),
(341, 203, 20, 'C', 88.30),
(342, 204, 20, 'C', 79.70),

(343, 205, 21, 'A', 91.40),
(344, 206, 21, 'F', 83.90),
(345, 207, 21, 'D', 86.20),

(346, 201, 22, 'F', 78.50),
(347, 202, 22, 'A', 92.70),
(348, 203, 22, 'F', 85.10),

(349, 204, 23, 'C', 89.80),
(350, 205, 23, 'A', 82.30),
(351, 206, 23, 'C', 94.50),

(352, 207, 24, 'D', 87.90),
(353, 201, 24, 'A', 79.20),
(354, 202, 24, 'D', 91.60),

(355, 203, 25, 'A', 84.70),
(356, 204, 25, 'E', 88.10),
(357, 205, 25, 'D', 76.40),

(358, 206, 26, 'E', 93.20),
(359, 207, 26, 'D', 85.50),
(360, 201, 26, 'A', 82.90),

(361, 202, 27, 'F', 89.40),
(362, 203, 27, 'B', 77.10),
(363, 204, 27, 'A', 94.80),

(364, 205, 28, 'F', 83.60),
(365, 206, 28, 'A', 88.90),
(366, 207, 28, 'E', 81.30),

(367, 201, 29, 'D', 92.70),
(368, 202, 29, 'B', 85.40),
(369, 203, 29, 'C', 79.80),

(370, 204, 30, 'D', 90.20);

/* Historial de insertar, modificar y editar la tabla de Inscripciones

CREATE TABLE AUDITORIA_INSCRIPCION (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50),
    accion VARCHAR(50),
    tabla_afectada VARCHAR(50),
    clave_primaria VARCHAR(100),
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //

CREATE TRIGGER audit_inscripcion_insertar
AFTER INSERT ON INSCRIPCION
FOR EACH ROW
BEGIN
  INSERT INTO AUDITORIA(usuario, accion, tabla_afectada, clave_primaria)
  VALUES (CURRENT_USER(), 'INSERT', 'INSCRIPCION', NEW.idInscripcion);
END//

CREATE TRIGGER audit_inscripcion_modificar
AFTER UPDATE ON INSCRIPCION
FOR EACH ROW
BEGIN
  INSERT INTO AUDITORIA(usuario, accion, tabla_afectada, clave_primaria)
  VALUES (CURRENT_USER(), 'UPDATE', 'INSCRIPCION', NEW.idInscripcion);
END//

CREATE TRIGGER audit_inscripcion_eliminar
AFTER DELETE ON INSCRIPCION
FOR EACH ROW
BEGIN
  INSERT INTO AUDITORIA(usuario, accion, tabla_afectada, clave_primaria)
  VALUES (CURRENT_USER(), 'DELETE', 'INSCRIPCION', OLD.idInscripcion);
END//

DELIMITER ;
*/
