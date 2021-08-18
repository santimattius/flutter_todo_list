import 'package:arch_flutter_ddd/auth/domain/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User(
    UniqueId id,
  ) = _User;
}
