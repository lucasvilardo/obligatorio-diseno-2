use master 
go

create database Diseño2
go

use Diseño2
go

USE master
go
 
CREATE LOGIN [IIS APPPOOL\DefaultAppPool] FROM WINDOWS   
go
 
 
USE Diseño2
go
 
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] 
go
 
exec sys.sp_addrolemember 'db_owner', [IIS APPPOOL\DefaultAppPool]
go

-- TABLAS --------------------------------------------

create table Usuario
(
	NomUsuario varchar(30) primary key check(LEN(NomUsuario) >= 8 ),
	Mail varchar(60) check(Mail like '_%@_%._%'),
	FechaNacimiento date not null check(FechaNacimiento < getdate()),
	NomCompleto varchar(30) not null,
	Contraseña varchar(8) check(LEN(Contraseña) = 8 and Contraseña like '%[a-zA-Z]%[a-zA-Z]%[a-zA-Z]%'
						and Contraseña like '%[0-9]%[0-9]%[0-9]%'
						and Contraseña like '%[^a-zA-Z0-9]%[^a-zA-Z0-9]%')
	
)

create table Categoria
(
	CodCat varchar(3) not null primary key check (CodCat like '[A-Za-z][A-Za-z][A-Za-z]'),
	NomCat varchar(30) not null 
)


create table Mensaje
(
	NumIdenti int primary key  identity (1,1),
	FyHEnvio datetime not null default(getdate()),
	Asunto varchar(80)  not null,
	Texto varchar(max) not null, 
	NomUsuario varchar(30) not null foreign key references Usuario(NomUsuario),
	FechaCaducidad datetime not null check(FechaCaducidad >= DATEADD(DAY, 1, GETDATE())),
	CodCat varchar(3) not null foreign key references Categoria(CodCat)
	
)


create table Recibe
(
	NomUsuario varchar(30) not null foreign key references Usuario(NomUsuario),
	NumIdenti int not null foreign key references Mensaje(NumIdenti),
	primary key (NomUsuario, NumIdenti)																						 
)																																															  
																					
----- DATOS DE PRUEBA ----------																												 

-----   USUARIOS   --------				
																					
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Juancito11', 'juancito11@gmail.com', '20020629', 'Juan Rodriguez', 'jua123&/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Roberto123', 'roberto123@gmail.com', '19981112', 'Roberto Sanchez', 'rob638"$')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Laura1998', 'laura98@gmail.com', '19980522', 'Laura Fernandez', 'lau456&%')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Tomasito1', 'tomas1@gmail.com', '19970314', 'Tomas Perez', 'tom123$!')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Valen2000', 'valen00@gmail.com', '20001230', 'Valentina Gomez', 'val789*@')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Luciano33', 'lucho33@gmail.com', '19960908', 'Luciano Lopez', 'luc369@#')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('MartinaA1', 'martina@gmail.com', '20010617', 'Martina Acosta', 'mar741!&')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('EmaRodri9', 'emarodri@gmail.com', '19991105', 'Emanuel Rodríguez', 'ema852#@')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Meli_1999', 'meli99@gmail.com', '19990222', 'Melina Ruiz', 'mel753&*')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Santi9999', 'santiz@gmail.com', '20000412', 'Santiago Diaz', 'san321$#')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Luana5678', 'luana@gmail.com', '19980810', 'Luana Torres', 'lua999&/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Gonza2023', 'gonza23@gmail.com', '19970131', 'Gonzalo Cabrera', 'gon147*%')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Carla2022', 'carla22@gmail.com', '20000727', 'Carla Morales', 'car888@&')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Nico_1987', 'nico87@gmail.com', '19870304', 'Nicolas Viera', 'nic321*/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Romi0000', 'romina@gmail.com', '19951030', 'Romina Silva', 'rom456&!')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Fede_1234', 'fede12@gmail.com', '19960615', 'Federico Nuñez', 'fed963#@')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Sofi1994', 'sofi94@gmail.com', '19940111', 'Sofia Castro', 'sof741!&')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Marce_88', 'marce88@gmail.com', '19881219', 'Marcelo Olivera', 'mar258*#')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Agus5555', 'agus55@gmail.com', '19930528', 'Agustina Ramos', 'agu963@!')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Leo33333', 'leo33@gmail.com', '19970409', 'Leonardo Vera', 'leo123#/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Flopi321', 'florpi@gmail.com', '19990907', 'Florencia Mendez', 'flo963*/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Mati9000', 'mati90@gmail.com', '19951126', 'Matias Lopez', 'mat852$#')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Naza0001', 'naza01@gmail.com', '20010814', 'Nazareno Techera', 'naz741@*')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Barby000', 'barby@gmail.com', '19981203', 'Barbara Lopez', 'bar369$@')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Ivan1992', 'ivan92@gmail.com', '19920218', 'Ivan Torres', 'iva654!@')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('JulioM88', 'julim@gmail.com', '19940923', 'Julieta Martinez', 'jul741&/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Cami7777', 'cami77@gmail.com', '19960606', 'Camila Suarez', 'cam963#@')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Pablo333', 'pablo33@gmail.com', '19970501', 'Pablo Herrera', 'pab852*/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Daniel01', 'danae@gmail.com', '19930303', 'Daniel Gonzalez', 'dan456&$')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Nahuelz7', 'nahuel@gmail.com', '19990129', 'Nahuel Zunino', 'nah321@#')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Belenita', 'belenita@gmail.com', '19981017', 'Belan Franco', 'bel654*/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('German55', 'german55@gmail.com', '19961225', 'German Medina', 'ger789$&')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Antonela', 'antonela@gmail.com', '19940704', 'Antonela Vazquez', 'ant741!#')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Franco22', 'franco22@gmail.com', '19950613', 'Franco Godoy', 'fra963@*')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Yesi0101', 'yesi@gmail.com', '19930424', 'Yesica Cabrera', 'yes321$&')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Kevin222', 'kevin22@gmail.com', '19970820', 'Kevin Pereira', 'kev741#/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Fiorella', 'fiorella@gmail.com', '19980515', 'Fiorella Diaz', 'fio258@!')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Thiago89', 'thiago89@gmail.com', '19961118', 'Thiago Moreira', 'thi963&/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Andrea90', 'andrea90@gmail.com', '19900919', 'Andrea Rivas', 'and147$#')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Ezequiel', 'ezequiel@gmail.com', '19940202', 'Ezequiel Soto', 'eze888&@')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Anahi001', 'anahi@gmail.com', '19921201', 'Anahi González', 'ana123*/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Maxi_001', 'maxi@gmail.com', '19950707', 'Maximiliano Diaz', 'max789$&')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Malena32', 'malena@gmail.com', '19980105', 'Malena Castro', 'mal963@!')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Bruno111', 'bruno@gmail.com', '19971010', 'Bruno Gonzalez', 'bru321#*')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Aldana77', 'aldana@gmail.com', '19960312', 'Aldana López', 'ald654&/')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Julian22', 'julian22@gmail.com', '19950808', 'Julian Rodriguez', 'jul951!@')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Claudia8', 'claudia@gmail.com', '19910430', 'Claudia Sanchez', 'cla852*#')														
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Ramiro33', 'ramiro33@gmail.com', '19990621', 'Ramiro Medina', 'ram963$/')	
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('LuciaL88', 'lucial@gmail.com', '19940915', 'Lucia Lopez', 'luc789@*')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Seba_199', 'seba199@gmail.com', '19931009', 'Sebastian Suarez', 'seb741$!')
insert Usuario(NomUsuario, Mail, FechaNacimiento, NomCompleto, Contraseña) values('Lucas2001', 'lucas2001@gmail.com', '19931009', 'Lucas Vilardo', 'luc123?¿')



