import 'package:cos_assignment/domain/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

/// The `AuthState` is a state class that provides access to the authentication state.
@freezed
class AuthState with _$AuthState {
  
  // enable freezed to include custom methods
  // ignore: unused_element
  const AuthState._();

  const factory AuthState({
    User? user,
  }) = _AuthState;

  factory AuthState.init() => const AuthState();

  bool isLogged() => user != null;
}