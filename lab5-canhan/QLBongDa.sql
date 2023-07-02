/* ------------------------------
MASV: 20120335
Ho ten: CAI HUU NGHIA
LAB 05
NGAY:30-4-2023
---------------------*/

create database QLBongDa
go 

drop database QLBongDa
go
use QLBongDa
go

create table CAUTHU(
	MACT NUMERIC NOT NULL IDENTITY(1,1),
	HOTEN NVARCHAR(100) NOT NULL,
	VITRI NVARCHAR(20) NOT NULL,  
	NGAYSINH DATETIME,
	DIACHI NVARCHAR(200),
	MACLB VARCHAR(5) NOT NULL,  
	MAQG VARCHAR(5) NOT NULL,
	SO INT NOT NULL,

	constraint PK_CAUTHU primary key (MACT)
)
go

create table QUOCGIA(
	MAQG VARCHAR(5) NOT NULL,
	TENQG NVARCHAR(60) NOT NULL,

	constraint PK_QUOCGIA primary key (MAQG)
)
go

create table CAULACBO(
	MACLB VARCHAR(5) NOT NULL, 
	TENCLB NVARCHAR(100) NOT NULL, 
	MASAN VARCHAR(5) NOT NULL, 
	MATINH VARCHAR(5) NOT NULL,

	constraint PK_CAULACBO primary key(MACLB)
)
go

create table TINH(
	MATINH VARCHAR(5) NOT NULL,
	TENTINH NVARCHAR(100) NOT NULL,

	constraint PK_TINH primary key(MATINH)
)
go

create table SANVD(
	MASAN VARCHAR(10) NOT NULL,
	TENSAN NVARCHAR(100) NOT NULL,
	DIACHI NVARCHAR(200),

	constraint PK_SANVD primary key(MASAN)
)
go

create table HUANLUYENVIEN(
	MAHLV VARCHAR(5) NOT NULL, 
	TENHLV NVARCHAR(100) NOT NULL,
	NGAYSINH DATETIME,
	DIACHI NVARCHAR(200),
	DIENTHOAI NVARCHAR(20),
	MAQG VARCHAR(5) NOT NULL,

	constraint PK_HUANLUYENVIEN primary key(MAHLV)
)
go

create table HLV_CLB(
	MAHLV VARCHAR(5) NOT NULL, 
	MACLB VARCHAR(5) NOT NULL,
	VAITRO NVARCHAR(100) NOT NULL,

	constraint PK_HLV_CLB primary key(MAHLV, MACLB)
)
go

create table TRANDAU(
	MATRAN NUMERIC NOT NULL IDENTITY(1,1), 
	NAM INT NOT NULL,
	VONG INT NOT NULL, 
	NGAYTD DATETIME NOT NULL,
	MACLB1 VARCHAR(5) NOT NULL, 
	MACLB2 VARCHAR(5) NOT NULL,
	MASAN VARCHAR(5) NOT NULL,
	KETQUA VARCHAR(5) NOT NULL,

	constraint PK_TRANDAU primary key(MATRAN)
)
go

create table BANGXH(
	MACLB VARCHAR (5) NOT NULL,
	NAM INT NOT NULL,
	VONG INT NOT NULL,
	SOTRAN INT NOT NULL,
	THANG INT NOT NULL,
	HOA INT NOT NULL,
	THUA INT NOT NULL,
	HIEUSO VARCHAR (5) NOT NULL,
	DIEM INT NOT NULL,
	HANG INT NOT NULL,

	constraint PK_BANGXH primary key(MACLB, NAM, VONG)
)
go

insert into CAUTHU(HOTEN, VITRI, NGAYSINH, DIACHI, MACLB, MAQG, SO) values (N'Nguyễn Vũ Phong', N'Tiền vệ', '02/20/1990', NULL, 'BBD', 'VN', 17)
insert into CAUTHU(HOTEN, VITRI, NGAYSINH, DIACHI, MACLB, MAQG, SO) values (N'Nguyễn Công Vinh', N'Tiền đạo', '03/10/1992', NULL, 'HAGL', 'VN', 9)
insert into CAUTHU(HOTEN, VITRI, NGAYSINH, DIACHI, MACLB, MAQG, SO) values (N'Trần Tấn Tài', N'Tiền vệ', '11/12/1989', NULL, 'BBD', 'VN', 8)
insert into CAUTHU(HOTEN, VITRI, NGAYSINH, DIACHI, MACLB, MAQG, SO) values (N'Phan Hồng Sơn', N'Thủ môn', ' 06/10/1991', NULL, 'HAGL', 'VN', 1)
insert into CAUTHU(HOTEN, VITRI, NGAYSINH, DIACHI, MACLB, MAQG, SO) values (N'Ronaldo', N'Tiền vệ', '12/12/1989', NULL, 'SDN', 'BRA', 7)
insert into CAUTHU(HOTEN, VITRI, NGAYSINH, DIACHI, MACLB, MAQG, SO) values (N'Robinho', N'Tiền vệ', '10/12/1989', NULL, 'SDN', 'BRA', 8)
insert into CAUTHU(HOTEN, VITRI, NGAYSINH, DIACHI, MACLB, MAQG, SO) values (N'Vidic', N'Hậu vệ', '10/15/1987', NULL, 'HAGL', 'ANH', 3)
insert into CAUTHU(HOTEN, VITRI, NGAYSINH, DIACHI, MACLB, MAQG, SO) values (N'Trần Văn Santos', N'Thủ môn', '10/21/1990', NULL, 'BBD', 'BRA', 1)
insert into CAUTHU(HOTEN, VITRI, NGAYSINH, DIACHI, MACLB, MAQG, SO) values (N'Nguyễn Trường Sơn', N'Hậu vệ', '08/26/1993', NULL, 'BBD', 'VN', 4)
go

