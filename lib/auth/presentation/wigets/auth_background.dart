import 'package:arch_flutter_ddd/auth/presentation/wigets/header_box.dart';
import 'package:arch_flutter_ddd/auth/presentation/wigets/header_icon.dart';
import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          HeaderBox(),
          HeaderIcon(),
          child,
        ],
      ),
    );
  }
}
