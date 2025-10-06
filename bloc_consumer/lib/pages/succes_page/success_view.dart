import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/success_cubit.dart';
import 'cubit/success_state.dart';
import 'widgets/failure_sucess.dart';
import 'widgets/loading_succes.dart';
import 'widgets/succes_succes.dart';

class SuccessPage extends StatelessWidget {
  final String username;
  final String email;
  final String phone;

  const SuccessPage({
    super.key,
    required this.username,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SuccessCubit()..loadData(),
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: const Text('Datos del usuario'),
          backgroundColor: Colors.black,
        ),
        body: BlocBuilder<SuccessCubit, SuccessState>(
          builder: (context, state) {
            if (state is SuccessLoading) {
              return const LoadingSuccess();
            } else if (state is SuccessLoaded) {
              return SuccessSuccess(
                username: username,
                email: email,
                phone: phone,
              );
            } else if (state is SuccessError) {
              return const FailureSuccess();
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
