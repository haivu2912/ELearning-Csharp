create database db_Elearning
use db_Elearning
go

-- Tạo bảng Quản Lý
create table tblQuanLy
(
	sQuanLyId varchar(50) primary key not null,
	sTen nvarchar(50) not null,
	sAccount varchar(50) not null
)
GO

-- Tạo bảng Giảng Viên
create table tblGiangVien
(
	sGiangVienId varchar(50) primary key not null,
	sTen nvarchar(50) not null,
	sGioitinh nvarchar(50) not null,
	dNgaysinh datetime not null,
	sDiachi nvarchar(50) not null,
	sEmail varchar(50) not null,
	sCmnd varchar(50) not null unique,
	sSodienthoai varchar (10),
	sBangcap nvarchar(50) not null,
	sAccount varchar(50) not null
)
GO

-- Tạo bảng Sinh Viên
create table tblSinhVien
(
	sSinhVienId varchar(50) primary key not null,
	sTen nvarchar(50) not null,
	sGioitinh nvarchar(50) not null,
	dNgaysinh datetime not null,
	sDiachi nvarchar(50) not null,
	sEmail varchar(50) not null,
	sCmnd varchar(50) not null unique,
	sSodienthoai varchar (10) ,
	sAccount varchar(50) not null
)
GO

-- Tạo bảng Tài Khoản
create table tblTaiKhoan
(
	sAccount varchar(50) primary key not null,
	sPassword varchar(50) not null,
	iMaQuyen int NOT NULL
)
GO

-- Tạo bảng Quyền
create table tblQuyen
(
	iMaQuyen int identity(1,1) primary key not null,
	sTenQuyen NVARCHAR(50) NOT NULL
)
GO

create table tblMonHoc 
(
	sMonHocId varchar(50) primary key not null,
	sTenMon nvarchar(50) not null,
	iSoTinChi int not null
)
GO

create table tblLop
(
	sLopId varchar(50) primary key not null,
	sTenLop nvarchar(50) not null,
	sQuanLyId varchar(50) not null,
	sGiangVienId varchar(50) not null,
	sMonHocId varchar(50) not null,
)
GO
create table tblDiem
(
	sDiemId varchar(50) primary key not null,
	sSinhVienId varchar(50) not null,
	sMonHocId varchar(50) not null,
	iDiemCC int,
	fDiemGK float,
	fDiemThi float
)
go

create table tblDanhsach_SV_Lop
(
	sLopId varchar(50) not null,
	sSinhVienId varchar (50) not null
)
GO

create table tblBuoiHoc
(
	iBuoiHocId int  identity(1,1) primary key not null,
	dThoiGian datetime,
	sTieuDe nvarchar(100) not null,
	sNoiDung nvarchar (100) not null,
	sLopId varchar(50) not null,
	sTrangThai nvarchar(20) not null,
	sthoigianbatdau varchar(50),
	sthoigianketthuc varchar(50),
	stepdinhkem varchar(50)
)
GO

create table tblDiemDanh
(
	sDiemDanhId int identity(1,1) primary key not null,
	iBuoiHocId int not null,
	sSinhVienId varchar(50) not null,
	bDiemDanh bit
)
GO

create table tblThaoluanchung
(
	iMathaoluan int IDENTITY(1,1) PRIMARY KEY,
	sNoidung nvarchar(MAX),
	dNgay date,
	sAccount varchar(50),
	sLopId varchar(50)
)
go
-- Thêm khóa ngoại
alter table tblQuanLy add constraint FK_QuanLy_TaiKhoan foreign key(sAccount) references tblTaiKhoan(sAccount)
go

alter table tblGiangVien add constraint FK_GiangVien_TaiKhoan foreign key(sAccount) references tblTaiKhoan(sAccount)
go

alter table tblSinhVien add constraint FK_SinhVien_TaiKhoan foreign key(sAccount) references tblTaiKhoan(sAccount)
go

alter table tblTaiKhoan add constraint FK_TaiKhoan_Quyen foreign key(iMaQuyen) references tblQuyen(iMaQuyen)
go

alter table tblLop add constraint FK_Lop_QuanLy foreign key(sQuanLyId) references tblQuanLy(sQuanLyId)
alter table tblLop add constraint FK_Lop_GiangVien foreign key(sGiangVienId) references tblGiangVien(sGiangVienId)
alter table tblLop add constraint FK_Lop_Monhoc foreign key(sMonhocId) references tblMonHoc(sMonhocId)
go