insert into QUOCGIA(MAQG,TENQG) values ('VN',N'Việt Nam')
insert into QUOCGIA(MAQG,TENQG) values ('ANH',N'Anh Quốc')
insert into QUOCGIA(MAQG,TENQG) values ('TBN',N'Tây Ban Nha')
insert into QUOCGIA(MAQG,TENQG) values ('BDN',N'Bồ Đào Nha')
insert into QUOCGIA(MAQG,TENQG) values ('BRA',N'Brazil')
insert into QUOCGIA(MAQG,TENQG) values ('ITA',N'Ý')
insert into QUOCGIA(MAQG,TENQG) values ('THA',N'Thái Lan')
go

insert into CAULACBO(MACLB,TENCLB,MASAN,MATINH) values ('BBD',N'BECAMEX BÌNH DƯƠNG','GD','BD')
insert into CAULACBO(MACLB,TENCLB,MASAN,MATINH) values ('HAGL',N'HOÀNG ANH GIA LAI','PL','GL')
insert into CAULACBO(MACLB,TENCLB,MASAN,MATINH) values ('SDN',N'SHB ĐÀ NẴNG','CL','DN')
insert into CAULACBO(MACLB,TENCLB,MASAN,MATINH) values ('KKH',N'KHATOCO KHÁNH HÒA','NT','KH')
insert into CAULACBO(MACLB,TENCLB,MASAN,MATINH) values ('TPY',N'THÉP PHÚ YÊN','TH','PY')
insert into CAULACBO(MACLB,TENCLB,MASAN,MATINH) values ('GDT',N'GẠCH ĐỒNG TÂM LONG AN','LA','LA')
go

insert into TINH(MATINH,TENTINH) values ('BD',N'Bình Dương')
insert into TINH(MATINH,TENTINH) values ('GL',N'Giai Lai')
insert into TINH(MATINH,TENTINH) values ('DN',N'Đà Nẵng')
insert into TINH(MATINH,TENTINH) values ('KH',N'Khánh Hòa')
insert into TINH(MATINH,TENTINH) values ('PY',N'Phú Yên')
insert into TINH(MATINH,TENTINH) values ('LA',N'Long An')
go

insert into SANVD(MASAN,TENSAN,DIACHI) values('GD',N'Gò Đậu',N'123 QL1, TX Thủ Dầu Một, Bình Dương')
insert into SANVD(MASAN,TENSAN,DIACHI) values('PL',N'Pleiku',N'22 Hồ Tùng Mậu, Thống Nhất, Thị xã Pleiku, Gia Lai')
insert into SANVD(MASAN,TENSAN,DIACHI) values('CL',N'Chi Lăng',N'127 Võ Văn Tần, Đà Nẵng')
insert into SANVD(MASAN,TENSAN,DIACHI) values('NT',N'Nha Trang',N'128 Phan Chu Trinh, Nha Trang, Khánh Hòa')
insert into SANVD(MASAN,TENSAN,DIACHI) values('TH',N'Tuy Hòa',N'57 Trường Chinh, Tuy Hòa, Phú Yên')
insert into SANVD(MASAN,TENSAN,DIACHI) values('LA',N'Long An',N'102 Hùng Vương, Tp Tân An, Long An')
go

insert into HUANLUYENVIEN(MAHLV,TENHLV,NGAYSINH,DIACHI,DIENTHOAI,MAQG) values ('HLV01',N'Vital','10/15/1955',NULL,N'0918011075','BDN')
insert into HUANLUYENVIEN(MAHLV,TENHLV,NGAYSINH,DIACHI,DIENTHOAI,MAQG) values ('HLV02',N'Lê Huỳnh Đức','05/20/1972',NULL,N'01223456789','VN')
insert into HUANLUYENVIEN(MAHLV,TENHLV,NGAYSINH,DIACHI,DIENTHOAI,MAQG) values ('HLV03',N'Kiatisuk','12/11/1970',NULL,N'01990123456','THA')
insert into HUANLUYENVIEN(MAHLV,TENHLV,NGAYSINH,DIACHI,DIENTHOAI,MAQG) values ('HLV04',N'Hoàng Anh Tuấn','06/10/1970',NULL,N'0989112233','VN')
insert into HUANLUYENVIEN(MAHLV,TENHLV,NGAYSINH,DIACHI,DIENTHOAI,MAQG) values ('HLV05',N'Trần Công Minh','07/07/1973',NULL,N'0909099990','VN')
insert into HUANLUYENVIEN(MAHLV,TENHLV,NGAYSINH,DIACHI,DIENTHOAI,MAQG) values ('HLV06',N'Trần Văn Phúc','03/02/1965',NULL,N'01650101234','VN')
go

