import 'package:arch_flutter_ddd/auth/domain/user.dart';
import 'package:arch_flutter_ddd/auth/domain/value_objects.dart';
import 'package:dartz/dartz.dart';

import 'auth_failure.dart';

abstract class IAuthFacade {
  Option<User> getSignedInUser();

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<void> signOut();
}
