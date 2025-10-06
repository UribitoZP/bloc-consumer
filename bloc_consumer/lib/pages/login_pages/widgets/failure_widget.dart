import 'package:flutter/material.dart';

class FailureView extends StatelessWidget {
  final String error;
  const FailureView({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(color: Colors.red, fontSize: 18),
      ),
    );
  }
}
