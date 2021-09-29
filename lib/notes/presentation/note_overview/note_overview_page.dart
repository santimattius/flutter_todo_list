import 'package:arch_flutter_ddd/auth/application/auth_bloc.dart';
import 'package:arch_flutter_ddd/injection.dart';
import 'package:arch_flutter_ddd/notes/application/note_actor/note_actor_bloc.dart';
import 'package:arch_flutter_ddd/notes/application/note_watcher/note_watcher_bloc.dart';
import 'package:arch_flutter_ddd/notes/presentation/note_overview/widgets/note_overview_body_widget.dart';
import 'package:arch_flutter_ddd/notes/presentation/note_overview/widgets/uncompleted_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteWatcherBloc>(
          create: (context) => getIt<NoteWatcherBloc>()
            ..add(const NoteWatcherEvent.watchAllStarted()),
        ),
        BlocProvider<NoteActorBloc>(
          create: (context) => getIt<NoteActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                unauthenticated: (_) {
                  //ExtendedNavigator.of(context).replace(Routes.signInPage),
                },
                orElse: () {},
              );
            },
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (context, state) {
              state.maybeMap(
                deleteFailure: (state) {
                  // FlushbarHelper.createError(
                  //   duration: const Duration(seconds: 5),
                  //   message: state.noteFailure.map(
                  //     unexpected: (_) =>
                  //     'Unexpected error occured while deleting, please contact support.',
                  //     insufficientPermission: (_) =>
                  //     'Insufficient permissions ❌',
                  //     unableToUpdate: (_) => 'Impossible error',
                  //   ),
                  // ).show(context);
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            leading: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context)
                    .add(const AuthEvent.signedOut());
              },
            ),
            actions: <Widget>[
              UncompletedSwitch(),
            ],
          ),
          body: NotesOverviewBody(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //ExtendedNavigator.of(context).pushNoteFormPage(editedNote: null);
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
