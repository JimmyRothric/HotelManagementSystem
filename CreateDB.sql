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