-----------  CATEGORIAS  -------------------------						 

insert Categoria(CodCat, NomCat) values('INF', 'Informativo')
insert Categoria(CodCat, NomCat) values('URG', 'Urgente')
insert Categoria(CodCat, NomCat) values('EDU', 'Educativo')
insert Categoria(CodCat, NomCat) values('ENT', 'Entretenimiento')
insert Categoria(CodCat, NomCat) values('PUB', 'Publicitario')
insert Categoria(CodCat, NomCat) values('SAL', 'Salud')
insert Categoria(CodCat, NomCat) values('DEP', 'Deportes')
insert Categoria(CodCat, NomCat) values('FIN', 'Finanzas')
insert Categoria(CodCat, NomCat) values('TEC', 'Tecnología')
insert Categoria(CodCat, NomCat) values('OTR', 'Otros')


INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Reunión urgente', 'Tenemos que hablar cuanto antes.', 'Laura1998', 'URG', DATEADD(DAY, 34, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Cambio de horario', 'El horario del encuentro fue modificado.', 'Tomasito1', 'INF', DATEADD(DAY, 65, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Documentos pendientes', 'No olvides enviar los documentos.', 'Valen2000', 'FIN', DATEADD(DAY, 23, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Fiesta sorpresa', 'Es una fiesta sorpresa, no digas nada.', 'Luciano33', 'ENT', DATEADD(DAY, 32, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Consulta médica', 'Necesito agendar una consulta para mañana.', 'MartinaA1', 'SAL', DATEADD(DAY, 12, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Entrega final', 'La entrega está prevista para el viernes.', 'EmaRodri9', 'EDU', DATEADD(DAY, 23, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Nos vemos hoy', '¿Confirmamos para esta tarde?', 'Meli_1999', 'OTR', DATEADD(DAY, 5, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Reunión de equipo', 'Debemos coordinar reunión con todo el equipo.', 'Santi9999', 'INF', DATEADD(DAY, 23, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Vacaciones', 'Ya tengo todo listo para las vacaciones.', 'Luana5678', 'ENT', DATEADD(DAY, 5, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Nuevo proyecto', 'Quiero hablarte de una nuevo proyecto.', 'Gonza2023', 'TEC', DATEADD(DAY, 23, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Ayuda urgente', 'Necesito tu ayuda con un trabajo.', 'Carla2022', 'URG', DATEADD(DAY, 34, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Lista de compras', 'Te paso la lista para mañana.', 'Nico_1987', 'OTR', DATEADD(DAY, 5, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Tarea compartida', 'Te asignaron la misma parte que a mí.', 'Romi0000', 'EDU', DATEADD(DAY, 4, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Reclamo pendiente', 'Todavía no me respondieron el reclamo.', 'Fede_1234', 'INF', DATEADD(DAY, 31, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Reunión cancelada', 'Se suspendió la reunión de hoy.', 'Sofi1994', 'INF', DATEADD(DAY, 32, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Presupuesto aprobado', 'Confirmaron el presupuesto enviado.', 'Marce_88', 'FIN', DATEADD(DAY, 31, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Sorpresa', 'Te tengo una sorpresa para el sábado.', 'Agus5555', 'ENT', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Informe final', 'Ya terminé el informe, revisalo.', 'Leo33333', 'EDU', DATEADD(DAY, 33, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Dudas sobre la clase', 'No entendí el último tema.', 'Flopi321', 'EDU', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Viaje confirmado', 'Tenemos pasajes para el 10.', 'Mati9000', 'OTR', DATEADD(DAY, 33, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Recordatorio', 'No olvides la reunión de mañana.', 'Naza0001', 'INF', DATEADD(DAY, 33, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Entrega postergada', 'La fecha de entrega cambió.', 'Barby000', 'EDU', DATEADD(DAY, 73, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Invitación', 'Estás invitado a la reunión anual.', 'Ivan1992', 'ENT', DATEADD(DAY, 33, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Cumpleaños', 'Te esperamos para festejar el viernes.', 'JulioM88', 'ENT', DATEADD(DAY, 53, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Material de estudio', 'Ya subieron los apuntes al sistema.', 'Cami7777', 'EDU', DATEADD(DAY, 63, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Compra online', 'El paquete llegó esta mañana.', 'Pablo333', 'PUB', DATEADD(DAY, 33, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Actividad extracurricular', '¿Te anotaste a la actividad?', 'Daniel01', 'EDU', DATEADD(DAY, 3, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Nuevo número', 'Cambié el número, anotá el nuevo.', 'Nahuelz7', 'OTR', DATEADD(DAY, 32, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Organización del evento', 'Necesito ayuda para organizar.', 'Belenita', 'ENT', DATEADD(DAY, 39, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Inscripción confirmada', 'Quedaste anotado correctamente.', 'German55', 'EDU', DATEADD(DAY, 37, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Aprobación pendiente', 'Falta una firma para aprobarlo.', 'Antonela', 'INF', DATEADD(DAY, 35, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Pedido realizado', 'El pedido fue enviado hoy.', 'Franco22', 'FIN', DATEADD(DAY, 32, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Turno médico', 'Te agendé para el lunes a las 10.', 'Yesi0101', 'SAL', DATEADD(DAY, 33, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Capacitación', 'Hay una capacitación el jueves.', 'Seba_199', 'EDU', DATEADD(DAY, 38, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Devolución', 'El producto no funcionó como esperaba.', 'LuciaL88', 'FIN', DATEADD(DAY, 36, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Invitación evento', 'Tenés tu entrada confirmada.', 'Ramiro33', 'ENT', DATEADD(DAY, 34, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Reserva hecha', 'La reserva del lugar está hecha.', 'Claudia8', 'OTR', DATEADD(DAY, 32, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Tarea para mañana', 'Mandaron tarea de lectura.', 'Julian22', 'EDU', DATEADD(DAY, 36, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Resultado examen', 'Ya están las notas del parcial.', 'Aldana77', 'EDU', DATEADD(DAY, 36, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Cambio de tema', 'El trabajo es sobre otro tema.', 'Bruno111', 'EDU', DATEADD(DAY, 31, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Actualización del sistema', 'Se actualiza mañana a las 22:00.', 'Malena32', 'TEC', DATEADD(DAY, 32, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Problema técnico', 'Se cayó la red otra vez.', 'Maxi_001', 'TEC', DATEADD(DAY, 43, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Recordatorio médico', 'Te toca análisis este viernes.', 'Anahi001', 'SAL', DATEADD(DAY, 23, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Claves de acceso', 'Te paso las claves por privado.', 'Ezequiel', 'INF', DATEADD(DAY, 13, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Formulario faltante', 'Falta enviar el formulario.', 'Andrea90', 'INF', DATEADD(DAY, 23, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Borrador listo', 'Tengo el borrador del proyecto.', 'Thiago89', 'EDU', DATEADD(DAY, 23, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Clase suspendida', 'No hay clase este jueves.', 'Fiorella', 'EDU', DATEADD(DAY, 53, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Falta corregir', 'Hay errores en la sección 3.', 'Kevin222', 'EDU', DATEADD(DAY, 43, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Redacción final', 'Revisé la redacción completa.', 'Juancito11', 'EDU', DATEADD(DAY, 33, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Cumpleaños finde', 'El sábado voy a festejar mi cumpleaños.', 'Roberto123', 'ENT', DATEADD(DAY, 23, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Video demostrativo', 'Gracias por ver el video demostrativo.', 'Juancito11', 'TEC', DATEADD(DAY, 13, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Deberes escolares', 'Debemos entregar los deberes la proxima semana.', 'Roberto123', 'EDU', DATEADD(DAY, 23, GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Partido el sabado','El sabado tendremos un partido a las 9 de la noche.','Laura1998','DEP',DATEADD(DAY, 43,GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Cancelamos actividad','La actividad del martes queda suspendida, gracias.','Tomasito1','INF',DATEADD(DAY, 33,GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('No hay cupos','Buenas, no tenemos mas cupos disponibles para el evento de mañana.','Valen2000','INF',DATEADD(DAY, 23,GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Ofertas','Tenemos electrodomesticos a 40% de descuento.','Luciano33','PUB',DATEADD(DAY, 13,GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Festival de lectura','El miercoles tendremos un festival de lectura a las 12:00.','MartinaA1','EDU',DATEADD(DAY, 23,GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Panaderia Panes','Buenas, hay stock de bizcochos para el domingo?','EmaRodri9','OTR',DATEADD(DAY, 23,GETDATE()))
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Nuevo producto','Queremos anunciar la llegada de un nuevo producto','Meli_1999','PUB',DATEADD(DAY, 3,GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Fin de ciclo','El domingo será el fin del ciclo productivo.','Santi9999','INF',DATEADD(DAY, 32,GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Tarea pendiente', 'Esto es confidencial.', 'Tomasito1', 'INF', DATEADD(DAY, 33, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Reunión importante', 'No olvides completar el formulario.', 'Naza0001', 'INF', DATEADD(DAY, 31, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Nuevo desafío', 'Confirmá si te sirve ese horario.', 'Nahuelz7', 'OTR', DATEADD(DAY, 32, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Sugerencia del día', 'Revisá el documento adjunto.', 'Kevin222', 'EDU', DATEADD(DAY, 35, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Informe semanal', 'Acordate de enviar el reporte.', 'Anahi001', 'EDU', DATEADD(DAY, 34, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Consulta rápida', 'Gracias por tu ayuda.', 'Claudia8', 'INF', DATEADD(DAY, 33, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Evento confirmado', 'Podemos reunirnos mañana.', 'Ramiro33', 'ENT', DATEADD(DAY, 32, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Actualización urgente', 'Revisá el sistema hoy.', 'Romi0000', 'TEC', DATEADD(DAY, 31, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Tarea nueva asignada', 'Leé el mensaje anterior.', 'Luana5678', 'EDU', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Pendiente de revisión', 'Esperamos tus comentarios.', 'Nico_1987', 'INF', DATEADD(DAY, 13, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Recordatorio de reunión', 'No te olvides del evento.', 'Santi9999', 'INF', DATEADD(DAY, 13, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Informe técnico', 'Revisá los cambios implementados.', 'Luana5678', 'TEC', DATEADD(DAY, 43, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Invitación formal', 'Estás invitado al evento anual.', 'Valen2000', 'ENT', DATEADD(DAY, 33, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Revisión de código', 'El código ya está en GitHub.', 'Roberto123', 'TEC', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Reunión interna', 'Hablamos en sala 2 a las 14hs.', 'Maxi_001', 'INF', DATEADD(DAY, 13, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Tarea prioritaria', 'Este ítem debe estar hoy.', 'Seba_199', 'EDU', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Presentación final', 'Subí la versión corregida.', 'Ramiro33', 'EDU', DATEADD(DAY, 13, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Pendiente de enviar', 'Falta agregar el adjunto.', 'JulioM88', 'INF', DATEADD(DAY, 3, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Resultado del test', 'Felicitaciones, aprobado.', 'Leo33333', 'EDU', DATEADD(DAY, 33, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Corrección requerida', 'Hay errores en el documento.', 'Marce_88', 'EDU', DATEADD(DAY, 32, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Notificación del sistema', 'Actualización completada.', 'Nico_1987', 'TEC', DATEADD(DAY, 31, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Cambios en el cronograma', 'Nueva fecha: 5 de agosto.', 'Aldana77', 'INF', DATEADD(DAY, 43, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Recordatorio urgente', 'No se recibió respuesta aún.', 'Claudia8', 'URG', DATEADD(DAY, 13, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Resumen del día', 'Gran trabajo hoy equipo.', 'Ramiro33', 'INF', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Agenda compartida', 'Se adjunta el PDF.', 'Barby000', 'INF', DATEADD(DAY, 13, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Análisis completo', 'Todo está documentado.', 'Anahi001', 'EDU', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Solicitud de soporte', 'El sistema no arranca.', 'German55', 'TEC', DATEADD(DAY, 33, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Revisión contable', 'Faltan archivos en la carpeta.', 'Barby000', 'FIN', DATEADD(DAY, 13, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Entrega pendiente', '¿Se puede extender el plazo?', 'Marce_88', 'EDU', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Validación de datos', 'Verificá la columna D.', 'Santi9999', 'INF', DATEADD(DAY, 3, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Invitación a evento', 'Confirmá tu asistencia.', 'Flopi321', 'ENT', DATEADD(DAY, 33, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Error detectado', 'Ya se notificó al equipo.', 'Nahuelz7', 'TEC', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Avance del proyecto', 'Faltan 3 tareas por cerrar.', 'Daniel01', 'EDU', DATEADD(DAY, 13, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Modificación del diseño', 'Nuevo mockup adjunto.', 'Thiago89', 'TEC', DATEADD(DAY, 34, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Mensaje de bienvenida', 'Gracias por sumarte.', 'Andrea90', 'OTR', DATEADD(DAY, 19, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Nuevo documento', 'Revisalo antes del viernes.', 'Sofi1994', 'INF', DATEADD(DAY, 8, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Pendiente de validación', 'Aguardamos tu respuesta.', 'Santi9999', 'INF', DATEADD(DAY, 54, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Próxima reunión', 'Lunes a las 9hs.', 'EmaRodri9', 'INF', DATEADD(DAY, 32, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Informe de resultados', 'Todo está dentro del rango.', 'Kevin222', 'EDU', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Capacitación interna', 'Traer notebook cargada.', 'Andrea90', 'EDU', DATEADD(DAY, 34, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Feedback recibido', 'Muy buen desempeño.', 'Anahi001', 'EDU', DATEADD(DAY, 5, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Próxima tarea', 'Automatizar carga de datos.', 'Claudia8', 'TEC', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Mail reenviado', 'Verificá el hilo anterior.', 'Antonela', 'INF', DATEADD(DAY, 34, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Actualización de agenda', 'Reunión pospuesta a jueves.', 'Seba_199', 'INF', DATEADD(DAY, 65, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Cambios de último momento', 'Ver punto 3 del mail anterior.', 'Anahi001', 'INF', DATEADD(DAY, 11, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Tarea duplicada', 'Se eliminó una versión.', 'Sofi1994', 'EDU', DATEADD(DAY, 12, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Validación positiva', 'Todo en orden.', 'Fede_1234', 'INF', DATEADD(DAY, 22, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Llamado pendiente', 'Intentamos contactarte.', 'Romi0000', 'INF', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Planificación semanal', 'Armá el cronograma.', 'Nico_1987', 'INF', DATEADD(DAY, 7, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Modificación urgente', 'Se cambió la fecha límite.', 'Franco22', 'URG', DATEADD(DAY, 12, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Error subsanado', 'Ya se resolvió.', 'Thiago89', 'TEC', DATEADD(DAY, 3, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Prueba finalizada', 'Esperando revisión.', 'German55', 'EDU', DATEADD(DAY, 3, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Inscripción abierta', 'Cierra el viernes.', 'Leo33333', 'EDU', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Documento actualizado', 'Ver revisiones en la última hoja.', 'Marce_88', 'INF', DATEADD(DAY, 8, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Presentación subida', 'Ya está en la nube.', 'Belenita', 'EDU', DATEADD(DAY, 8, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Lista de tareas', 'Asignadas por prioridad.', 'Antonela', 'INF', DATEADD(DAY, 5, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Resultado parcial', 'Aprobado con observaciones.', 'Fiorella', 'EDU', DATEADD(DAY, 12, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Borrador inicial', 'Para revisar en grupo.', 'Aldana77', 'EDU', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Cambio de horario', 'Ahora es a las 15hs.', 'Ramiro33', 'INF', DATEADD(DAY, 43, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Versión final', 'Marcada como entregada.', 'Juancito11', 'EDU', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Error crítico', 'Se requiere intervención.', 'Roberto123', 'TEC', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Confirmación recibida', 'Gracias por responder.', 'Nico_1987', 'INF', DATEADD(DAY, 4, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Tarea nueva', 'Requiere testing.', 'Flopi321', 'TEC', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Pendiente de firma', 'Aguardando aprobación.', 'Naza0001', 'INF', DATEADD(DAY, 2, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Registro de asistencia', 'Completado correctamente.', 'Mati9000', 'OTR', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Aprobación en curso', 'Faltan dos firmas.', 'German55', 'INF', DATEADD(DAY, 34,GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Archivo dañado', 'No se puede abrir.', 'Franco22', 'TEC', DATEADD(DAY, 45, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Reporte mensual', 'Se entregará mañana.', 'Yesi0101', 'INF', DATEADD(DAY, 34, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Nuevo acceso', 'Ya podés ingresar al sistema.', 'Maxi_001', 'TEC', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Evento cancelado', 'Motivos técnicos.', 'Malena32', 'INF', DATEADD(DAY, 54, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Solicitud enviada', 'Confirmar recepción.', 'Bruno111', 'INF', DATEADD(DAY, 13, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Mensaje automático', 'No responder a este correo.', 'Carla2022', 'INF', DATEADD(DAY, 3, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Entrega finalizada', 'Buen trabajo.', 'Ezequiel', 'EDU', DATEADD(DAY, 5, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Agenda mensual', 'Enviada al grupo.', 'Andrea90', 'INF', DATEADD(DAY, 31, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Pendiente de análisis', 'Ver archivo adjunto.', 'Antonela', 'INF', DATEADD(DAY, 12, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Recordatorio general', 'Hoy es la fecha límite.', 'Naza0001', 'INF', DATEADD(DAY, 46, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Reunión reprogramada', 'Nuevo día: martes.', 'Nahuelz7', 'INF', DATEADD(DAY, 12, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Backup realizado', 'Almacenado en servidor X.', 'Leo33333', 'TEC', DATEADD(DAY, 23, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Resolución del problema', 'Revisá la bitácora.', 'Gonza2023', 'TEC', DATEADD(DAY, 45, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Actualización automática', 'No requiere acción.', 'Romi0000', 'TEC', DATEADD(DAY, 6, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Confirmación de tarea', 'Se asignó correctamente.', 'Nico_1987', 'INF', DATEADD(DAY, 5, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Desvinculación de cuenta', 'Se completó el proceso.', 'MartinaA1', 'INF', DATEADD(DAY, 13, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Invitación interna', 'Confirmá antes del viernes.', 'Valen2000', 'ENT', DATEADD(DAY, 54, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Errores en el script', 'Revisá la línea 34.', 'Flopi321', 'TEC', DATEADD(DAY, 8, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Estado actualizado', 'Todo en verde.', 'Maxi_001', 'INF', DATEADD(DAY, 6, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Consulta técnica', '¿Qué versión estás usando?', 'Malena32', 'TEC', DATEADD(DAY, 5, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Redacción corregida', 'Adjunto el nuevo borrador.', 'Aldana77', 'EDU', DATEADD(DAY, 2, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Tarea extendida', 'Nueva fecha: lunes.', 'Julian22', 'EDU', DATEADD(DAY, 12, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Usuario bloqueado', 'Solicitar reactivación.', 'Claudia8', 'INF', DATEADD(DAY, 12, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Satisfacción del cliente', 'Feedback positivo.', 'Ramiro33', 'FIN', DATEADD(DAY, 24, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Implementación final', 'Desplegada en producción.', 'LuciaL88', 'TEC', DATEADD(DAY, 4, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Pruebas completadas', 'Todo correcto.', 'Barby000', 'TEC', DATEADD(DAY, 9, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Documento duplicado', 'Eliminar uno.', 'Flopi321', 'TEC', DATEADD(DAY, 5, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Checklist completo', 'Bien hecho.', 'Agus5555', 'OTR', DATEADD(DAY, 3, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Anuncio interno', 'Ver comunicado oficial.', 'Carla2022', 'INF', DATEADD(DAY, 4, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Tarea finalizada', 'Marcada como completada.', 'Meli_1999', 'EDU', DATEADD(DAY, 7, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Solicitud de ayuda', '¿Podés revisar el error?', 'Romi0000', 'INF', DATEADD(DAY, 2, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Actualización menor', 'Versión 1.0.3 subida.', 'Thiago89', 'TEC', DATEADD(DAY, 12, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Próxima entrega', 'Miércoles a las 10hs.', 'Anahi001', 'EDU', DATEADD(DAY, 7, GETDATE()));
INSERT Mensaje(Asunto, Texto, NomUsuario, CodCat, FechaCaducidad)
VALUES('Sugerencia enviada', 'Revisá el formulario.', 'Aldana77', 'EDU', DATEADD(DAY, 5, GETDATE()));


																		





----------- TABLA DE RECIBEN -----------------------

insert Recibe(NumIdenti, NomUsuario) values(1, 'Carla2022')
insert Recibe(NumIdenti, NomUsuario) values(2, 'Juancito11')
insert Recibe(NumIdenti, NomUsuario) values(3, 'Luciano33')
insert Recibe(NumIdenti, NomUsuario) values(4, 'Marce_88')
insert Recibe(NumIdenti, NomUsuario) values(5, 'Barby000')
insert Recibe(NumIdenti, NomUsuario) values(6, 'Aldana77')
insert Recibe(NumIdenti, NomUsuario) values(7, 'Pablo333')
insert Recibe(NumIdenti, NomUsuario) values(8, 'Seba_199')
insert Recibe(NumIdenti, NomUsuario) values(9, 'Santi9999')
insert Recibe(NumIdenti, NomUsuario) values(10, 'Valen2000')
insert Recibe(NumIdenti, NomUsuario) values(11, 'Roberto123')
insert Recibe(NumIdenti, NomUsuario) values(12, 'Antonela')
insert Recibe(NumIdenti, NomUsuario) values(13, 'Aldana77')
insert Recibe(NumIdenti, NomUsuario) values(14, 'Barby000')
insert Recibe(NumIdenti, NomUsuario) values(15, 'Cami7777')
insert Recibe(NumIdenti, NomUsuario) values(16, 'Agus5555')
insert Recibe(NumIdenti, NomUsuario) values(17, 'Yesi0101')
insert Recibe(NumIdenti, NomUsuario) values(18, 'Valen2000')
insert Recibe(NumIdenti, NomUsuario) values(19, 'Franco22')
insert Recibe(NumIdenti, NomUsuario) values(20, 'Laura1998')
insert Recibe(NumIdenti, NomUsuario) values(21, 'Leo33333')
insert Recibe(NumIdenti, NomUsuario) values(22, 'Franco22')
insert Recibe(NumIdenti, NomUsuario) values(23, 'Flopi321')
insert Recibe(NumIdenti, NomUsuario) values(24, 'Fiorella')
insert Recibe(NumIdenti, NomUsuario) values(25, 'Carla2022')
insert Recibe(NumIdenti, NomUsuario) values(26, 'Daniel01')
insert Recibe(NumIdenti, NomUsuario) values(27, 'Belenita')
insert Recibe(NumIdenti, NomUsuario) values(28, 'Bruno111')
insert Recibe(NumIdenti, NomUsuario) values(29, 'Cami7777')
insert Recibe(NumIdenti, NomUsuario) values(30, 'Aldana77')
insert Recibe(NumIdenti, NomUsuario) values(31, 'Laura1998')
insert Recibe(NumIdenti, NomUsuario) values(32, 'Luciano33')
insert Recibe(NumIdenti, NomUsuario) values(33, 'Mati9000')
insert Recibe(NumIdenti, NomUsuario) values(34, 'Romi0000')
insert Recibe(NumIdenti, NomUsuario) values(35, 'Leo33333')
insert Recibe(NumIdenti, NomUsuario) values(36, 'Cami7777')
insert Recibe(NumIdenti, NomUsuario) values(37, 'Andrea90')
insert Recibe(NumIdenti, NomUsuario) values(38, 'Aldana77')
insert Recibe(NumIdenti, NomUsuario) values(39, 'Yesi0101')
insert Recibe(NumIdenti, NomUsuario) values(40, 'Gonza2023')
insert Recibe(NumIdenti, NomUsuario) values(41, 'Luana5678')
insert Recibe(NumIdenti, NomUsuario) values(42, 'Malena32')
insert Recibe(NumIdenti, NomUsuario) values(43, 'Meli_1999')
insert Recibe(NumIdenti, NomUsuario) values(44, 'Malena32')
insert Recibe(NumIdenti, NomUsuario) values(45, 'MartinaA1')
insert Recibe(NumIdenti, NomUsuario) values(46, 'Malena32')
insert Recibe(NumIdenti, NomUsuario) values(47, 'Ezequiel')
insert Recibe(NumIdenti, NomUsuario) values(48, 'EmaRodri9')
insert Recibe(NumIdenti, NomUsuario) values(49, 'Bruno111')
insert Recibe(NumIdenti, NomUsuario) values(50, 'Meli_1999')
insert Recibe(NumIdenti, NomUsuario) values(51, 'Maxi_001')
insert Recibe(NumIdenti, NomUsuario) values(52, 'Naza0001')
insert Recibe(NumIdenti, NomUsuario) values(53, 'Nico_1987')
insert Recibe(NumIdenti, NomUsuario) values(54, 'Ramiro33')
insert Recibe(NumIdenti, NomUsuario) values(55, 'Seba_199')
insert Recibe(NumIdenti, NomUsuario) values(56, 'Sofi1994')
insert Recibe(NumIdenti, NomUsuario) values(57, 'Thiago89')
insert Recibe(NumIdenti, NomUsuario) values(58, 'Nahuelz7')
insert Recibe(NumIdenti, NomUsuario) values(59, 'Claudia8')
insert Recibe(NumIdenti, NomUsuario) values(60, 'German55')
insert Recibe(NumIdenti, NomUsuario) values(61, 'Luciano33')
insert Recibe(NumIdenti, NomUsuario) values(62, 'Gonza2023')
insert Recibe(NumIdenti, NomUsuario) values(63, 'Cami7777')
insert Recibe(NumIdenti, NomUsuario) values(64, 'EmaRodri9')
insert Recibe(NumIdenti, NomUsuario) values(65, 'Anahi001')
insert Recibe(NumIdenti, NomUsuario) values(66, 'Aldana77')
insert Recibe(NumIdenti, NomUsuario) values(67, 'Cami7777')
insert Recibe(NumIdenti, NomUsuario) values(68, 'Ezequiel')
insert Recibe(NumIdenti, NomUsuario) values(69, 'Ivan1992')
insert Recibe(NumIdenti, NomUsuario) values(70, 'Juancito11')
insert Recibe(NumIdenti, NomUsuario) values(71, 'MartinaA1')
insert Recibe(NumIdenti, NomUsuario) values(72, 'Mati9000')
insert Recibe(NumIdenti, NomUsuario) values(73, 'Nico_1987')
insert Recibe(NumIdenti, NomUsuario) values(74, 'Santi9999')
insert Recibe(NumIdenti, NomUsuario) values(75, 'Thiago89')
insert Recibe(NumIdenti, NomUsuario) values(76, 'Valen2000')
insert Recibe(NumIdenti, NomUsuario) values(77, 'Ezequiel')
insert Recibe(NumIdenti, NomUsuario) values(78, 'Franco22')
insert Recibe(NumIdenti, NomUsuario) values(79, 'Belenita')
insert Recibe(NumIdenti, NomUsuario) values(80, 'Ezequiel')
insert Recibe(NumIdenti, NomUsuario) values(81, 'Barby000')
insert Recibe(NumIdenti, NomUsuario) values(82, 'Bruno111')
insert Recibe(NumIdenti, NomUsuario) values(83, 'Agus5555')
insert Recibe(NumIdenti, NomUsuario) values(84, 'Andrea90')
insert Recibe(NumIdenti, NomUsuario) values(85, 'Fede_1234')
insert Recibe(NumIdenti, NomUsuario) values(86, 'Carla2022')
insert Recibe(NumIdenti, NomUsuario) values(87, 'Malena32')
insert Recibe(NumIdenti, NomUsuario) values(88, 'MartinaA1')
insert Recibe(NumIdenti, NomUsuario) values(89, 'Meli_1999')
insert Recibe(NumIdenti, NomUsuario) values(90, 'Santi9999')
insert Recibe(NumIdenti, NomUsuario) values(91, 'Sofi1994')
insert Recibe(NumIdenti, NomUsuario) values(92, 'Roberto123')
insert Recibe(NumIdenti, NomUsuario) values(93, 'Laura1998')
insert Recibe(NumIdenti, NomUsuario) values(94, 'LuciaL88')
insert Recibe(NumIdenti, NomUsuario) values(95, 'Maxi_001')
insert Recibe(NumIdenti, NomUsuario) values(96, 'Yesi0101')
insert Recibe(NumIdenti, NomUsuario) values(97, 'Juancito11')
insert Recibe(NumIdenti, NomUsuario) values(98, 'EmaRodri9')
insert Recibe(NumIdenti, NomUsuario) values(99, 'Belenita')
insert Recibe(NumIdenti, NomUsuario) values(100, 'Carla2022')
insert Recibe(NumIdenti, NomUsuario) values(101, 'Fede_1234'),
										   (101, 'Juancito11')
insert Recibe(NumIdenti, NomUsuario) values(102, 'LuciaL88'),
										   (102, 'Pablo333')
insert Recibe(NumIdenti, NomUsuario) values(103, 'Julian22'),
										   (103, 'Gonza2023')
insert Recibe(NumIdenti, NomUsuario) values(104, 'MartinaA1'),
										   (104, 'Fede_1234')
insert Recibe(NumIdenti, NomUsuario) values(105, 'Belenita'),
										   (105, 'Carla2022')
insert Recibe(NumIdenti, NomUsuario) values(106, 'Anahi001'),
										   (106, 'Cami7777')
insert Recibe(NumIdenti, NomUsuario) values(107, 'Barby000'),
										   (107, 'Franco22')
insert Recibe(NumIdenti, NomUsuario) values(108, 'Belenita'),
										   (108, 'Laura1998')
insert Recibe(NumIdenti, NomUsuario) values(109, 'Agus5555'),
										   (109, 'Ramiro33')
insert Recibe(NumIdenti, NomUsuario) values(110, 'Aldana77'),
										   (110, 'Santi9999')
insert Recibe(NumIdenti, NomUsuario) values(111, 'Barby000'),
										   (111, 'Tomasito1')
insert Recibe(NumIdenti, NomUsuario) values(112, 'Claudia8'),
										   (112, 'Valen2000')
insert Recibe(NumIdenti, NomUsuario) values(113, 'LuciaL88'),
										   (113, 'Yesi0101')
insert Recibe(NumIdenti, NomUsuario) values(114, 'MartinaA1'),
										   (114, 'Roberto123')
insert Recibe(NumIdenti, NomUsuario) values(115, 'Naza0001'),
										   (115, 'Luana5678')
insert Recibe(NumIdenti, NomUsuario) values(116, 'JulioM88'),
										   (116, 'Luana5678')
insert Recibe(NumIdenti, NomUsuario) values(117, 'Nico_1987'),
										   (117, 'Fede_1234')
insert Recibe(NumIdenti, NomUsuario) values(118, 'Leo33333'),
										   (118, 'Bruno111')
insert Recibe(NumIdenti, NomUsuario) values(119, 'Maxi_001'),
										   (119, 'Agus5555')
insert Recibe(NumIdenti, NomUsuario) values(120, 'Juancito11'),
										   (120, 'Barby000')
insert Recibe(NomUsuario, NumIdenti) values('Flopi321', 121)
insert Recibe(NomUsuario, NumIdenti) values('Fiorella', 121)
insert Recibe(NomUsuario, NumIdenti) values('Kevin222', 121)
insert Recibe(NomUsuario, NumIdenti) values('Franco22', 122)
insert Recibe(NomUsuario, NumIdenti) values('Ezequiel', 122)
insert Recibe(NomUsuario, NumIdenti) values('Bruno111', 122)
insert Recibe(NomUsuario, NumIdenti) values('Agus5555', 123)
insert Recibe(NomUsuario, NumIdenti) values('Cami7777', 123)
insert Recibe(NomUsuario, NumIdenti) values('Andrea90', 123)
insert Recibe(NomUsuario, NumIdenti) values('Nico_1987', 124)
insert Recibe(NomUsuario, NumIdenti) values('Santi9999', 124)
insert Recibe(NomUsuario, NumIdenti) values('Juancito11', 124)
insert Recibe(NomUsuario, NumIdenti) values('Nahuelz7', 125)
insert Recibe(NomUsuario, NumIdenti) values('Valen2000', 125)
insert Recibe(NomUsuario, NumIdenti) values('Santi9999', 125)
insert Recibe(NomUsuario, NumIdenti) values('Yesi0101', 126)
insert Recibe(NomUsuario, NumIdenti) values('Seba_199', 126)
insert Recibe(NomUsuario, NumIdenti) values('Roberto123', 126)
insert Recibe(NomUsuario, NumIdenti) values('Pablo333', 127)
insert Recibe(NomUsuario, NumIdenti) values('Yesi0101', 127)
insert Recibe(NomUsuario, NumIdenti) values('EmaRodri9', 127)
insert Recibe(NomUsuario, NumIdenti) values('Gonza2023', 128)
insert Recibe(NomUsuario, NumIdenti) values('EmaRodri9', 128)
insert Recibe(NomUsuario, NumIdenti) values('Fede_1234', 128)
insert Recibe(NomUsuario, NumIdenti) values('Gonza2023', 129)
insert Recibe(NomUsuario, NumIdenti) values('Bruno111', 129)
insert Recibe(NomUsuario, NumIdenti) values('Antonela', 129)
insert Recibe(NomUsuario, NumIdenti) values('Franco22', 130)
insert Recibe(NomUsuario, NumIdenti) values('Luana5678', 130)
insert Recibe(NomUsuario, NumIdenti) values('Malena32', 130)
insert Recibe(NomUsuario, NumIdenti) values('Nico_1987', 131)
insert Recibe(NomUsuario, NumIdenti) values('Roberto123', 131)
insert Recibe(NomUsuario, NumIdenti) values('Seba_199', 131)
insert Recibe(NomUsuario, NumIdenti) values('Thiago89', 132)
insert Recibe(NomUsuario, NumIdenti) values('Valen2000', 132)
insert Recibe(NomUsuario, NumIdenti) values('Yesi0101', 132)
insert Recibe(NomUsuario, NumIdenti) values('LuciaL88', 133)
insert Recibe(NomUsuario, NumIdenti) values('JulioM88', 133)
insert Recibe(NomUsuario, NumIdenti) values('Gonza2023', 133)
insert Recibe(NomUsuario, NumIdenti) values('Ezequiel', 134)
insert Recibe(NomUsuario, NumIdenti) values('Cami7777', 134)
insert Recibe(NomUsuario, NumIdenti) values('Barby000', 134)
insert Recibe(NomUsuario, NumIdenti) values('Mati9000', 135)
insert Recibe(NomUsuario, NumIdenti) values('JulioM88', 135)
insert Recibe(NomUsuario, NumIdenti) values('Leo33333', 135)
insert Recibe(NomUsuario, NumIdenti) values('Tomasito1', 136)
insert Recibe(NomUsuario, NumIdenti) values('Malena32', 136)
insert Recibe(NomUsuario, NumIdenti) values('Mati9000', 136)
insert Recibe(NomUsuario, NumIdenti) values('Franco22', 137)
insert Recibe(NomUsuario, NumIdenti) values('Juancito11', 137)
insert Recibe(NomUsuario, NumIdenti) values('Carla2022', 137)
insert Recibe(NomUsuario, NumIdenti) values('Ezequiel', 138)
insert Recibe(NomUsuario, NumIdenti) values('Cami7777', 138)
insert Recibe(NomUsuario, NumIdenti) values('Antonela', 138)
insert Recibe(NomUsuario, NumIdenti) values('Franco22', 139)
insert Recibe(NomUsuario, NumIdenti) values('Luciano33', 139)
insert Recibe(NomUsuario, NumIdenti) values('Ramiro33', 139)
insert Recibe(NomUsuario, NumIdenti) values('Romi0000', 140)
insert Recibe(NomUsuario, NumIdenti) values('Ezequiel', 140)
insert Recibe(NomUsuario, NumIdenti) values('Yesi0101', 140)
insert Recibe(NomUsuario, NumIdenti) values('Sofi1994', 141)
insert Recibe(NomUsuario, NumIdenti) values('Leo33333', 141)
insert Recibe(NomUsuario, NumIdenti) values('Flopi321', 141)
insert Recibe(NomUsuario, NumIdenti) values('Carla2022', 141)
insert Recibe(NomUsuario, NumIdenti) values('Juancito11', 142)
insert Recibe(NomUsuario, NumIdenti) values('JulioM88', 142)
insert Recibe(NomUsuario, NumIdenti) values('Franco22', 142)
insert Recibe(NomUsuario, NumIdenti) values('Cami7777', 142)
insert Recibe(NomUsuario, NumIdenti) values('Antonela', 143)
insert Recibe(NomUsuario, NumIdenti) values('Fede_1234', 143)
insert Recibe(NomUsuario, NumIdenti) values('Agus5555', 143)
insert Recibe(NomUsuario, NumIdenti) values('Claudia8', 143)
insert Recibe(NomUsuario, NumIdenti) values('Ivan1992', 144)
insert Recibe(NomUsuario, NumIdenti) values('Maxi_001', 144)
insert Recibe(NomUsuario, NumIdenti) values('Ramiro33', 144)
insert Recibe(NomUsuario, NumIdenti) values('Santi9999', 144)
insert Recibe(NomUsuario, NumIdenti) values('Nahuelz7', 145)
insert Recibe(NomUsuario, NumIdenti) values('Luciano33', 145)
insert Recibe(NomUsuario, NumIdenti) values('Maxi_001', 145)
insert Recibe(NomUsuario, NumIdenti) values('Kevin222', 145)
insert Recibe(NomUsuario, NumIdenti) values('Franco22', 146)
insert Recibe(NomUsuario, NumIdenti) values('Cami7777', 146)
insert Recibe(NomUsuario, NumIdenti) values('EmaRodri9', 146)
insert Recibe(NomUsuario, NumIdenti) values('Andrea90', 146)
insert Recibe(NomUsuario, NumIdenti) values('JulioM88', 147)
insert Recibe(NomUsuario, NumIdenti) values('Mati9000', 147)
insert Recibe(NomUsuario, NumIdenti) values('Nico_1987', 147)
insert Recibe(NomUsuario, NumIdenti) values('Pablo333', 147)
insert Recibe(NomUsuario, NumIdenti) values('Bruno111', 148)
insert Recibe(NomUsuario, NumIdenti) values('Juancito11', 148)
insert Recibe(NomUsuario, NumIdenti) values('Daniel01', 148)
insert Recibe(NomUsuario, NumIdenti) values('Barby000', 148)
insert Recibe(NomUsuario, NumIdenti) values('Franco22', 149)
insert Recibe(NomUsuario, NumIdenti) values('JulioM88', 149)
insert Recibe(NomUsuario, NumIdenti) values('Luciano33', 149)
insert Recibe(NomUsuario, NumIdenti) values('Ramiro33', 149)
insert Recibe(NomUsuario, NumIdenti) values('Thiago89', 150)
insert Recibe(NomUsuario, NumIdenti) values('Yesi0101', 150)
insert Recibe(NomUsuario, NumIdenti) values('Juancito11', 150)
insert Recibe(NomUsuario, NumIdenti) values('Cami7777', 150)
insert Recibe(NomUsuario, NumIdenti) values('Fede_1234', 151)
insert Recibe(NomUsuario, NumIdenti) values('Cami7777', 151)
insert Recibe(NomUsuario, NumIdenti) values('Antonela', 151)
insert Recibe(NomUsuario, NumIdenti) values('Aldana77', 151)
insert Recibe(NomUsuario, NumIdenti) values('Carla2022', 152)
insert Recibe(NomUsuario, NumIdenti) values('Gonza2023', 152)
insert Recibe(NomUsuario, NumIdenti) values('JulioM88', 152)
insert Recibe(NomUsuario, NumIdenti) values('LuciaL88', 152)
insert Recibe(NomUsuario, NumIdenti) values('Naza0001', 153)
insert Recibe(NomUsuario, NumIdenti) values('Ramiro33', 153)
insert Recibe(NomUsuario, NumIdenti) values('Santi9999', 153)
insert Recibe(NomUsuario, NumIdenti) values('Sofi1994', 153)
insert Recibe(NomUsuario, NumIdenti) values('Valen2000', 154)
insert Recibe(NomUsuario, NumIdenti) values('Kevin222', 154)
insert Recibe(NomUsuario, NumIdenti) values('Gonza2023', 154)
insert Recibe(NomUsuario, NumIdenti) values('LuciaL88', 154)
insert Recibe(NomUsuario, NumIdenti) values('Maxi_001', 155)
insert Recibe(NomUsuario, NumIdenti) values('Cami7777', 155)
insert Recibe(NomUsuario, NumIdenti) values('Antonela', 155)
insert Recibe(NomUsuario, NumIdenti) values('Carla2022', 155)
insert Recibe(NomUsuario, NumIdenti) values('Anahi001', 156)
insert Recibe(NomUsuario, NumIdenti) values('Claudia8', 156)
insert Recibe(NomUsuario, NumIdenti) values('Bruno111', 156)
insert Recibe(NomUsuario, NumIdenti) values('Ezequiel', 156)
insert Recibe(NomUsuario, NumIdenti) values('Luciano33', 157)
insert Recibe(NomUsuario, NumIdenti) values('Flopi321', 157)
insert Recibe(NomUsuario, NumIdenti) values('Ivan1992', 157)
insert Recibe(NomUsuario, NumIdenti) values('Malena32', 157)
insert Recibe(NomUsuario, NumIdenti) values('MartinaA1', 158)
insert Recibe(NomUsuario, NumIdenti) values('JulioM88', 158)
insert Recibe(NomUsuario, NumIdenti) values('Claudia8', 158)
insert Recibe(NomUsuario, NumIdenti) values('Barby000', 158)
insert Recibe(NomUsuario, NumIdenti) values('Mati9000', 159)
insert Recibe(NomUsuario, NumIdenti) values('Roberto123', 159)
insert Recibe(NomUsuario, NumIdenti) values('Leo33333', 159)
insert Recibe(NomUsuario, NumIdenti) values('Yesi0101', 159)
insert Recibe(NomUsuario, NumIdenti) values('Agus5555', 160)
insert Recibe(NomUsuario, NumIdenti) values('Ivan1992', 160)
insert Recibe(NomUsuario, NumIdenti) values('Claudia8', 160)
insert Recibe(NomUsuario, NumIdenti) values('Bruno111', 160)

------------------------------------- PROCEDIMIENTOS ALMACENADOS ---------------------------------------------------
																		


create proc BajaUsuario
@nomUsuario varchar(30),
@ret int output 
as
begin
	
	if not exists (select 1 from Usuario where NomUsuario = @nomUsuario)
		begin
			set @ret = -1
			return
		end

	if exists (select 1 from Mensaje where NomUsuario = @nomUsuario) or exists (select 1 from Recibe where NomUsuario = @nomUsuario)
		begin
			set @ret = -2
			return
		end
	else
		begin
			delete from Usuario where NomUsuario = @nomUsuario
			if (@@ERROR = 0)
				set @ret = 1	
			else
				set @ret = -3
				
		
end
go






create proc AltaMensaje
@asunto varchar(80) output,
@texto varchar(max) output,
@caducidad datetime output,
@nomUsuarioEnvia varchar(30),
@codCat varchar(3),
@ret int output 
as
begin
	if not exists (select 1 from Categoria where CodCat = @codCat)
		begin
			set @ret = -1
			return
		end

	if not exists (select 1 from Usuario where nomUsuario = @nomUsuarioEnvia)
		begin
			set @ret = -2
			return
		end

	else

		insert Mensaje(Asunto, Texto, NomUsuario, FechaCaducidad, CodCat) values(@asunto, @texto, @nomUsuarioEnvia, @caducidad, @codCat)

			declare @numIdenti int

				set @numIdenti = scope_identity()

		

		if @@ERROR = 0
			set @ret = @numIdenti
		else
			set @ret = -3
end 
go
																	



create proc AltaReciben
@numIdenti int,
@nomUsuario varchar(30),
@ret int output
as
begin

	if not exists (select * from Mensaje where NumIdenti = @numIdenti)
		begin
			set @ret = -1
			return
		end

	if not exists(select * from Usuario where NomUsuario = @nomUsuario)
		begin
			set @ret = -2
			return
		end

	if exists(select * from Recibe where NomUsuario = @nomUsuario and NumIdenti = @numIdenti)
		begin
			set @ret = -3
			return
		end

	insert Recibe(NomUsuario, NumIdenti) values(@nomUsuario, @numIdenti)

	if @@ERROR = 0
		begin
			set @ret = 1
			
		end 
	else
		begin
			set @ret = -4
		end 
end
go





														