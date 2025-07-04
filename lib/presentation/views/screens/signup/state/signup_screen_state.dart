import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_screen_state.freezed.dart';

/// The `SignUpScreenState` is a state class that represents the state of the signup screen.
///
/// It contains the following properties:
///
/// - **email**: The email address of the user.
/// - **emailValid**: A boolean indicating whether the email is valid.
/// - **emailError**: An error message if the email is invalid.
/// - **isSaving**: A boolean indicating whether the signup process is in progress.

@freezed
class SignUpScreenState with _$SignUpScreenState {
  const factory SignUpScreenState({
    String? email,
    @Default(false) bool emailValid,
    String? emailError,
    @Default(false) bool isSaving,
  }) = _SignUpScreenState;

  factory SignUpScreenState.initial() => const SignUpScreenState();
}