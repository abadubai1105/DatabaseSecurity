---TẠO USER---
use [master]
go

create login [BDAdmin] with password=N'123', 
default_database=[master], check_expiration=off, check_policy=off
go

create login [BDBK] with password=N'123', 
default_database=[master], check_expiration=off, check_policy=off
go

create login [BDRead] with password=N'123', 
default_database=[master], check_expiration=off, check_policy=off
go

create login [BDU01] with password=N'123', 
default_database=[master], check_expiration=off, check_policy=off
go

create login [BDU02] with password=N'123', 
default_database=[master], check_expiration=off, check_policy=off
go

create login [BDU03] with password=N'123', 
default_database=[master], check_expiration=off, check_policy=off
go

create login [BDU04] with password=N'123', 
default_database=[master], check_expiration=off, check_policy=off
go

create login [BDProfile] with password=N'123', 
default_database=[master], check_expiration=off, check_policy=off
go


---CẤP QUYỀN CHO CÁC USER THEO YÊU CẦU---
use QLBongDa
go

-- BDAdmin --
create user BDAdmin for login BDAdmin
go
alter role db_owner add MEMBER BDAdmin
go

--BDBK--
create user BDBK for login BDBK
go
alter role db_backupoperator add MEMBER BDBK
go

--BDRead--
create user BDRead for login BDRead
go
alter role db_datareader add MEMBER BDRead
go

--BDU01 --
create role db_create_table authorization [dbo];
grant create table to db_create_table;
go
create user BDU01 for login BDU01;
grant alter on schema::dbo to BDU01;
go
alter role db_create_table add MEMBER BDU01;
go

-- BDU02--
create user BDU02 for login BDU02
go
alter role db_datawriter add MEMBER BDU02
go

-- BDU03--
create user BDU03 for login BDU03
go
grant select, insert, update, delete on [dbo].[CAULACBO] to BDU03
go

-- BDU04--
create user BDU04 for login BDU04
go
grant select, insert, update, delete on [dbo].[CAUTHU] to BDU04
deny select on [dbo].[CAUTHU]([NGAYSINH]) to BDU04
deny update on [dbo].[CAUTHU]([VITRI]) to BDU04
go

-- BDProfile--
create user BDProfile for login BDProfile
go
alter role db_accessadmin add MEMBER BDProfile
go