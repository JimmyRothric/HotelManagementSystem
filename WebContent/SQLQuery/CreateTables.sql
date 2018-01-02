use HotelManagementDB
create table Account
(
	Uid char(18),
	password varchar(20) not null,
	name nvarchar(20) not null,
	acc_group nvarchar(20) not null,
	primary key (Uid)
)
create table RoomType
(
	type nvarchar(10),
	price int not null,
	rest int not null,
	primary key (type)
)
create table Room
(
	Rid char(4),
	type nvarchar(10) not null,
	floor int not null,
	orientation char(2) not null,
	description nvarchar(20),
	state char(1) default('E') not null,
	primary key (Rid),
	foreign key (type) references RoomType
)
create table Reservation
(
	Oid char(18),
	Uid char(18),
	Rid char(4),
	room_type nvarchar(10) not null,
	checkin datetime not null,
	checkout datetime not null,
	order_type char(1) not null,
	demand nvarchar(50),
	price int,
	primary key (Oid),
	foreign key (Uid) references Account,
	foreign key (Rid) references Room,
	foreign key (room_type) references RoomType
)
create table ReservationHistory
(
	Oid char(18),
	Uid char(18),
	Rid char(4),
	room_type nvarchar(10),
	checkin datetime,
	checkout datetime,
	order_type char(1),
	demand nvarchar(50),
	price int,
	primary key (Oid)
)
create table Review
(	
	Oid char(18),
	Uid char(18) not null,
	room_type nvarchar(10) not null,
	comment nvarchar(100),
	rate int not null,
	review_time datetime not null,
	primary key (Oid),
	foreign key (Uid) references Account,
	foreign key (Oid) references ReservationHistory,
	foreign key (room_type) references RoomType
)
