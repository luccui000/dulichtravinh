create table TaiKhoan (
	Id int identity(1, 1) primary key,
	TenDangNhap varchar(30),
	MatKhau varchar(50),
	HoTen nvarchar(50),
	Email varchar(30),
	SoDienThoai varchar(11),
	Role int default 0,
	Status int default 1
)

create table BanDich (
	Id int identity(1, 1) primary key,
	TenBanDich nvarchar(50),
)

create table DiaDiem (
	Id int identity(1, 1) primary key, 
	DiaChi nvarchar(100),
	KinhDo float,
	ViDo float,
	NgayTao Date,
	NguoiTao int,
	foreign key (NguoiTao) references TaiKhoan(Id)
)
create table BanDich_DiaDiem (
	DiaDiemId int,
	BanDichId int,
	TenDiaDiem nvarchar(100),
	MoTa Text,
	primary key (DiaDiemId, BanDichId),
	foreign key (DiaDiemId) references DiaDiem(Id),
	foreign key (BanDichID) references BanDich(Id)
)

create table HinhAnh (
	Id int identity(1, 1) primary key, 
	DuongDan varchar(100), 
	NgayTao date,
	NguoiTao int,
	foreign key (NguoiTao) references TaiKhoan(Id)
)
create table BanDich_HinhAnh (
	HinhAnhId Int,
	BanDichId int,
	TenHinhAnh nvarchar(100),
	MoTa text,
	primary key(HinhAnhId, BanDichId),
	foreign key (HinhAnhId) references HinhAnh(Id),
	foreign key (BanDichId) references BanDich(Id),
)

create table DichVu (
	Id int identity(1, 1) primary key,
	Gia float,
	Website varchar(200),
	SoDienThoai varchar(40),
	DiaChi nvarchar(100)
)

create table BanDich_DichVu (
	DichVuId int,
	BanDichId int,
	TenSanPham nvarchar(100),
	MoTaSanPham text,
	ThanhPhan text,
	primary key(DichVuId, BanDichId),
	foreign key (DichVuId) references DichVu(Id),
	foreign key (BanDichId) references BanDich(Id),
)