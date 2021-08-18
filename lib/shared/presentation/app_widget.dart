import 'package:arch_flutter_ddd/auth/application/auth_bloc.dart';
import 'package:arch_flutter_ddd/injection.dart';
import 'package:arch_flutter_ddd/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteApplication extends StatelessWidget {
  // This widget is the root of your application.
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()))
      ],
      child: MaterialApp.router(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: AutoRouterDelegate(_appRouter)),
    );
  }
}
