import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/text_cubit.dart';

class SuccessView extends StatelessWidget {
  final String username;
  final String password;

  const SuccessView({
    super.key,
    required this.username,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TextCubit()..login(username, password),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Datos del usuario"),
          centerTitle: true,
        ),
        body: BlocConsumer<TextCubit, TextState>(
          listener: (context, state) {
            if (state is TextFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is TextLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TextSuccess) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("✅ Usuario: ${state.username}",
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 10),
                    Text("📧 Email: ${state.email}",
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 10),
                    Text("📱 Teléfono: ${state.phone}",
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
              );
            }

            return const Center(
              child: Text("Esperando datos...",
                  style: TextStyle(fontSize: 16)),
            );
          },
        ),
      ),
    );
  }
}
