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
create table Room
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
create table Reservation
(
	Oid char(20),
	Uid char(18),
	Rid char(4),
	checkin datetime not null,
	checkout datetime not null,
	primary key (Oid,Uid,Rid),
	foreign key (Uid) references Account,
	foreign key (Rid) references Room,
)
