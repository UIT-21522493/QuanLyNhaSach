CREATE TABLE KhachHang
(
	Id INTEGER NOT NULL,
	HoTen VARCHAR(255) NOT NULL,
	DiaChi VARCHAR(255),
	DienThoai INTEGER,
	Email VARCHAR(255),
	TienNo MONEY,
	CONSTRAINT PK_KH PRIMARY KEY (Id)
)

CREATE TABLE Sach
(
	Id INTEGER NOT NULL,
	TenSach VARCHAR(255),
	TheLoai VARCHAR(255),
	TacGia VARCHAR(255),
	SoLuongTon INTEGER,
	DonGiaBan FLOAT,
	DonGiaNhap FLOAT,
	CONSTRAINT PK_Sach PRIMARY KEY (Id)
)

CREATE TABLE PhieuThuTIen
(
	Id INTEGER NOT NULL,
	IdKhachHang INTEGER NOT NULL,
	NgayThuTien DATE,
	SoTienThu MONEY,
	CONSTRAINT PK_PhieuThuTIen PRIMARY KEY (Id)
)

CREATE TABLE HoaDon
(
	Id INTEGER NOT NULL PRIMARY KEY,
	NgayLap DATE NOT NULL,
	TongTien MONEY NOT NULL
)	

CREATE TABLE ChiTietHoaDon
(
	Id INTEGER NOT NULL,
	IdKhachHang INTEGER NOT NULL,
	IdSach INTEGER NOT NULL,
	SoLuongBan INTEGER,
	DonGiaBan MONEY,
	ThanhTien MONEY,
	TienTra MONEY,
	CONSTRAINT PK_CTHD PRIMARY KEY (Id,IdKhachHang,IdSach)
)

CREATE TABLE PhieuNhapSach
(
	Id INTEGER NOT NULL PRIMARY KEY,
	NgayNhap DATE
)

CREATE TABLE ChiTietPhieuNhap
(
	Id INTEGER  NOT NULL,
	IdSach INTEGER NOT NULL,
	SoLuongNhap INTEGER NOT NULL,
	DonGiaNhap MONEY NOT NULL,
	CONSTRAINT PK_ChiTietPhieuNhap PRIMARY KEY (Id,IdSach)
)

CREATE TABLE BAOCAOTON
(
	Thang INTEGER NOT NULL,
	Nam INTEGER NOT NULL,
	MaSach INTEGER NOT NULL,
	TonDau MONEY,
	PhatSinh MONEY,
	TonCuoi MONEY,
	CONSTRAINT PK_BAOCAOTON PRIMARY KEY (Thang,Nam,MaSach)
)
CREATE TABLE BAOCAOCONGNO
(
	Thang INTEGER NOT NULL,
	Nam INTEGER NOT NULL,
	MaKH INTEGER NOT NULL,
	NoDau MONEY,
	PhatSinh MONEY,
	NoCuoi MONEY,
	CONSTRAINT PK_BAOCAOCONGNO PRIMARY KEY (Thang,Nam,MaKH)
)
CREATE TABLE QuyDinh
(
	Id INTEGER NOT NULL,
	TenQuyDinh VARCHAR(255),
	GiaTri INTEGER,
	KieuDuLieu VARCHAR(255),
	TinhTrangSuDung VARCHAR(255),
	CONSTRAINT PK_QUYDINH PRIMARY KEY (Id)
)

CREATE TABLE TaiKhoan
(
	TenDangNhap VARCHAR(255),
	MatKhau VARCHAR(255)
)

INSERT INTO KhachHang VALUES (1, 'Huỳnh Chí Phong', '792/4 đường Kha Vạn Cân, phường Linh Đông, quận Thủ Đức, tp Hồ Chí Minh', 01203875665, 'phong12345@gmail.com', 120000);
INSERT INTO KhachHang VALUES (2, 'Võ Hoài Nam', '296 Tô Ngọc Vân, phường Linh Đông, quận Thủ Đức, tp Hồ Chí Minh', 0909928956, 'namksqt@gmail.com', 0);
INSERT INTO KhachHang VALUES (3, 'Tô Chính Tín', 'ký túc xá khu A, phường Linh Trung, quận Thủ Đức, tp Hồ Chí Minh', 01694254261, 'tinchiiu@gmail.com', 200000);
INSERT INTO KhachHang VALUES (4, 'Lãnh Thừa Phong', 'ký túc xá khu A, phường Linh Trung, quận Thủ Đức, tp Hồ Chí Minh', 0946330245, 'thuaphong@gmail.com', 300000);
INSERT INTO KhachHang VALUES (5, 'Lý Thất Dạ', '7b/5 Thành Thái, quận 10, tp Hồ Chí Minh', 0369001344, 'nhedacatin@gmail.com', 0);
INSERT INTO KhachHang VALUES (6, 'Mai Thị Lan Chi', '10 Nguyễn Thị Minh Khai, quận 1, tp Hồ Chí Minh', 0905880148, 'chidepgai@gmail.com', 0);
INSERT INTO KhachHang VALUES (7, 'Nguyễn Hoàng Nam', 'Tòa nhà Biteco, quận 1, tp Hồ Chí Minh', 0977422748, 'namtxqt@gmail.com', 520000);
INSERT INTO KhachHang VALUES (8, 'Nguyễn Minh Đức', '16 Nguyễn Gia Trí, quận Bình Thạnh, tp Hồ Chí Minh', 0908536542, 'duccuto@gmail.com', 90000);
INSERT INTO KhachHang VALUES (9, 'Lưu Thị Liên', '24 Khuông Việt, quận Tân Bình, tp Hồ Chí Minh', 0745124524, 'lienha@gmail.com', 50000);
INSERT INTO KhachHang VALUES (10, 'Nguyễn Trần Trung Đan', '16 Bạch Đằng, quận Tân BÌnh, tp Hồ Chí Minh', 0356206309, 'dantay@gmail.com', 100000);