insert into HLV_CLB(MAHLV,MACLB,VAITRO) values ('HLV01','BBD',N'HLV Chính')
insert into HLV_CLB(MAHLV,MACLB,VAITRO) values ('HLV02','SDN',N'HLV Chính')
insert into HLV_CLB(MAHLV,MACLB,VAITRO) values ('HLV03','HAGL',N'HLV Chính')
insert into HLV_CLB(MAHLV,MACLB,VAITRO) values ('HLV04','KKH',N'HLV Chính')
insert into HLV_CLB(MAHLV,MACLB,VAITRO) values ('HLV05','GDT',N'HLV Chính')
insert into HLV_CLB(MAHLV,MACLB,VAITRO) values ('HLV06','BBD',N'HLV Thủ môn')
go

insert into TRANDAU(NAM,VONG,NGAYTD,MACLB1,MACLB2,MASAN,KETQUA) values (2009,1,'02/07/2009','BBD','SDN','GD','3-0')
insert into TRANDAU(NAM,VONG,NGAYTD,MACLB1,MACLB2,MASAN,KETQUA) values (2009,1,'02/07/2009','KKH','GDT','NT','1-1')
insert into TRANDAU(NAM,VONG,NGAYTD,MACLB1,MACLB2,MASAN,KETQUA) values (2009,2,'02/16/2009','SDN','KKH','CL','2-2')
insert into TRANDAU(NAM,VONG,NGAYTD,MACLB1,MACLB2,MASAN,KETQUA) values (2009,2,'02/16/2009','TPY','BBD','TH','5-0')
insert into TRANDAU(NAM,VONG,NGAYTD,MACLB1,MACLB2,MASAN,KETQUA) values (2009,3,'03/01/2009','TPY','GDT','TH','0-2')
insert into TRANDAU(NAM,VONG,NGAYTD,MACLB1,MACLB2,MASAN,KETQUA) values (2009,3,'03/01/2009','KKH','BBD','NT','0-1')
insert into TRANDAU(NAM,VONG,NGAYTD,MACLB1,MACLB2,MASAN,KETQUA) values (2009,4,'03/07/2009','KKH','TPY','NT','1-0')
insert into TRANDAU(NAM,VONG,NGAYTD,MACLB1,MACLB2,MASAN,KETQUA) values (2009,4,'03/07/2009','BBD','GDT','GD','2-2')
go

insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('BBD',2009,1,1,1,0,0,'3-0',3,1)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('KKH',2009,1,1,0,1,0,'1-1',1,2)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('GDT',2009,1,1,0,1,0,'1-1',1,3)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('TPY',2009,1,0,0,0,0,'0-0',0,4)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('SDN',2009,1,1,0,0,1,'0-3',0,5)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('TPY',2009,2,1,1,0,0,'5-0',3,1)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('BBD',2009,2,2,1,0,1,'3-5',3,2)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('KKH',2009,2,2,0,2,0,'3-3',2,3)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('GDT',2009,2,1,0,1,0,'1-1',1,4)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('SDN',2009,2,2,1,1,0,'2-5',1,5)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('BBD',2009,3,3,2,0,1,'4-5',6,1)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('GDT',2009,3,2,1,1,0,'3-1',4,2)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('TPY',2009,3,2,1,0,1,'5-2',3,3)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('KKH',2009,3,3,0,2,1,'3-4',2,4)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('SDN',2009,3,2,1,1,0,'2-5',1,5)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('BBD',2009,4,4,2,1,1,'6-7',7,1)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('GDT',2009,4,3,1,2,0,'5-1',5,2)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('KKH',2009,4,4,1,2,1,'4-4',5,3)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('TPY',2009,4,4,1,0,2,'5-3',3,4)
insert into BANGXH(MACLB,NAM,VONG,SOTRAN,THANG,HOA,THUA,HIEUSO,DIEM,HANG) values ('SDN',2009,4,2,1,1,0,'2-5',1,5)
go

select* from CAUTHU 

--- Script mã hóa csdl sử dụng TDE ---
use master
go
create master key encryption by password = '20120335'
go

create certificate QLBongDa_Cert with subject = 'QLBongDa certificate'
go

use QLBongDa
go
create database encryption key 
with algorithm = AES_256
encryption by server certificate QLBongDa_Cert
go

alter database QLBongDa
set encryption on
go

--- giải pháp attach: Backup certificate, chạy dòng lệnh trên MSSQLSERVER01---
use master
go
backup certificate QLBongDa_Cert to file = 'E:\bckup\QLBongDa_Cert.cer'
with private key (
file = 'E:\bckup\QLBongDaKey.pvk',
encryption by password = '20120335')

--- Restore certificate trên MSSQLSERVER02---
create certificate QLBDC1 
from file = 'E:\bckup\QLBongDa_Cert.cer'
with private key (
file = 'E:\bckup\QLBongDaKey.pvk',
decryption by password = '20120335')