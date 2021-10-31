import 'package:arch_flutter_ddd/auth/application/sign_in_form/sign_in_form_bloc.dart';
import 'package:arch_flutter_ddd/auth/presentation/wigets/sign_in_form.dart';
import 'package:arch_flutter_ddd/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SignInFormBloc>(
        create: (context) => getIt<SignInFormBloc>(),
        child: SignInForm(),
      ),
    );
  }
}