INSERT INTO TheLoai VALUES (1, 'Trinh Thám');
INSERT INTO TheLoai VALUES (2, 'Kinh dị');
INSERT INTO TheLoai VALUES (3, 'Sách Giáo Khoa');
INSERT INTO TheLoai VALUES (4, 'Lãng Mạng');
INSERT INTO TheLoai VALUES (5, 'Học Trò');
INSERT INTO TheLoai VALUES (6, 'Thiếu Nhi');
INSERT INTO TheLoai VALUES (7, 'Thể Thao');
INSERT INTO TheLoai VALUES (8, 'Hư Cấu');
INSERT INTO TheLoai VALUES (9, 'Truyện Tranh');
INSERT INTO TheLoai VALUES (10, 'Ngôn Tình');
INSERT INTO TheLoai VALUES (11, 'Khoa Học Giả Tưởng');
INSERT INTO TheLoai VALUES (12, 'Sách Học Ngoại Ngữ');
INSERT INTO TheLoai VALUES (13, 'Sách Thường Thức - Đời Sống');
INSERT INTO TheLoai VALUES (14, 'Sách Văn Học - Truyện Ngắn - Tiểu Thuyết');
INSERT INTO TheLoai VALUES (15, 'Từ Điển');	

INSERT INTO Sach VALUES (1, 'Kính Vạn Hoa', 'Học Trò', 'Nguyễn Nhật Ánh', 342, 30000, 20000);
INSERT INTO Sach VALUES (2, 'Mật mã Da Vinci', 'Trinh Thám', 'Dan Brown', 52, 200000, 100000);
INSERT INTO Sach VALUES (3, 'Sherlock Holmes', 'Trinh Thám', 'Arthur Conan Doyle', 100, 1000000, 500000);
INSERT INTO Sach VALUES (4, 'Sự im lặng của bầy cừu', 'Trinh Thám', 'Thomas Harris', 112, 300000, 200000);
INSERT INTO Sach VALUES (5, 'Tấm Vải Đỏ', 'Kinh dị', 'Hồng Nương Tử', 13, 500000, 200000);
INSERT INTO Sach VALUES (6, 'Địa Ngục Tầng Thứ 19', 'Kinh dị', 'Sái Tuấn', 50, 300000, 200000);	
INSERT INTO Sach VALUES (7, 'Người Tìm Xác', 'Học Trò', 'Lạc Lâm Lang', 90, 50000, 20000);
INSERT INTO Sach VALUES (8, 'Toán 11', 'Sách Giáo Khoa', 'Bộ Giáo dục và Đào tạo', 100, 15000, 10000);
INSERT INTO Sach VALUES (9, 'Ngữ Văn 12', 'Sách Giáo Khoa', 'Bộ Giáo dục và Đào tạo', 302, 10000, 7000);
INSERT INTO Sach VALUES (10, 'Tiếng Anh 11', 'Sách Giáo Khoa', 'Bộ Giáo dục và Đào tạo', 200, 15000, 10000);
INSERT INTO Sach VALUES (11, 'Trà Hoa Nữ', 'Lãng Mạng', 'Alexandre Dumas', 301, 300000, 200000);
INSERT INTO Sach VALUES (12, 'Gọi Em Bằng Tên Anh', 'Lãng Mạng', 'André Aciman', 222, 30000, 20000);
INSERT INTO Sach VALUES (13, 'Rừng Nauy', 'Lãng Mạng', 'Haruki Murakami', 190, 300000, 200000);
INSERT INTO Sach VALUES (14, 'Cho tôi xin một vé đi tuổi thơ', 'Học Trò', 'Nguyễn Nhật Ánh', 342, 300000, 150000);
INSERT INTO Sach VALUES (15, 'Chiến binh cầu vồng', 'Học Trò', 'Andrea Hirata', 524, 300000, 200000);
INSERT INTO Sach VALUES (16, 'Năm tháng vội vã', 'Học Trò', 'Nguyễn Nhật Ánh', 195, 300000, 200000);
INSERT INTO Sach VALUES (17, 'Ubik', 'Khoa Học Giả Tưởng', 'Philip K. Dick', 321, 320000, 260000);
INSERT INTO Sach VALUES (18, 'Dune', 'Khoa Học Giả Tưởng', 'Frank Herbert', 412, 300000, 200000);
INSERT INTO Sach VALUES (19, 'Labyrinths', 'Khoa Học Giả Tưởng', 'Jorge Luis Borges', 246, 300000, 200000);
INSERT INTO Sach VALUES (20, '1984', 'Khoa Học Giả Tưởng', 'George Orwell', 123, 300000, 200000);

