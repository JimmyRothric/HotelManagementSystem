
create trigger trigger_check_room_rest
on Room
for insert,delete
as 
begin

with tmp(type,cnt) as
(select type,count(*) as cnt from Room where state != 'N' group by (type) )
update RoomType set rest = tmp.cnt
from RoomType,tmp
where RoomType.type = tmp.type

end
go

insert into RoomType values ('单人间', 300, 0)
insert into RoomType values ('双人间', 500, 0)
insert into Room values ('0000', '单人间', 1, 'S', '这个房间代表房间未分配', 'N')
insert into Room values ('101', '单人间', 1, 'S', null, 'E')
insert into Room values ('102', '单人间', 1, 'S', null, 'E')
insert into Room values ('201', '双人间', 2, 'S', null, 'E')
insert into Room values ('202', '双人间', 2, 'S', null, 'E')
insert into Account values ('admin','admin','admin','Manager')
insert into Account values ('recept','recept','recept','Receptionist')