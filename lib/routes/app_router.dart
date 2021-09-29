import 'package:arch_flutter_ddd/auth/presentation/sign_in_page.dart';
import 'package:arch_flutter_ddd/notes/presentation/note_overview/note_overview_page.dart';
import 'package:arch_flutter_ddd/splash/presentation/splash_page.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: SplashPage, initial: true),
  MaterialRoute(page: SignInPage),
  MaterialRoute(page: NotesOverviewPage),
])
class $AppRouter {}
