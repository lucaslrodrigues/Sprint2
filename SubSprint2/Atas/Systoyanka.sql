use sprint2;

Create table Endereço (
idEndereço int primary key auto_increment,
Cidade varchar(45),
Estado varchar(45),
Bairro varchar (45),
CEP varchar (9),
 fkshopping int,constraint foreign key fkshopping (fkshopping) references Shopping (idshopping) 
);

create table Shopping (
idshopping int primary key auto_increment,
Nome varchar(45),
CNPJ char(14) unique,
Telefone char (10),
Login varchar (45) unique,
senha varchar (45) 
);

create table Vagas (
idvagas int primary key auto_increment,
QTDvagas varchar(4),
Andar char(2),
Bloco varchar (4),
 fkshopping int,constraint foreign key fkshopping (fkshopping) references Shopping (idshopping)
);

create table Sensor (
idsensor int primary key auto_increment,
Nome varchar(45),
fkvaga int,constraint foreign key fkvaga (fkvaga) references vagas(idvagas)
);

create table Leitura(
idresposta int primary key auto_increment,
Dt_hora DATETIME, 
Retorno int,
 fksensor int,constraint foreign key fksensor (fksensor) references sensor (idsensor)
);

insert into Shopping (Nome, CNPJ, Telefone, Login, senha) values
 ('Shopping Praça da moça', '52678945301254', '1185461247', 'shoppdm@gmail.com','pdm123'),
 ('Shopping Park São Caetano', '44566788901241', '1178451204', 'shoppsc@gmail.com','psc784'),
 ('Shopping Paulista', '14547856412457', '1154124680', 'shopp@gmail.com','sp3105'),
 ('Shopping Rio sul', '78451204578451', '2154687124', 'shoprs@gmail.com','rs178'),
 ('Shopping Centerminas', '87541245879645', '3178446124', 'shopc@gmail.com','c78456');

insert into Endereço (cidade, estado, Bairro, CEP, fkshopping) values
 ( 'Diadema', 'São Paulo', 'Praça da moça','09910-720', 1),
('São Caetano', 'São Paulo', 'Cerâmica','85412-120', 2),
('São Paulo','São Paulo', 'Bela Vista','78451-202', 3),
('Rio de Janeiro','Rio de Janeiro','Botafogo','98461-451', 4),
('Belo Horizonte', 'Minas Gerais', 'União', '31170-678', 5);

insert into Vagas (Andar, Bloco, fkshopping) values
(01,'A',1),
(02,'B',1),
(03,'C',1),
(02,'B',2),
(01,'A',2),
(02,'B',2),
(03,'C',2),
(02,'B',3),
(03,'C',3),
(01,'A',3),
(01,'A',4),
(02,'B',4),
(03,'C',4),
(01,'A',5),
(02,'B',5),
(03,'C',5);

insert into sensor (Nome, fkvaga) values
('shop praça da moça', 1),
('shop Park São Caetano', 2),
('shop Paulista', 3),
('shop Rio sul', 4),
('shop Centerminas', 5);

insert into leitura (Dt_hora, Retorno, fksensor) values
('2022-10-23-19:50:00', 1, 1),
('2022-10-22-18:43:00',1, 2),
('2022-10-20-14:15:00',0, 3),
('2022-10-05-17:10:00',1, 4),
('2022-10-30-16:15:00',1, 5);