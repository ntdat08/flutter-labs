# Flutter Mobile Development Labs

Repository tổng hợp 9 bài thực hành phát triển ứng dụng di động đa nền tảng bằng Flutter & Dart, đi từ các thành phần UI cơ bản, quản lý trạng thái (State Management) đến xử lý lập trình bất đồng bộ và tích hợp RESTful API.

---

## Danh sách các bài Lab (Projects overview)

| Lab # | Tên dự án | Khái niệm & công nghệ trọng tâm | Mô tả | Tài liệu |
| :---: | :--- | :--- | :--- | :---: |
| **Lab 1** | **I Am Rich** | Khởi tạo dự án, Material Design căn bản, Scaffold, AppBar, quản lý ảnh Asset | Hiển thị tiêu đề "I Am Rich" cùng hình ảnh viên kim cương ở chính giữa màn hình | [README](./lab1_i_am_rich/README.md) |
| **Lab 2** | **MiCard** | Bố cục Column, SafeArea, CircleAvatar, Card, ListTile | Profile cá nhân dạng danh thiếp kỹ thuật số cùng avatar và các thông tin liên lạc cơ bản | [README](./lab2_mi_card/README.md) |
| **Lab 3** | **Dicee** | Quản lý trạng thái (`StatefulWidget`, `setState`), xử lý ngẫu nhiên (`dart:math`), `Expanded`, `Row` | Mô phỏng việc gieo 2 viên xúc xắc ngẫu nhiên khi chạm vào màn hình hoặc bấm nút | [README](./lab3_dice/README.md) |
| **Lab 4** | **Magic 8 Ball** | Quản lý trạng thái, hoán đổi hình ảnh ngẫu nhiên, bắt sự kiện click | Mô phỏng quả cầu tiên tri; khi nhấn vào quả bóng, các câu trả lời ("Yes", "No", "Ask again later"...) sẽ thay đổi ngẫu nhiên | [README](./lab4_magic_8_ball/README.md) |
| **Lab 5** | **Xylophone** | Tích hợp package bên ngoài, phát âm thanh, tái sử dụng UI theo nguyên tắc DRY | Mô phỏng cây đàn Xylophone gồm 7 phím màu sắc phát ra 7 nốt nhạc tương ứng khi chạm vào | [README](./lab5_xylophone/README.md) |
| **Lab 6** | **Quizzler** | OOP trong Dart (`Question`, `QuizBrain`), tính đóng gói (encapsulation), danh sách tiến độ, `AlertDialog` | Trò chơi đố vui với hai lựa chọn Đúng / Sai, tự động theo dõi lịch sử kết quả và thông báo điểm tổng kết khi kết thúc | [README](./lab6_quizzler/README.md) |
| **Lab 7** | **Destini** | Xây dựng câu chuyện phân nhánh (Branching Story Logic), ẩn/hiện nút tương tác bằng `Visibility` | Ứng dụng mô phỏng cốt truyện phiêu lưu tương tác với nhiều lựa chọn dẫn đến các kết thúc khác nhau | [README](./lab7_destini/README.md) |
| **Lab 8** | **BMI Calculator** | Cấu trúc code đa module, Custom Widgets, `SliderTheme`, điều hướng màn hình (`Navigator`), Dark Theme | Máy tính chỉ số khối cơ thể (BMI) với giao diện Dark Mode hiện đại; tùy chỉnh chiều cao qua Slider, cân nặng/tuổi và đưa ra đánh giá sức khỏe | [README](./lab8_bmi_calculator/README.md) |
| **Lab 9** | **Clima** | Bất đồng bộ (`async`/`await`), gọi RESTful API từ OpenWeatherMap, giải mã JSON, hiển thị chỉ số thời tiết chi tiết | Ứng dụng thời tiết theo dõi nhiệt độ, độ ẩm, sức gió và dự báo theo vị trí hiện tại hoặc tìm kiếm theo tên thành phố | [README](./lab9_clima/README.md) |

---

## Công nghệ & môi trường phát triển

- **Framework**: Flutter (Dart SDK)
- **IDE**: Visual Studio Code / Android Studio
- **Nền tảng kiểm thử**: Google Chrome (Web), Android Emulator, Windows Desktop
- **Các thư viện chính sử dụng**:
  - `http`: Gọi các giao thức mạng RESTful API.
  - `intl`: Định dạng ngày giờ và số liệu hiển thị.
  - `audioplayers`: Phát và xử lý tệp âm thanh asset.

---

## Hướng dẫn cài đặt & chạy các bài lab

### 1. Clone repository về máy
```bash
git clone git@github.com:ntdat08/flutter-labs.git
cd flutter-labs
```

### 2. Chạy từng bài Lab
```bash
# Di chuyển vào thư mục bài lab muốn chạy (ví dụ lab9_clima)
cd lab9_clima

# Cài đặt thư viện và khởi chạy
flutter pub get
flutter run -d chrome
```
