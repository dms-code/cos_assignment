// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicles.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Vehicle {
  int? get id => throw _privateConstructorUsedError;
  String? get vin => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  String? get make => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  String? get feedback => throw _privateConstructorUsedError;
  bool? get feedbackSentiment => throw _privateConstructorUsedError;
  int? get similarity => throw _privateConstructorUsedError;
  DateTime? get lastSync => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VehicleCopyWith<Vehicle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCopyWith<$Res> {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) then) =
      _$VehicleCopyWithImpl<$Res, Vehicle>;
  @useResult
  $Res call(
      {int? id,
      String? vin,
      String? model,
      String? make,
      int? price,
      String? feedback,
      bool? feedbackSentiment,
      int? similarity,
      DateTime? lastSync});
}

/// @nodoc
class _$VehicleCopyWithImpl<$Res, $Val extends Vehicle>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? vin = freezed,
    Object? model = freezed,
    Object? make = freezed,
    Object? price = freezed,
    Object? feedback = freezed,
    Object? feedbackSentiment = freezed,
    Object? similarity = freezed,
    Object? lastSync = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      vin: freezed == vin
          ? _value.vin
          : vin // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      make: freezed == make
          ? _value.make
          : make // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      feedbackSentiment: freezed == feedbackSentiment
          ? _value.feedbackSentiment
          : feedbackSentiment // ignore: cast_nullable_to_non_nullable
              as bool?,
      similarity: freezed == similarity
          ? _value.similarity
          : similarity // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleImplCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$$VehicleImplCopyWith(
          _$VehicleImpl value, $Res Function(_$VehicleImpl) then) =
      __$$VehicleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? vin,
      String? model,
      String? make,
      int? price,
      String? feedback,
      bool? feedbackSentiment,
      int? similarity,
      DateTime? lastSync});
}

/// @nodoc
class __$$VehicleImplCopyWithImpl<$Res>
    extends _$VehicleCopyWithImpl<$Res, _$VehicleImpl>
    implements _$$VehicleImplCopyWith<$Res> {
  __$$VehicleImplCopyWithImpl(
      _$VehicleImpl _value, $Res Function(_$VehicleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? vin = freezed,
    Object? model = freezed,
    Object? make = freezed,
    Object? price = freezed,
    Object? feedback = freezed,
    Object? feedbackSentiment = freezed,
    Object? similarity = freezed,
    Object? lastSync = freezed,
  }) {
    return _then(_$VehicleImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      vin: freezed == vin
          ? _value.vin
          : vin // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      make: freezed == make
          ? _value.make
          : make // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      feedbackSentiment: freezed == feedbackSentiment
          ? _value.feedbackSentiment
          : feedbackSentiment // ignore: cast_nullable_to_non_nullable
              as bool?,
      similarity: freezed == similarity
          ? _value.similarity
          : similarity // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$VehicleImpl implements _Vehicle {
  const _$VehicleImpl(
      {this.id,
      this.vin,
      this.model,
      this.make,
      this.price,
      this.feedback,
      this.feedbackSentiment,
      this.similarity,
      this.lastSync});

  @override
  final int? id;
  @override
  final String? vin;
  @override
  final String? model;
  @override
  final String? make;
  @override
  final int? price;
  @override
  final String? feedback;
  @override
  final bool? feedbackSentiment;
  @override
  final int? similarity;
  @override
  final DateTime? lastSync;

  @override
  String toString() {
    return 'Vehicle(id: $id, vin: $vin, model: $model, make: $make, price: $price, feedback: $feedback, feedbackSentiment: $feedbackSentiment, similarity: $similarity, lastSync: $lastSync)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vin, vin) || other.vin == vin) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.make, make) || other.make == make) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.feedbackSentiment, feedbackSentiment) ||
                other.feedbackSentiment == feedbackSentiment) &&
            (identical(other.similarity, similarity) ||
                other.similarity == similarity) &&
            (identical(other.lastSync, lastSync) ||
                other.lastSync == lastSync));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, vin, model, make, price,
      feedback, feedbackSentiment, similarity, lastSync);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      __$$VehicleImplCopyWithImpl<_$VehicleImpl>(this, _$identity);
}

abstract class _Vehicle implements Vehicle {
  const factory _Vehicle(
      {final int? id,
      final String? vin,
      final String? model,
      final String? make,
      final int? price,
      final String? feedback,
      final bool? feedbackSentiment,
      final int? similarity,
      final DateTime? lastSync}) = _$VehicleImpl;

  @override
  int? get id;
  @override
  String? get vin;
  @override
  String? get model;
  @override
  String? get make;
  @override
  int? get price;
  @override
  String? get feedback;
  @override
  bool? get feedbackSentiment;
  @override
  int? get similarity;
  @override
  DateTime? get lastSync;
  @override
  @JsonKey(ignore: true)
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
