import 'package:flutter_todo_list/injection.dart';
import 'package:flutter_todo_list/shared/presentation/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies(Environment.prod);
  runApp(NoteApplication());
}
