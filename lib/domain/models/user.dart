import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// The `User` is a model class that represents a user in the system.
///
/// It contains the following properties:
///
/// - **id**: The unique identifier of the user.
/// - **email**: The email address of the user.

@freezed
class User with _$User {
  const factory User({
    int? id,
    required String email,
  }) = _User;
}
