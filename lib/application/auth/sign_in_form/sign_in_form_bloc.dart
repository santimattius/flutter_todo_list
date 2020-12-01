import 'dart:async';

import 'package:arch_flutter_ddd/domain/auth/auth_failure.dart';
import 'package:arch_flutter_ddd/domain/auth/i_auth_facade.dart';
import 'package:arch_flutter_ddd/domain/auth/value_objects.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade);

  @override
  SignInFormState get initialState => SignInFormState.initial();

  @override
  Stream<SignInFormState> mapEventToState(
      SignInFormEvent event,
      ) async* {
    // TODO: Implement
  }
}