ALTER TABLE tblDanhsach_SV_Lop ADD CONSTRAINT FK_DS_SV FOREIGN KEY(sSinhVienId) REFERENCES tblSinhVien(sSinhVienId);
ALTER TABLE tblDanhsach_SV_Lop ADD CONSTRAINT FK_DS_Lop FOREIGN KEY(sLopId) REFERENCES tblLop(sLopId);
go

ALTER TABLE tblDiem ADD CONSTRAINT FK_Diem_SV FOREIGN KEY(sSinhVienId) REFERENCES tblSinhVien(sSinhVienId);
ALTER TABLE tblDiem ADD CONSTRAINT FK_Diem_MonHoc FOREIGN KEY(sMonHocId) REFERENCES tblMonHoc(sMonHocId);
go

ALTER TABLE tblDiemDanh ADD CONSTRAINT FK_DD_BuoiHoc FOREIGN KEY(iBuoiHocId) REFERENCES tblBuoiHoc(iBuoiHocId);
ALTER TABLE tblDiemDanh ADD CONSTRAINT FK_DD_SV FOREIGN KEY(sSinhVienId) REFERENCES tblSinhVien(sSinhVienId);
go

ALTER TABLE tblBuoiHoc ADD CONSTRAINT FK_BuoiHoc_Lop FOREIGN KEY(sLopId) REFERENCES tblLop(sLopId);
go

ALTER TABLE tblThaoluanchung ADD CONSTRAINT FK_TTC_ACC FOREIGN KEY(sAccount) REFERENCES tblTaiKhoan(sAccount);
go
ALTER TABLE tblThaoluanchung ADD CONSTRAINT FK_TTC_Lop FOREIGN KEY(sLopId) REFERENCES tblLop(sLopId);
go

-- Insert Data
insert into tblMonhoc(sMonHocId,sTenMon,iSoTinChi)
values	('ta1',N'Tiếng Anh 1',3),
		('ta2',N'Tiếng Anh 2',3),
		('ta3',N'Tiếng Anh 3',3),
		('tacn',N'Tiếng Anh Chuyên Ngành',3),
		('ltwcb',N'Lập trình web cơ bản',4),
		('gt1',N'Giải tích 1',3),
		('gt2',N'Giải tích 2',3),
		('tmdt',N'Thương mại điện tử',3),
		('lthsk',N'Lập trình hướng sự kiên',3),
		('ltht',N'Lập trình hệ thống',3);
GO


insert into tblGiangVien(sGiangVienId,sTen,sGioitinh,dNgaysinh,sDiachi,sEmail,sCmnd,sSodienthoai,sBangcap,sAccount)
values	('GV01',N'Nguyễn Bình An','nam','1990-03-25',N'Hà Nội','binan@gmail.com','1234684','096153421','Thạc sĩ','GV01'),
		('GV02',N'Hoàng Thị Hạnh',N'nữ','1990-07-15',N'Hà Nội','hanh@gmail.com','307758807','0893007110','Thạc sĩ','GV02'),
		('GV03',N'Đinh Trung Dũng','nam','1992-07-16',N'Hải Phòng','dung@gmail.com','970597801','0922460940','Thạc sĩ','GV03');
GO

select * from tblGiangvien where sCmnd = 1234684
insert into tblSinhVien(sSinhVienId,sTen,sGioitinh,dNgaysinh,sDiachi,sEmail,sCmnd,sSodienthoai,sAccount)
values	('SV101',N'Nguyễn Thiện Nhân','nam','1999-11-02',N'Hà Nội','nhan9x@gmail.com','198763825','0993169113','SV101'),
		('SV102',N'Ngô Văn Ngọc','nam','1999-10-05',N'Hà Nội','ngocngo@gmail.com','483112636','0825090955','SV102'),
		('SV201',N'Nguyễn Thúy Nga',N'nữ','2000-5-02',N'Thái Bình','meocon@gmail.com','263935751','0900419175','SV201');
GO

insert into tblTaiKhoan(sAccount,sPassword,iMaQuyen)
values	('Admin1','123456789',1),
		('GV01','123456789',2),
		('GV02','123456789',2),
		('GV03','123456789',2),
		('SV101','123456789',2),
		('SV102','123456789',3),
		('SV201','123456789',3)
GO

select * from tblTaiKhoan
delete from tblTaiKhoan where sAccount = 'SV202'

