import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_todo_list/auth/domain/i_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc.freezed.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const AuthState.initial()) {
    on<AuthEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(AuthEvent event, Emitter<AuthState> emit) async {
    emit(await mapEventToState(event));
  }

  Future<AuthState> mapEventToState(
    AuthEvent event,
  ) async {
    return event.map(
      authCheckRequested: (value) {
        final userOption = _authFacade.getSignedInUser();
        return userOption.fold(
          () => const AuthState.unauthenticated(),
          (_) => const AuthState.authenticated(),
        );
      },
      signedOut: (e) async {
        await _authFacade.signOut();
        return const AuthState.unauthenticated();
      },
    );
  }
}
