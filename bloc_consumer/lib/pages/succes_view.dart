import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_consumer/bloc/login_bloc.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bloc con Dio")),
      body: Center(
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return const CircularProgressIndicator();
            } else if (state is LoginSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.username, style: const TextStyle(fontSize: 20)),
                  Text(state.email, style: const TextStyle(fontSize: 20)),
                  Text(state.phone, style: const TextStyle(fontSize: 20)),
                ],
              );
            } else if (state is LoginFailure) {
              return Text(
                "Error: ${state.message}",
                style: const TextStyle(color: Colors.red),
              );
            }
            return const Text("Esperando datos...");
          },
        ),
      ),
    );
  }
}
