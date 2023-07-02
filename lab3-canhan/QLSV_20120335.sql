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
--create master key
if NOT EXISTS
(
	select* 
	from sys.symmetric_keys
	where symmetric_key_id = 101
)
create master key encryption by
	password = '123456'
go

--create certificates
if NOT EXISTS
(
	select *
	from sys.certificates
	WHERE name = 'MyCert'
)
create certificate MyCert
	with subject = 'MyCert'
go

--create private key aes_256
if NOT EXISTS
(
	select*
	from sys.symmetric_keys
	where name = 'PriKey'
)
create symmetric key PriKey
	with algorithm = AES_256,
	key_source = '20120335'
	encryption by certificate MyCert;
go

open symmetric key PriKey
decryption by certificate MyCert;

--stored procedure 
/*SP_INS_NHANVIEN*/
IF OBJECT_ID('dbo.SP_INS_NHANVIEN','P') IS NOT NULL 
    EXEC('DROP PROCEDURE SP_INS_NHANVIEN')
GO

CREATE PROCEDURE SP_INS_NHANVIEN(@MANV VARCHAR(20),
@HOTEN NVARCHAR(100), @EMAIL VARCHAR(20), @LUONG VARCHAR(20),
@TENDN nvarchar(100), @MATKHAU VARCHAR(20))
AS
BEGIN
	INSERT INTO NHANVIEN(MANV,HOTEN,EMAIL,LUONG,TENDN,MATKHAU)
	VALUES (@MANV, @HOTEN,@EMAIL,(select ENCRYPTBYKEY(KEY_GUID('PriKey'),@LUONG)),
	@TENDN,(select HASHBYTES ('SHA1',@MATKHAU)))
END;
GO

EXEC SP_INS_NHANVIEN 'NV01', 'NGUYEN VAN A', 'NVA@', '3000000', 'NVA', 'abcd12'
EXEC SP_INS_NHANVIEN 'NV02', 'NGUYEN VAN B', 'NVB@', '3000000', 'NVB', 'abcdef'
EXEC SP_INS_NHANVIEN 'NV03', 'NGUYEN VAN C', 'NVC@', '3000000', 'NVC', '123456'

select * from NHANVIEN

/*.SP_INS_SINHVIEN*/
IF OBJECT_ID('dbo.SP_INS_SINHVIEN','P') IS NOT NULL 
    EXEC('DROP PROCEDURE SP_INS_SINHVIEN')
GO

CREATE PROCEDURE SP_INS_SINHVIEN(@MASV NVARCHAR(20),
	@HOTEN NVARCHAR(100),
	@NGAYSINH DATETIME,
	@DIACHI NVARCHAR(200),
	@MALOP VARCHAR(20),
	@TENDN NVARCHAR(100),
	@MATKHAU NVARCHAR(20))
AS
BEGIN
	INSERT INTO SINHVIEN(MASV,HOTEN,NGAYSINH,DIACHI,MALOP,TENDN,MATKHAU)
	VALUES (@MASV, @HOTEN,@NGAYSINH,@DIACHI,@MALOP,@TENDN,
	(SELECT HASHBYTES ('MD5',@MATKHAU)))
END;
GO

EXEC SP_INS_SINHVIEN 'SV01', 'NGUYEN VAN A', '1/1/1990', '280 AN 
DUONG VUONG', 'CNTT-K35', 'NVA', '123456'

select* from SINHVIEN

/*SP_SEL_NHANVIEN*/
IF OBJECT_ID('dbo.SP_SEL_NHANVIEN','P') IS NOT NULL 
    EXEC('DROP PROCEDURE SP_SEL_NHANVIEN')
GO
CREATE PROCEDURE SP_SEL_NHANVIEN
AS
BEGIN
	SELECT MANV,HOTEN,EMAIL, convert(varchar, DECRYPTBYKEY(LUONG))
	FROM NHANVIEN
END;
GO

EXEC SP_SEL_NHANVIEN
