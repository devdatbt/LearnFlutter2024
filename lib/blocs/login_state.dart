import 'package:equatable/equatable.dart';
/// abstract class mô tả trạng thái của màn hình login.
/// Chúng giúp giao diện hiển thị đúng thông báo
/// hoặc hành động dựa trên tiến trình và kết quả của quá trình đăng nhập.
///
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}
//Trạng thái ban đầu của màn hình (trước khi người dùng thực hiện bất kỳ hành động nào).
class LoginInitial extends LoginState {}
//Trạng thái hiển thị khi đang xử lý đăng nhập (loading spinner được hiển thị).
class LoginLoading extends LoginState {}
//Trạng thái khi đăng nhập thành công (dẫn đến màn hình Home).
class LoginSuccess extends LoginState {}

//Trạng thái khi đăng nhập thất bại (hiển thị thông báo lỗi).
class LoginFailure extends LoginState {
  final String errorMessage;
  const LoginFailure(this.errorMessage);
}
