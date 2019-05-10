create database QLNS
go
use QLNS
go

create table PhongBan(
MaPB bigint identity primary key,
TenPN nvarchar(50) not null,
MaTP bigint,
NgayNhanChuc date,
TongNV bigint
)

go
create table NhanVien(
MaNV bigint identity primary key,
HoTen nvarchar(50) not null,
QueQuan nvarchar(100),
NgaySinh date,
email varchar(50),
MaPB bigint references PhongBan(MaPB),
CMT nvarchar(20) not null,
SDT char(10) 
)
go

create table LuongCoBan(
MaLCB bigint identity primary key,
Luong money
)
go

create table ChiTietLuong(
MaNV bigint references NhanVien(MaNV),
MaLCB bigint references LuongCoBan(MaLCB),
TienBaoHiem money,
Luong money,
TongSoNgay int,
TongSoDem int,
primary key(MaNV,MaLCB)
)

go

create table ThanNhan(
MaTN bigint identity primary key,
HoTen nvarchar(50) not null,
NgaySinh date,
SDT char(10),
MaNV bigint references NhanVien(MaNV)
)

go

create table Ca(
MaCa bit primary key,
TenCa nvarchar(30)
)

go

create table ChamCong(
MaChamCong bigint identity primary key,
Ngay date,
MaCa bit references Ca(MaCa),
MaNV bigint references NhanVien(MaNV)
)

go

create table NguoiDung(
MaND bigint primary key,
MatKhau nvarchar(20)
)

go

create table NhatKy(
MaNK bigint identity primary key,
MaND bigint references NguoiDung(MaND),
Ngay datetime not null
)