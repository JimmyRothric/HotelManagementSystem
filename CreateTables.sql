create database HotelManagementDB
on
(
	name = 'HotelManagementDBData',
	filename = 'D:\database\HotelManagementDB_data.mdf',
	size = 10MB,
	maxsize = 100MB,
	filegrowth = 10MB
)
log on
(
	name = 'HotelManagementDBLog',
	filename = 'D:\database\HotelManagementDB_log.ldf',
	size = 5MB,
	maxsize = 50MB,
	filegrowth = 5MB
)
use HotelManagementDB
create table Account
(
	Uid char(18),
	password varchar(20) not null,
	name nvarchar(20) not null,
	primary key (Uid)
)
create table RoomType
(
	type nvarchar(10),
	price numeric(10,2) not null,
	rest int not null
	primary key (type)
)
creare table Room
(
	Rid char(4),
	type nvarchar(10) not null,
	floor int not null,
	orientation char(2) not null,
	description nvarchar(20),
	empty bit default(1),
	primary key (Rid),
	foreign key (type) references RoomType
)
create table Order
(
	Oid char(20),
	Uid char(18),
	Rid char(4),
	checkin datetime not null,
	checkout datetiem not null,
	primary key (Oid,Uid,Rid)
	foreign key (Uid) references Account,
	foreign key (Rid) references Room,
)
