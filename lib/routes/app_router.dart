import 'package:auto_route/auto_route.dart';
import 'package:flutter_todo_list/auth/presentation/sign_in_page.dart';
import 'package:flutter_todo_list/notes/presentation/note_form/note_form_page.dart';
import 'package:flutter_todo_list/notes/presentation/note_overview/note_overview_page.dart';
import 'package:flutter_todo_list/splash/presentation/splash_page.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: SplashPage, initial: true),
  MaterialRoute(page: SignInPage),
  MaterialRoute(page: NotesOverviewPage),
  MaterialRoute(page: NoteFormPage),
])
class $AppRouter {}
