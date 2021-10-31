import 'package:flutter_todo_list/notes/domain/note.dart';
import 'package:flutter_todo_list/notes/domain/note_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

abstract class INoteRepository {
  Stream<Either<NoteFailure, KtList<Note>>> watchAll();

  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted();

  Future<Either<NoteFailure, Unit>> create(Note note);

  Future<Either<NoteFailure, Unit>> update(Note note);

  Future<Either<NoteFailure, Unit>> delete(Note note);
}