INSERT INTO PhieuThuTIen VALUES (1, 1, '2023/1/26', 100000);
INSERT INTO PhieuThuTIen VALUES (2, 2, '2023/1/26', 300000);
INSERT INTO PhieuThuTIen VALUES (3, 3, '2023/1/26', 150000);
INSERT INTO PhieuThuTIen VALUES (4, 1, '2023/2/12', 2000000);
INSERT INTO PhieuThuTIen VALUES (5, 5, '2023/2/12', 100000);
INSERT INTO PhieuThuTIen VALUES (6, 7, '2023/2/12', 90000);
INSERT INTO PhieuThuTIen VALUES (7, 8, '2023/3/6', 80000);
INSERT INTO PhieuThuTIen VALUES (8, 3, '2023/3/6', 120000);
INSERT INTO PhieuThuTIen VALUES (9, 2, '2023/3/6', 100000);
INSERT INTO PhieuThuTIen VALUES (10, 9, '2023/3/26', 200000);



INSERT INTO PhieuNhapSach VALUES (1, '2022/12/20');
INSERT INTO PhieuNhapSach VALUES (2, '2023/1/2');
INSERT INTO PhieuNhapSach VALUES (3, '2023/1/15');
INSERT INTO PhieuNhapSach VALUES (4, '2023/2/2');
INSERT INTO PhieuNhapSach VALUES (5, '2023/2/15');

INSERT INTO ChiTietPhieuNhap VALUES (1, 1, 200, 20000);
INSERT INTO ChiTietPhieuNhap VALUES (1, 2, 30, 100000);
INSERT INTO ChiTietPhieuNhap VALUES (1, 3, 50, 500000);
INSERT INTO ChiTietPhieuNhap VALUES (2, 4, 50, 200000);
INSERT INTO ChiTietPhieuNhap VALUES (2, 8, 200, 10000);
INSERT INTO ChiTietPhieuNhap VALUES (3, 1, 50, 20000);
INSERT INTO ChiTietPhieuNhap VALUES (3, 9, 200, 7000);
INSERT INTO ChiTietPhieuNhap VALUES (4, 18, 100, 200000);
INSERT INTO ChiTietPhieuNhap VALUES (5, 19, 100, 200000);

INSERT INTO BAOCAOTON VALUES (3, 2023, 1, 50, 20, 70);
INSERT INTO BAOCAOTON VALUES (2, 2023, 4, 50, 20, 70);

INSERT INTO BAOCAOCONGNO VALUES (2, 2023, 1, 200, 0, 200);

INSERT INTO QUYDINH VALUES (150, 300, 20000, 105, 100000);

INSERT INTO TaiKhoan VALUES ('ron2866', '123456')


ALTER TABLE ChiTietHoaDon ADD 
CONSTRAINT FK_CTHD_HOADON FOREIGN KEY (Id) REFERENCES HoaDon(Id)
ALTER TABLE ChiTietHoaDon ADD 
CONSTRAINT FK_CTHD_KhachHang FOREIGN KEY (IdKhachHang) REFERENCES KhachHang(Id)
ALTER TABLE ChiTietHoaDon ADD 
CONSTRAINT FK_CTHD_Sach FOREIGN KEY (IdSach) REFERENCES Sach(Id)

ALTER TABLE ChiTietPhieuNhap ADD 
CONSTRAINT FK_ChiTietPhieuNhap_PhieuNhapSach FOREIGN KEY (Id) REFERENCES PhieuNhapSach(Id)
ALTER TABLE ChiTietPhieuNhap ADD 
CONSTRAINT FK_ChiTietPhieuNhap_Sach FOREIGN KEY (IdSach) REFERENCES Sach(Id)

ALTER TABLE PhieuThuTIen ADD 
CONSTRAINT FK_PhieuThuTIen_KHACHANG FOREIGN KEY (IdKhachHang) REFERENCES KhachHang(Id)

ALTER TABLE BAOCAOTON ADD 
CONSTRAINT FK_BAOCAOTON_Sach FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)

ALTER TABLE BAOCAOCONGNO ADD CONSTRAINT FK_MaKH_BAOCAOCONGNO_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
