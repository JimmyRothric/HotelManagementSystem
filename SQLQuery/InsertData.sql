
create trigger trigger_check_room_rest
on Room
for insert,delete
as 
begin

with tmp(type,cnt) as
(select type,count(*) as cnt from Room where state == 'E' or state == 'F' group by (type) )
update RoomType set rest = tmp.cnt
from RoomType,tmp
where RoomType.type = tmp.type

end
go

insert into RoomType values ('���˼�', 300, 0)
insert into RoomType values ('˫�˼�', 500, 0)
insert into Room values ('0000', '���˼�', 1, 'S', '������������δ����', 'N')
insert into Room values ('101', '���˼�', 1, 'S', null, 'E')
insert into Room values ('102', '���˼�', 1, 'S', null, 'E')
insert into Room values ('201', '˫�˼�', 2, 'S', null, 'E')
insert into Room values ('202', '˫�˼�', 2, 'S', null, 'E')
insert into Account values ('admin','admin','admin','Manager')
insert into Account values ('recept','recept','recept','Receptionist')