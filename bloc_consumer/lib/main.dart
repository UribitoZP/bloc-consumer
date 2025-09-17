import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_state.dart';
import 'pages/inicial_view.dart';
import 'pages/loading_view.dart';
import 'pages/succes_view.dart';
import 'pages/failure_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Login exitoso!")),
              );
            }
          },
          builder: (context, state) {
            if (state is LoginInitial) {
              return const InicialView();
            } else if (state is LoginLoading) {
              return const LoadingView();
            } else if (state is LoginSuccess) {
              return const SuccessView();
            } else if (state is LoginFailure) {
              return const FailureView();
            }
            return const InicialView();
          },
        ),
      ),
    );
  }
}
