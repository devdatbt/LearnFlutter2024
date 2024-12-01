import 'package:demo/blocs/login_event.dart';
import 'package:demo/blocs/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, BlocProvider;
import '../app_router.dart';
import '../blocs/login_bloc.dart';
import '../getit/service_locator.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final loginBloc = BlocProvider.of<LoginBloc>(context);
    final loginBloc = getIt<LoginBloc>();

    return BlocProvider(
      create: (_) => loginBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //Hai ô nhập cho username và passwor
              //Gửi các sự kiện LoginUsernameChanged và LoginPasswordChanged khi giá trị thay đổi.
              TextField(
                onChanged: (value) => loginBloc.add(LoginUsernameChanged(value)),
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                onChanged: (value) => loginBloc.add(LoginPasswordChanged(value)),
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
      
              const SizedBox(
                height: 20.0,
              ),
      
              /// Dùng BlocConsumer để
              /// Nghe trạng thái mới (listener) và chuyển hướng nếu cần.
              /// Hiển thị nút hoặc spinner dựa trên trạng thái (builder).
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    Navigator.pushReplacementNamed(context, AppRouter.homeRoute);
                  } else if (state is LoginFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.errorMessage),
                    ));
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () {
                      //Khi nhấn, gửi event LoginSubmitted đến Bloc.
                      loginBloc.add(LoginSubmitted());
                    },
                    child: const Text('Login'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
