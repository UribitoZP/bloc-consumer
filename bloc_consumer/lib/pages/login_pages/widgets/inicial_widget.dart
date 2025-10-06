import 'package:flutter/material.dart';

class InicialView extends StatefulWidget {
  final Function(String, String) onLogin;
  const InicialView({super.key, required this.onLogin});

  @override
  State<InicialView> createState() => _InicialViewState();
}

class _InicialViewState extends State<InicialView> {
  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: userController,
              decoration: const InputDecoration(
                hintText: 'Usuario',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passController,
              decoration: const InputDecoration(
                hintText: 'Contraseña',
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => widget.onLogin(
                userController.text,
                passController.text,
              ),
              child: const Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
