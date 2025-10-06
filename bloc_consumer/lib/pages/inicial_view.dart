import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import 'loading_view.dart';
import 'failure_view.dart';
import 'success_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (contex) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contex) => SuccessView(
                    username: state.username,
                    email: state.email,
                    phone: state.phone,
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoginInitial) {
              return buildForm(context);
            } else if (state is LoginLoading) {
              return const LoadingView();
            } else if (state is LoginFailure) {
              return FailureView();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    final userCtrl = TextEditingController();
    final passCtrl = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: userCtrl, decoration: const InputDecoration(labelText: "Usuario")),
          TextField(controller: passCtrl, obscureText: true, decoration: const InputDecoration(labelText: "Contraseña")),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<LoginBloc>().add(
                    LoginSubmitted(userCtrl.text, passCtrl.text),
                  );
            },
            child: const Text("Ingresar"),
          )
        ],
      ),
    );
  }
}
