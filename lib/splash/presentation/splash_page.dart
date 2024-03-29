import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_list/auth/application/auth_bloc.dart';
import 'package:flutter_todo_list/routes/app_router.gr.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final autoRouter = AutoRouter.of(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) =>
              autoRouter.replace(const NotesOverviewPageRoute()),
          unauthenticated: (_) => autoRouter.replace(const SignInPageRoute()),
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
