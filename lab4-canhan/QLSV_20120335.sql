/*--
Ma so sinh vien: 20120335
Ten: Cai Huu Nghia
Lab: 03
--*/
use master
go

if DB_ID('QLSV') IS NOT NULL
	drop database QLSV
go

create database QLSV
go

use QLSV
go

create table SINHVIEN
(
	MASV varchar(20) NOT NULL,
	HOTEN nvarchar(100) NOT NULL,
	NGAYSINH datetime,
	DIACHI nvarchar(200),
	MALOP varchar(20),
	TENDN nvarchar(100) NOT NULL,
	MATKHAU varbinary(100) NOT NULL,
	primary key(MASV)
)
go

create table NHANVIEN(
	MANV varchar(20) NOT NULL,
	HOTEN nvarchar(100) NOT NULL,
	EMAIL varchar(20),
	LUONG varbinary(MAX),
	TENDN nvarchar(100) NOT NULL,
	MATKHAU varbinary(100) NOT NULL,
	PUBKEY varchar(20),
	primary key(MANV)
)
go

create table LOP(
	MALOP varchar(20) NOT NULL,
	TENLOP nvarchar(100) NOT NULL,
	MANV varchar(20),
	primary key(MALOP)
)
go

/*TAO STORED PROCEDURE*/
---c.i---
if OBJECT_ID('dbo.SP_INS_ENCRYPT_SINHVIEN','P') IS NOT NULL
drop procedure dbo.SP_INS_ENCRYPT_SINHVIEN
go
create procedure dbo.SP_INS_ENCRYPT_SINHVIEN
	@MASV nvarchar(20),
	@HOTEN nvarchar(100),
	@NGAYSINH datetime,
	@DIACHI nvarchar(200),
	@MALOP varchar(20),
	@TENDN nvarchar(100),
	@MATKHAU varbinary
as
begin
	insert into SINHVIEN(MASV, HOTEN, NGAYSINH, DIACHI, MALOP, TENDN, MATKHAU) 
	values (@MASV, @HOTEN, @NGAYSINH, @DIACHI, @MALOP, @TENDN, @MATKHAU)
end
go

---c.ii---
if OBJECT_ID('SP_INS_ENCRYPT_NHANVIEN','P') IS NOT NULL
drop procedure SP_INS_ENCRYPT_NHANVIEN
go
create procedure SP_INS_ENCRYPT_NHANVIEN
	@MANV varchar(20),
	@HOTEN nvarchar(100),
	@EMAIL varchar(20),
	@LUONG varbinary(max),
	@TENDN nvarchar(100),
	@MATKHAU varbinary(max)
as
begin
    insert into NHANVIEN (MANV, HOTEN, EMAIL, LUONG, TENDN, MATKHAU) values (@MANV, @HOTEN, @EMAIL,  @LUONG, @TENDN, @MATKHAU);
end
go
declare @p VARBINARY(MAX)  
declare @l VARBINARY(MAX)   
set @p = 0xFB398CC690E15DDBA43EE811B6C0D3EC190901AD3DF377FEC9A1F9004B919A06
set @l = 0x1A46AC4A995E55A8644ED06138BA82AA
exec SP_INS_ENCRYPT_NHANVIEN 'NV01', 'NGUYEN VAN A', 'NVA@',@l, 'NVA', @p

---c.iii---
if OBJECT_ID('SP_SEL_ENCRYPT_NHANVIEN','P') IS NOT NULL
drop procedure SP_SEL_ENCRYPT_NHANVIEN
go
create procedure SP_SEL_ENCRYPT_NHANVIEN
as
begin
	select NV.MANV, NV.HOTEN, NV.EMAIL,NV.LUONG as LUONG
	from NHANVIEN NV
end
go
-- stored sửa nv---
IF OBJECT_ID('SP_UPD_ENCRYPT_NHANVIEN','P') IS NOT NULL
DROP PROCEDURE SP_UPD_ENCRYPT_NHANVIEN
GO
CREATE PROCEDURE SP_UPD_ENCRYPT_NHANVIEN
	@MANV VARCHAR(20),
	@HOTEN NVARCHAR(100),
	@EMAIL VARCHAR(20),
	@LUONG varbinary(max),
	@TENDN NVARCHAR(100),
	@MATKHAU varbinary(max)
AS
BEGIN
    UPDATE NHANVIEN
    set HOTEN = @HOTEN, EMAIL = @EMAIL, LUONG =  @LUONG, TENDN = @TENDN, MATKHAU = @MATKHAU
	where MANV = @MANV
END
GO

--exec sp_executesql N'SELECT NV.MANV, NV.TENDN FROM NHANVIEN AS NV where nv.TENDN = @username and NV.MATKHAU = @password',N'@username nvarchar(4),@password varbinary(32)',@username=N'NVA',@password=0xFB398CC690E15DDBA43EE811B6C0D3EC190901AD3DF377FEC9A1F9004B919A06
--exec sp_executesql N'exec SP_INS_ENCRYPT_NHANVIEN @manv, @hoten, @email, @luong, @tendn , @matkhau',N'@manv nvarchar(4),@email nvarchar(4),@tendn nvarchar(3),@hoten nvarchar(12),@luong varbinary(16),@matkhau varbinary(32)',@manv=N'NV03',@email=N'NVC@',@tendn=N'NVC',@hoten=N'Nguyen Van C',@luong=0x9336CCEBE0440CD14502B1B96EC9E6C6,@matkhau=0xEF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F