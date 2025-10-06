import 'package:flutter/material.dart';

class LoadingSuccess extends StatelessWidget {
  const LoadingSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Colors.white),
    );
  }
}
