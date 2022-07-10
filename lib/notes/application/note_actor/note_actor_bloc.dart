import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_todo_list/notes/domain/i_note_repository.dart';
import 'package:flutter_todo_list/notes/domain/note.dart';
import 'package:flutter_todo_list/notes/domain/note_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'note_actor_bloc.freezed.dart';

part 'note_actor_event.dart';

part 'note_actor_state.dart';

@injectable
class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  final INoteRepository _noteRepository;

  NoteActorBloc(this._noteRepository) : super(const NoteActorState.initial()) {
    on<NoteActorEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    NoteActorEvent event,
    Emitter<NoteActorState> emit,
  ) async {
    emit(const NoteActorState.actionInProgress());
    final possibleFailure = await _noteRepository.delete(event.note);
    final state = possibleFailure.fold(
      (f) => NoteActorState.deleteFailure(f),
      (_) => const NoteActorState.deleteSuccess(),
    );
    emit(state);
  }
}
