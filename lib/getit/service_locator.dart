import 'package:get_it/get_it.dart';

import '../blocs/login_bloc.dart';
import '../repositories/auth_repository.dart';

//Sử dụng một instance của GetIt để quản lý dependency.
final getIt = GetIt.instance;
void setupServiceLocator() {
  // Đăng ký AuthRepository
  //AuthRepository được khởi tạo một lần và tái sử dụng trong toàn bộ ứng dụng.
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());

  // Đăng ký LoginBloc
  //Mỗi lần yêu cầu LoginBloc, một instance mới sẽ được tạo.
  getIt.registerFactory<LoginBloc>(() => LoginBloc(authRepository: getIt<AuthRepository>()));
}