import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/auth_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

/// LoginBloc là nơi quản lý toàn bộ logic cho màn hình login. Nó nhận event và phát ra state tương ứng
///  - Nhận event từ UI (như thay đổi username, password, hoặc nhấn nút login).
///  - Chạy logic dựa trên event.
///  - Phát state mới để cập nhật UI.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  String _username = "";
  String _password = "";

//Lưu trữ dữ liệu từ event:
//Khi nhận LoginUsernameChanged, cập nhật giá trị username.
  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginUsernameChanged>((event, emit) {
      _username = event.username;
    });

//Khi nhận LoginPasswordChanged, cập nhật giá trị password.
    on<LoginPasswordChanged>((event, emit) {
      _password = event.password;
    });
//Xử lý logic đăng nhập
//Khi nhận event LoginSubmitted, chuyển sang trạng thái LoginLoading.
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      try {
        final success = await authRepository.login(_username, _password);
        if (success) {
          emit(LoginSuccess());
        } else {
          emit(const LoginFailure('Invalid username or password.'));
        }
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });
  }
}
