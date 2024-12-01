import 'package:equatable/equatable.dart' show Equatable;

/**
 *  giúp Bloc nhận biết các hành động của người dùng
 *  (ví dụ: thay đổi dữ liệu, gửi biểu mẫu) và xử lý logic phù hợp.
 * */
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

//Dùng để thông báo rằng giá trị của trường nhập username đã thay đổi.
class LoginUsernameChanged extends LoginEvent {
  final String username;
  const LoginUsernameChanged(this.username);
}
//Dùng để thông báo rằng giá trị của trường nhập password đã thay đổi.
class LoginPasswordChanged extends LoginEvent {
  final String password;
  const LoginPasswordChanged(this.password);
}
//Được gửi khi người dùng nhấn nút "Login".
class LoginSubmitted extends LoginEvent {

}