insert into tblQuyen(sTenQuyen)
values	('ADMIN'),
		('GV'),
		('SV')
GO

insert into tblLop(sLopId,sTenLop,sQuanLyId,sGiangVienId,sMonHocId)
values	('lop01',N'Giải tích 1','Admin1','GV01','gt1'),
		('lop02',N'Giải tích 2','Admin1','GV01','gt2'),
		('lop03',N'Tiếng anh 1','Admin1','GV02','ta1'),
		('lop04',N'Tiếng anh 2','Admin1','GV02','ta2'),
		('lop05',N'Tiếng anh 3','Admin1','GV02','ta3'),
		('lop06',N'Tiếng anh chuyên ngành','Admin1','GV02','tacn'),
		('lop07',N'Lập trình web cơ bản','Admin1','GV03','ltwcb'),
		('lop08',N'Thương mại điện tử','Admin1','GV03','tmdt'),
		('lop09',N'Lập trình hướng sự kiện','Admin1','GV03','lthsk'),
		('lop10',N'Lập trình hệ thống','Admin1','GV03','ltht')
GO

insert into tblQuanLy(sQuanLyId, sTen, sAccount)
values ('Admin1', N'Admin', 'Admin1')
go

insert into tblDanhsach_SV_Lop(sLopId, sSinhVienId)
values	('lop01', 'SV101'),
		('lop02', 'SV101'),
		('lop03', 'SV101'),
		('lop04', 'SV101'),
		('lop05', 'SV101'),
		('lop06', 'SV102'),
		('lop07', 'SV102'),
		('lop08', 'SV102'),
		('lop09', 'SV201'),
		('lop10', 'SV201'),
		('lop11', 'SV201')
GO

-- Tạo Procedure
create procedure sp_danhsachlop_GV(@sGiangvienID varchar(50))
as
	select * from tblLop
	where sGiangVienId = @sGiangvienID
GO

create procedure sp_Buoihoc_Lop(@sLopID varchar(50))
as
	select * from tblBuoihoc
	where sLopId = @sLopID
GO

create procedure sp_Dangnhap(@sAccount varchar(50), @sPassword varchar(50))
as
	select sAccount,stenQuyen  
	from  tblTaiKhoan,tblQuyen 
	where sAccount = @sAccount and @sPassword=sPassword and tblTaiKhoan.iMaQuyen = tblQuyen.iMaQuyen
GO

create procedure spDoimatkhau(@sAccount varchar(50), @sOldPassword varchar(50), @sNewPassword varchar(50))
as 
	update tblTaiKhoan
	set sPassword = @sNewPassword
	where sAccount = @sAccount and sPassword = @sOldPassword
GO
/*
create procedure sp_Dangky(@sAccount varchar(50), @sPassword varchar(50), @iMaQuyen int)
as
	insert into tblTaiKhoan(sAccount, sPassword, iMaQuyen)
	values (@sAccount, @sPassword, @iMaQuyen)
Go

create procedure sp_Them_SV(@sSinhvienID varchar(50), @sTen nvarchar(50), @sGioitinh nvarchar(50), @dNgaysinh datetime, @sDiachi nvarchar(50), @sEmail varchar(50), @sCMND varchar(50), @sSDT varchar(10))
as
	insert into tblSinhVien(sSinhVienId, sTen, sGioitinh, dNgaysinh, sDiachi, sEmail, sCmnd, sSodienthoai)
	values (@sSinhvienID, @sTen, @sGioitinh, @dNgaysinh, @sDiachi, @sEmail, @sCMND, @sSDT)
GO

create procedure sp_SV_Lop(@sSinhvienID varchar(50), @sLopID varchar(50))
as
	insert into tblDanhsach_SV_Lop(sLopId, sSinhVienId)
	values (@sLopID, @sSinhvienID)
GO
*/

create procedure sp_GV_Infor(@sGiangvienID varchar(50))
as
	select * from tblGiangVien
	where sGiangVienId = @sGiangvienID
GO

create procedure sp_SV_Lop(@sLopID varchar(50), @sSinhVienID varchar(50))
as
	insert into tblDanhsach_SV_Lop(sLopId, sSinhVienId)
	values(@sLopID, @sSinhVienID)
GO

