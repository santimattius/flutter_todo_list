import 'package:flutter_todo_list/auth/application/auth_bloc.dart';
import 'package:flutter_todo_list/injection.dart';
import 'package:flutter_todo_list/routes/app_router.gr.dart';
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
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme(
              primary: primaryColor,
              primaryVariant: primaryVariantColor,
              secondaryVariant: secondaryColor,
              secondary: secondaryVariantColor,
              background: Colors.white,
              surface: Colors.white,
              error: Colors.red,
              onPrimary: Colors.white,
              onSecondary: Colors.black,
              onBackground: Colors.black,
              onSurface: Colors.black,
              onError: Colors.white,
              brightness: Brightness.light),
          appBarTheme: const AppBarTheme(backgroundColor: primaryColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(_appRouter),
      ),
    );
  }
}

const primaryColor = Color(0xFF81c784);
const primaryVariantColor = Color(0xFF519657);

const secondaryColor = Color(0xFF81d4fa);
const secondaryVariantColor = Color(0xFF4ba3c7);
