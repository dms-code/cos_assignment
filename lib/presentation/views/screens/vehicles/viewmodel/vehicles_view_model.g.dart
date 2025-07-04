// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicles_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vehiclesScreenVMHash() => r'dab06c49aa02caa31f64ef1aa449e7b7e34b1ae0';

/// The `VehiclesScreenVM` is a view model class that manages the state of the vehicles screen.
///
/// It provides the following functionality:
///
/// - **VIN Validation**: Validates the VIN input using the [Validators.validateVIN] method.
/// - **Vehicle Search**: Searches for a vehicle using the [search] method.
/// - **Vehicle Chaching**: Caches the vehicle data in the database.
/// - **Vehicle Error Handling**: Handles errors that may occur during the vehicle search operation.
/// - **Vehicle State Management**: Manages the state of the vehicles screen using the [state] property.
///
/// Copied from [VehiclesScreenVM].
@ProviderFor(VehiclesScreenVM)
final vehiclesScreenVMProvider =
    AutoDisposeNotifierProvider<VehiclesScreenVM, VehiclesScreenState>.internal(
  VehiclesScreenVM.new,
  name: r'vehiclesScreenVMProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vehiclesScreenVMHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VehiclesScreenVM = AutoDisposeNotifier<VehiclesScreenState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
