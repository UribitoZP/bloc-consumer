import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';


import 'widgets/failure_widget.dart';
import 'widgets/inicial_widget.dart';
import 'widgets/loading_widget.dart';
import 'widgets/succes_widget.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginInitial) {
              return InicialView(
                onLogin: (username, password) {
                  context.read<LoginBloc>().add(
                        LoginSubmitted(username, password),
                      );
                },
              );
            } else if (state is LoginLoading) {
              return const LoadingView();
            } else if (state is LoginSuccess) {
              return SuccessView(
                username: state.username,
                email: state.email,
                phone: state.phone,
              );
            } else if (state is LoginFailure) {
              return FailureView(error: state.error);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
