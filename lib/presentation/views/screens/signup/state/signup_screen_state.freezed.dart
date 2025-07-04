// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpScreenState {
  String? get email => throw _privateConstructorUsedError;
  bool get emailValid => throw _privateConstructorUsedError;
  String? get emailError => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpScreenStateCopyWith<SignUpScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpScreenStateCopyWith<$Res> {
  factory $SignUpScreenStateCopyWith(
          SignUpScreenState value, $Res Function(SignUpScreenState) then) =
      _$SignUpScreenStateCopyWithImpl<$Res, SignUpScreenState>;
  @useResult
  $Res call(
      {String? email, bool emailValid, String? emailError, bool isSaving});
}

/// @nodoc
class _$SignUpScreenStateCopyWithImpl<$Res, $Val extends SignUpScreenState>
    implements $SignUpScreenStateCopyWith<$Res> {
  _$SignUpScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? emailValid = null,
    Object? emailError = freezed,
    Object? isSaving = null,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailValid: null == emailValid
          ? _value.emailValid
          : emailValid // ignore: cast_nullable_to_non_nullable
              as bool,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpScreenStateImplCopyWith<$Res>
    implements $SignUpScreenStateCopyWith<$Res> {
  factory _$$SignUpScreenStateImplCopyWith(_$SignUpScreenStateImpl value,
          $Res Function(_$SignUpScreenStateImpl) then) =
      __$$SignUpScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email, bool emailValid, String? emailError, bool isSaving});
}

/// @nodoc
class __$$SignUpScreenStateImplCopyWithImpl<$Res>
    extends _$SignUpScreenStateCopyWithImpl<$Res, _$SignUpScreenStateImpl>
    implements _$$SignUpScreenStateImplCopyWith<$Res> {
  __$$SignUpScreenStateImplCopyWithImpl(_$SignUpScreenStateImpl _value,
      $Res Function(_$SignUpScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? emailValid = null,
    Object? emailError = freezed,
    Object? isSaving = null,
  }) {
    return _then(_$SignUpScreenStateImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailValid: null == emailValid
          ? _value.emailValid
          : emailValid // ignore: cast_nullable_to_non_nullable
              as bool,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SignUpScreenStateImpl implements _SignUpScreenState {
  const _$SignUpScreenStateImpl(
      {this.email,
      this.emailValid = false,
      this.emailError,
      this.isSaving = false});

  @override
  final String? email;
  @override
  @JsonKey()
  final bool emailValid;
  @override
  final String? emailError;
  @override
  @JsonKey()
  final bool isSaving;

  @override
  String toString() {
    return 'SignUpScreenState(email: $email, emailValid: $emailValid, emailError: $emailError, isSaving: $isSaving)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpScreenStateImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailValid, emailValid) ||
                other.emailValid == emailValid) &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, emailValid, emailError, isSaving);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpScreenStateImplCopyWith<_$SignUpScreenStateImpl> get copyWith =>
      __$$SignUpScreenStateImplCopyWithImpl<_$SignUpScreenStateImpl>(
          this, _$identity);
}

abstract class _SignUpScreenState implements SignUpScreenState {
  const factory _SignUpScreenState(
      {final String? email,
      final bool emailValid,
      final String? emailError,
      final bool isSaving}) = _$SignUpScreenStateImpl;

  @override
  String? get email;
  @override
  bool get emailValid;
  @override
  String? get emailError;
  @override
  bool get isSaving;
  @override
  @JsonKey(ignore: true)
  _$$SignUpScreenStateImplCopyWith<_$SignUpScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
