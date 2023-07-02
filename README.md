### DatabaseSecurity
# Giới thiệu
- Bài tập cá nhân và bài tập nhóm của môn Bảo mật cơ sở dữ liệu.

# Mô tả
**1. Lab 1: Cài đặt MySQL**
- Cài đặt MySQL cho máy và quay lại quá trình.

**2. Lab 2: Phân quyền cho các user**
- Lab cá nhân: Phân quyền cho các user có được thao tác trên cơ sở dữ liệu hay không.
- Lab nhóm: Phân quyền cho các user, test các stored procedure.

**3. Lab 3: Mã hóa dữ liệu bằng thuật toán mã hóa đối xứng**
- Lab cá nhân: tạo winform C# đăng nhập, mã hóa mật khẩu đăng nhập trong database với thuật toán mã hóa MD5.
- Lab nhóm: tạo winform C# đăng nhập và quản lý điểm sinh viên. 
    + Đăng nhập có tính năng phân biệt giữa nhân viên quản lý và sinh viên.
    + Màn hình quản lý lớp: cho phép hiển thị danh sách các lớp. Ngoài ra còn có thêm hoặc xóa lớp.
    + Màn hình quản lý sinh viên: cho phép nhân viên quản lý lớp sinh viên có thể thay đổi thông tin sinh viên của lớp đó.
    + Màn hình nhập điểm: cho phép nhập điểm của sinh viên ở từng học phần khác nhau. Điểm sẽ được mã hóa bằng RSA 512 và lưu vào database.

**4. Lab 4: Mã hóa dữ liệu từ client sử dụng các thuật toán mã hóa đối xứng**
- Lab cá nhân: tạo winform C# hiển thị lên danh sách các nhân viên, cho phép tạo tài khoản trên đó. Mật khẩu sẽ được nhập vào trên client và được mã hóa bằng MD5 sau đó mới được lưu vào database với mật khẩu đã được mã hóa. Lương cũng sẽ được nhập từ client và sẽ được mã hóa bằng AES với cipher mode là CBC và padding là Zeros.
- Lab nhóm: có các thành phần như lab cá nhân, thêm các chức năng quản lý lớp, quản lý sinh viên và quản lý điểm.

**5. Lab 5: Mã hóa dữ liệu trong suốt Transparent data encryption - TDE**
- Lab cá nhân: TDE sử dụng với mục đích người không phải quản trị, không nắm key sẽ không khôi phục được database nếu như có file back up hay file mdf.

# Lời cảm ơn
- Cảm ơn NTLong, NQHuy, PTKiet là những người bạn đồng hành để làm tốt những bài tập một cách hoàn hảo nhất <3.