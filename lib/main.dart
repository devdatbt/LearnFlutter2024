import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_router.dart';
import 'getit/service_locator.dart';
import 'blocs/login_bloc.dart';

void main() {
  //Khởi chạy GetIt trước khi ứng dụng chạy.
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      initialRoute: AppRouter.loginRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
      builder: (context, child) {
        return BlocProvider(
          //Lấy instance của LoginBloc từ GetIt.
          create: (_) => getIt<LoginBloc>(),
          child: child!,
        );
      },
    );
  }
}

/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      initialRoute: AppRouter.loginRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
      builder: (context, child) {
        //Cung cấp AuthRepository toàn cục bằng cách sử dụng RepositoryProvider.
        return RepositoryProvider(
          create: (context) => AuthRepository(),
          child: BlocProvider(
            //LoginBloc nhận AuthRepository từ RepositoryProvider qua context.read<AuthRepository>().
            create: (context) =>
                LoginBloc(authRepository: context.read<AuthRepository>()),
            child: child!,
          ),
        );
      },
    );
  }
}*/
  ///Tổng kết quy trình
// 1.UI (LoginView):
// Gửi event LoginSubmitted khi người dùng nhấn nút Login.

// 2.Bloc (LoginBloc):
// Nhận event LoginSubmitted, gọi phương thức login từ AuthRepository.

// 3.Repository (AuthRepository):
// Thực hiện HTTP POST request để gọi API.
// Trả về kết quả đăng nhập (thành công hoặc thất bại).

// 4.Bloc:
// Phát ra state (LoginSuccess hoặc LoginFailure) dựa trên kết quả.

// 5.UI:
// Lắng nghe state và hiển thị thông báo hoặc chuyển hướng đến HomeView.
