// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signUpScreenVMHash() => r'9e4dfbd04336e46c26f88d8c01ea4e0397251d6b';

/// The `SignUpScreenVM` is a view model class that manages the state of the signup screen.
///
/// It provides the following functionality:
///
/// - **Email Validation**: Validates the email input using the [Validators.validateEmail] method.
/// - **User Registration**: Registers a new user using the [saveUser] method.
/// - **User Error Handling**: Handles errors that may occur during the user registration operation.
/// - **User State Management**: Manages the state of the signup screen using the [state] property.
///
/// Copied from [SignUpScreenVM].
@ProviderFor(SignUpScreenVM)
final signUpScreenVMProvider =
    AutoDisposeNotifierProvider<SignUpScreenVM, SignUpScreenState>.internal(
  SignUpScreenVM.new,
  name: r'signUpScreenVMProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signUpScreenVMHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignUpScreenVM = AutoDisposeNotifier<SignUpScreenState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
