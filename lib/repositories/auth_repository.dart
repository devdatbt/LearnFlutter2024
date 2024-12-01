import 'package:dio/dio.dart';

//AuthRepository chứa các phương thức giao tiếp với API từ backend (sử dụng Dio).
//Tách biệt logic giao tiếp API khỏi Bloc hoặc UI, giúp dễ dàng bảo trì và test.
class AuthRepository {
  final Dio _dio = Dio();

  Future<bool> login(String username, String password) async {
    try {
      final response = await _dio.post(
        'https://example.com/api/login', // Thay bằng endpoint API thật
        data: {
          'username': username,
          'password': password,
        },
      );

      // Kiểm tra nếu đăng nhập thành công (HTTP 200)
      if (response.statusCode == 200) {
        // Xử lý thêm nếu cần, như lưu token
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      // Bắt lỗi API hoặc network
      if (e.response != null) {
        print('Error: ${e.response?.data}');
        print('Status code: ${e.response?.statusCode}');
      } else {
        print('Error: ${e.message}');
      }
      return false;
    }
  }
}
