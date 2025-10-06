import 'package:flutter/material.dart';

class SuccessSuccess extends StatelessWidget {
  final String username;
  final String email;
  final String phone;

  const SuccessSuccess({
    super.key,
    required this.username,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Usuario: $username", style: const TextStyle(color: Colors.white)),
          Text("Email: $email", style: const TextStyle(color: Colors.white)),
          Text("Teléfono: $phone", style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
