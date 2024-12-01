import 'package:flutter/material.dart';
import 'views/login_view.dart';
import 'views/home_view.dart';

class AppRouter {
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';

  ///Hàm này được gọi khi điều hướng (Navigator.pushNamed) để trả về một Route.
  // Tùy theo settings.name, trả về các màn hình tương ứng.
  // Route mặc định hiển thị thông báo "404 - Page Not Found" khi tên route không được định nghĩa.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('404 - Page Not Found'),
            ),
          ),
        );
    }
  }
}