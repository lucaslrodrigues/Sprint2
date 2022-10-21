create database systoyanka;
use systoyanka;

create table Shopping (
idshopping int primary key auto_increment,
Nome varchar(45),
CNPJ char(14) unique,
Telefone char (10)
);


Create table Endereço (
idEndereço int primary key auto_increment,
Cidade varchar(45),
Bairro varchar (45),
CEP varchar (9),
 fkshoppingE int,
 constraint foreign key fkshoppingE (fkshoppingE) references Shopping (idshopping) 
);


create table Sensor (
idSensor int primary key auto_increment,
Andar char(2),
Bloco varchar (4),
fkShoppingS int,constraint foreign key fkshoppingS (fkshoppingS) references Shopping (idshopping)
);

create table Leitura(
idResposta int auto_increment,
Dt_hora DATETIME, 
Retorno int,
fkSensor int,constraint foreign key fkSensor (fkSensor) references Sensor (idSensor),
primary key (idResposta, fkSensor)
);

create table Usuario (
idUsuario int auto_increment,
Login varchar(45),
Senha varchar(45),
Tipo varchar(45), constraint chkTipo 
check (tipo in ('Admin','user')),
fkShopping int,constraint foreign key fkShopping (fkShopping) references Shopping (idshopping),
primary key (idUsuario, fkShopping)
);

insert into Shopping (Nome, CNPJ, Telefone) values
 ('Shopping Praça da moça', '52678945301254', '1185461247'),
 ('Shopping Aricanduva', '24355214544132', '1140674545'),
 ('Shopping JK Iguatemi', '64589092093425', '1140664066');

insert into Endereço (cidade, Bairro, CEP, fkshoppingE) values
 ( 'Diadema', 'Praça Da Moça','09910-720', 1),
('São Paulo', 'aricanduva','03527-900', 2),
('São Paulo', 'Vila Olímpia','04543-011', 3);

insert into sensor (Andar, Bloco, fkshoppingS) values
(01,'A',1),
(01,'A',2),
(01,'A',3),
(01,'B',1),
(01,'B',2),
(01,'B',3),
(01,'C',1),
(01,'C',2),
(01,'C',3),
(01,'D',1),
(01,'D',2),
(01,'D',3),
(02,'A',1),
(02,'A',2),
(02,'A',3),
(02,'B',1),
(02,'B',2),
(02,'B',3),
(02,'C',1),
(02,'C',2),
(02,'C',3),
(02,'D',1),
(02,'D',2),
(02,'D',3),
(03,'A',1),
(03,'A',2),
(03,'A',3),
(03,'B',1),
(03,'B',2),
(03,'B',3),
(03,'C',1),
(03,'C',2),
(03,'C',3),
(03,'D',1),
(03,'D',2),
(03,'D',3);

insert into leitura (Dt_hora, Retorno, fksensor) values
('2022-10-23 19:50:00', 1, 1),
('2022-10-22 18:43:00', 1, 2),
('2022-10-20 14:15:00', 0, 3),
('2022-10-05 17:10:00', 1, 4),
('2022-10-30 16:15:00', 1, 5);

insert into usuario values
(1, 'Brandão@sptech', 'sptech', 'Admin', 3),
(2, 'Caramico@sptech', '12345', 'Admin', 1),
(3, 'Victor@sptech', '40674545', 'user', 2);

select * from endereço;

select * from shopping;

select * from sensor;

select * from leitura;

SELECT SUM(Retorno) FROM leitura;

SELECT * FROM shopping JOIN endereço 
	ON idShopping = fkShoppingE;
    
SELECT * FROM shopping JOIN sensor 
	ON idShopping = fkShoppingS;

SELECT * FROM sensor JOIN leitura 
	ON idSensor = fkSensor;
    
SELECT * FROM sensor JOIN leitura 
	ON idSensor = fksensor;
    
SELECT * FROM shopping JOIN endereço 
	ON idShopping = fkShoppingE
    join sensor on idShopping = fkShoppingS
    join usuario on idShopping = fkShopping;
    
    SELECT * FROM shopping JOIN endereço 
	ON idShopping = fkShoppingE
    join sensor on idShopping = fkShoppingS
    join usuario on idShopping = fkShopping
    where cidade like 'D%';
    
    
