// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import 'auth/application/auth_bloc.dart' as _i14;
import 'auth/application/sign_in_form/sign_in_form_bloc.dart' as _i13;
import 'auth/domain/i_auth_facade.dart' as _i6;
import 'auth/infrastructure/firebase_auth_facade.dart' as _i7;
import 'notes/application/note_actor/note_actor_bloc.dart' as _i10;
import 'notes/application/note_form/note_form_bloc.dart' as _i11;
import 'notes/application/note_watcher/note_watcher_bloc.dart' as _i12;
import 'notes/domain/i_note_repository.dart' as _i8;
import 'notes/infrastructure/note_repository.dart' as _i9;
import 'shared/infrastructure/firebase_injectable_module.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i5.GoogleSignIn>(
      () => firebaseInjectableModule.googleSingIn);
  gh.lazySingleton<_i6.IAuthFacade>(() =>
      _i7.FirebaseAuthFacade(get<_i3.FirebaseAuth>(), get<_i5.GoogleSignIn>()));
  gh.lazySingleton<_i8.INoteRepository>(
      () => _i9.NoteRepository(get<_i4.FirebaseFirestore>()));
  gh.factory<_i10.NoteActorBloc>(
      () => _i10.NoteActorBloc(get<_i8.INoteRepository>()));
  gh.factory<_i11.NoteFormBloc>(
      () => _i11.NoteFormBloc(get<_i8.INoteRepository>()));
  gh.factory<_i12.NoteWatcherBloc>(
      () => _i12.NoteWatcherBloc(get<_i8.INoteRepository>()));
  gh.factory<_i13.SignInFormBloc>(
      () => _i13.SignInFormBloc(get<_i6.IAuthFacade>()));
  gh.factory<_i14.AuthBloc>(() => _i14.AuthBloc(get<_i6.IAuthFacade>()));
  return get;
}

class _$FirebaseInjectableModule extends _i15.FirebaseInjectableModule {}