create proc sp_themgiangvien(
	@sGiangVienId varchar(50),
	@sTen nvarchar(50) ,
	@sGioitinh nvarchar(50),
	@dNgaysinh datetime ,
	@sDiachi nvarchar(50) ,
	@sEmail varchar(50) ,
	@sCmnd varchar(50) ,
	@sSodienthoai varchar (10),
	@sBangcap nvarchar(50)
)
as
	insert into tblGiangVien(sGiangVienId,sTen,sGioitinh,dNgaysinh,sDiachi,sEmail,sCmnd,sSodienthoai,sBangcap,sAccount)
	values(@sGiangvienid,@sTen,@sGioitinh,@dNgaysinh,@sDiachi,@sEmail,@sCmnd,@sSodienthoai,@sBangcap,@sGiangVienId)
GO

create proc sp_creatAccount(@sAccount varchar(50),@sPassword varchar(50),@iMaquyen int)
as
	insert into tblTaiKhoan(sAccount,sPassword,iMaQuyen)
	values(@sAccount,@sPassword,@iMaquyen)
GO

create proc sp_themsinhvien(
	@sSinhVienId varchar(50),
	@sTen nvarchar(50) ,
	@sGioitinh nvarchar(50),
	@dNgaysinh datetime ,
	@sDiachi nvarchar(50) ,
	@sEmail varchar(50) ,
	@sCmnd varchar(50) ,
	@sSodienthoai varchar (10)
)
as
	insert into tblSinhVien(sSinhVienId,sTen,sGioitinh,dNgaysinh,sDiachi,sEmail,sCmnd,sSodienthoai,sAccount)
	values(@sSinhVienId,@sTen,@sGioitinh,@dNgaysinh,@sDiachi,@sEmail,@sCmnd,@sSodienthoai,@sSinhVienId)
GO

create procedure sp_themlop(@sLopId varchar(50), @sTenLop nvarchar(50), @sQuanLyId varchar(50), @sGiangVienId varchar(50), @sMonHocId varchar(50))
as
	insert into tblLop(sLopId, sTenLop, sQuanLyId, sGiangVienId, sMonHocId)
	values(@sLopId, @sTenLop, @sQuanLyId, @sGiangVienId, @sMonHocId)
GO

create procedure sp_DS_Lop
as
	select tblLop.sLopId, sTenLop, tblLop.sGiangVienId, tblGiangVien.sTen, COUNT(tblSinhVien.sSinhVienId) as "Số lượng sinh viên"
	from tblLop, tblSinhVien, tblDanhsach_SV_Lop, tblGiangVien
	where tblLop.sLopId = tblDanhsach_SV_Lop.sLopId and tblSinhVien.sSinhVienId = tblDanhsach_SV_Lop.sSinhVienId and tblLop.sGiangVienId = tblGiangVien.sGiangVienId
	group by tblLop.sLopId, sTenLop, tblLop.sGiangVienId, tblGiangVien.sTen
GO

create procedure sp_gv_capnhatbuoihoc(
	@id int,
	@tieude nvarchar(100),
	@sNoidung nvarchar(100),
	@sTepdinhkem varchar(50),
	@sTrangThai nvarchar(10)
)
as
	update tblBuoiHoc 
	set sTieuDe = @tieude, sNoiDung = @sNoidung, stepdinhkem = @sTepdinhkem, sTrangThai = @sTrangThai
	where iBuoiHocId = @id
GO

create procedure sp_XoaLop(@id varchar(50))
as
	delete from tblLop
	where sLopId = @id
GO

insert into tblBuoiHoc(dThoiGian, sTieuDe, sNoidung, sLopId, sTrangThai, sthoigianbatdau, sthoigianketthuc, sTepdinhkem)
values	('2000-5-02', N'Bài học đầu tiên', N'Hello World', 'lop01', N'Học', '7h15', '11h', N'husky.jpg'),
		('2000-5-02', N'Đạo hàm và tích phân', N'Test', 'lop02', N'Học', '7h15', '11h', N'husky.jpg')
GO

select * from tblDanhsach_SV_Lop
select * from tblLop
SELECT sLopId from tblLop
go

insert into tblDanhsach_SV_Lop(sLopId, sSinhVienId) 
values  ('lop02', 'SV201')
go

delete from tblDanhsach_SV_Lop where sLopId = 'lop02' and sSinhVienId = 'SV201'
go

create procedure sp_XoaSV(@id varchar(50), @acc varchar(50))
as
	delete from tblTaiKhoan where tblTaiKhoan.sAccount = @acc 
	delete from tblDanhsach_SV_Lop where tblDanhsach_SV_Lop.sSinhVienId = @id
	delete from tblDiemDanh where tblDiemDanh.sSinhVienId = @id
	delete from tblSinhVien where tblSinhVien.sSinhVienId = @id
	select * from tblSinhVien
