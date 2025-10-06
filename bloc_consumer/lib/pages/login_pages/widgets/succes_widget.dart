import 'package:flutter/material.dart';
import '../../succes_page/success_view.dart';

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
    return SuccessPage(
      username: username,
      email: email,
      phone: phone,
    );
  }
}
