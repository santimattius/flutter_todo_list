import 'package:flutter_todo_list/auth/application/auth_bloc.dart';
import 'package:flutter_todo_list/injection.dart';
import 'package:flutter_todo_list/notes/application/note_actor/note_actor_bloc.dart';
import 'package:flutter_todo_list/notes/application/note_watcher/note_watcher_bloc.dart';
import 'package:flutter_todo_list/notes/presentation/note_overview/widgets/note_overview_body_widget.dart';
import 'package:flutter_todo_list/notes/presentation/note_overview/widgets/uncompleted_switch.dart';
import 'package:flutter_todo_list/routes/app_router.gr.dart';
import 'package:flutter_todo_list/shared/presentation/snack_bar.dart';
import 'package:auto_route/auto_route.dart';
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
                  AutoRouter.of(context).replace(const SignInPageRoute());
                },
                orElse: () {},
              );
            },
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (context, state) {
              state.maybeMap(
                deleteFailure: (state) {
                  final message = state.noteFailure.map(
                    unexpected: (_) =>
                        'Unexpected error occured while deleting, please contact support.',
                    insufficientPermission: (_) => 'Insufficient permissions ❌',
                    unableToUpdate: (_) => 'Impossible error',
                  );
                  showSnackBar(context, message);
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
              AutoRouter.of(context).push(NoteFormPageRoute(editedNote: null));
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