go

create proc sp_lop_sv(@userid varchar(50))
as
	--select * from tblLop,tblDanhsach_SV_Lop where tblLop.sLopId = tblDanhsach_SV_Lop.sLopId 
	select tblLop.sLopId, sTenLop 
	from tblLop,tblDanhsach_SV_Lop 
	where tblLop.sLopId = tblDanhsach_SV_Lop.sLopId and tblDanhsach_SV_Lop.sSinhVienId = @userid; 
go

create proc sp_Themthaoluan(
	@sNoidung nvarchar(max),
	@dNgay date,
	@sAccount varchar(10),
	@sLopid varchar(10)
)
as
	insert into tblThaoluanchung(sNoidung,dNgay,sAccount,sLopid)
	values(@sNoidung,@dNgay,@sAccount,@sLopid);

	select * from tblThaoluanchung;
GO

create proc sp_Danhsachdiemdanh(@lopId varchar(50), @buoihocId int)
as
	select * from tblSinhVien
	where tblSinhVien.sSinhVienId 
	in
		(select tblDanhsach_SV_Lop.sSinhVienId 
		 from tblDanhsach_SV_Lop, tblDiemDanh
		 where tblDanhsach_SV_Lop.sSinhVienId = tblDiemDanh.sSinhVienId and tblDanhsach_SV_Lop.sLopId = @lopId and tblDiemDanh.iBuoiHocId = @buoihocId)
go

create proc sp_suagiangvien(
	@gvId nvarchar(50),
	@sTen nvarchar(50) ,
	@sGioitinh nvarchar(50),
	@dNgaysinh datetime ,
	@sDiachi nvarchar(50) ,
	@sEmail varchar(50) ,
	@sCmnd varchar(50) ,
	@sSodienthoai varchar (10),
	@sBangcap nvarchar(50)
)
as
	update tblGiangVien
	set sTen = @sTen, sGioitinh = @sGioitinh, sDiachi = @sDiachi, sEmail = @sEmail, sSodienthoai = @sSodienthoai, sBangcap = @sBangcap
	where sGiangVienId = @gvId
GO 

drop proc sp_suagiangvien
insert into tblDiemDanh
values ('DD1', 2, 'SV201', 'Test', 1)
go


insert into tblSinhVien(sSinhVienId,sTen,sGioitinh,dNgaysinh,sDiachi,sEmail,sCmnd,sSodienthoai,sAccount)
values	('SV201',N'Nguyễn Thúy Nga',N'nữ','2000-5-02',N'Thái Bình','meocon@gmail.com','263935751','0900419175','SV201');
GO
insert into tblTaiKhoan(sAccount,sPassword,iMaQuyen)
values	('SV201','123456789',3)
GO

insert into tblDiemDanh
values(1, 'SV102', 0)
go

select tblLop.sLopId, count(tblSinhVien.sSinhVienId) 
from tblDanhsach_SV_Lop, tblLop, tblSinhVien 
where tblLop.sLopId = tblDanhsach_SV_Lop.sLopId and tblDanhsach_SV_Lop.sSinhVienId = tblSinhVien.sSinhVienId
group by tblLop.sLopId
go
select * from tblLop
select * from tblDanhsach_SV_Lop
select * from tblSinhVien
select * from tblTaiKhoan
select * from tblMonhoc
select * from tblDiemDanh
select * from tblBuoiHoc
select * from tblQuyen
select * from tblGiangVien
select * from tblThaoluanchung
select tblLop.sLopId, sTenLop from tblLop,tblDanhsach_SV_Lop where tblLop.sLopId = tblDanhsach_SV_Lop.sLopId and tblDanhsach_SV_Lop.sSinhVienId = 'SV102'

update tblDiemDanh set bDiemDanh = 1

select * from tblSinhvien 
where tblSinhVien.sSinhVienId 
in (
	select tblDanhsach_SV_Lop.sSinhVienId 
	from tblDanhsach_SV_Lop,tblDiemDanh 
	where  tblDiemDanh.sSinhVienId=tblDanhsach_SV_Lop.sSinhVienId
	and tblDanhsach_SV_Lop.sLopId= 'lop01' and tblDiemdanh.ibuoihocid=1 );
