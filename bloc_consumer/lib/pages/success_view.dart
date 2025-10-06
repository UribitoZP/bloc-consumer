import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/text_cubit.dart';

class SuccessView extends StatelessWidget {
  final String username;
  final String email;
  final String phone;

  const SuccessView({
    super.key,
    required this.username,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TextCubit()..login(username, "1234"), // login simulado
      child: const _SuccessContent(),
    );
  }
}

class _SuccessContent extends StatefulWidget {
  const _SuccessContent();

  @override
  State<_SuccessContent> createState() => _SuccessContentState();
}

class _SuccessContentState extends State<_SuccessContent> {
  bool showUser = false;
  bool showEmail = false;
  bool showPhone = false;

  @override
  void initState() {
    super.initState();
    _animateTexts();
  }

  Future<void> _animateTexts() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => showUser = true);
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => showEmail = true);
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => showPhone = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Datos del usuario")),
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Imagen fija arriba
                  Image.network(
                    "https://cdn-images.dzcdn.net/images/cover/3abe03841174a6a3f7d8e32302eea6f8/0x1900-000000-80-0-0.jpg",
                    width: 150,
                  ),
                  const SizedBox(height: 30),

                  // Textos que aparecen con delay
                  AnimatedOpacity(
                    opacity: showUser ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      "Usuario: ${state.username}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: showEmail ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      "Email: ${state.email}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: showPhone ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      "Teléfono: ${state.phone}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is TextFailure) {
            return Center(
              child: Text(
                "Error: ${state.message}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return const Center(child: Text("Esperando datos..."));
        },
      ),
    );
  }
}
