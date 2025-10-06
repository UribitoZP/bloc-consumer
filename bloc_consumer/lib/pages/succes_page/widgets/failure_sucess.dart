import 'package:flutter/material.dart';

class FailureSuccess extends StatelessWidget {
  const FailureSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Error cargando datos",
        style: TextStyle(color: Colors.red, fontSize: 18),
      ),
    );
  }
}
