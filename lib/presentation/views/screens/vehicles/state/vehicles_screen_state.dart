import 'package:cos_assignment/domain/models/enums.dart';
import 'package:cos_assignment/domain/models/vehicles.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicles_screen_state.freezed.dart';

/// The `VehiclesScreenState` is a state class that represents the state of the vehicles screen.
///
/// It contains the following properties:
///
/// - **vin**: The Vehicle Identification Number (VIN) of the vehicle.
/// - **vinValid**: A boolean indicating whether the VIN is valid.
/// - **vinError**: An error message if the VIN is invalid.
/// - **vehicle**: The vehicle object if found.
/// - **options**: A list of vehicle options if multiple results are found.
/// - **vehicleError**: An error message if the vehicle is not found.
/// - **isWaiting**: A boolean indicating whether the screen is waiting for a response.
/// - **snackTriggered**: A boolean indicating whether a snack bar has been triggered.
/// - **openOptions**: A boolean indicating whether the options sheet is open.

@freezed
class VehiclesScreenState with _$VehiclesScreenState {
  const factory VehiclesScreenState({
    String? vin,
    @Default(false) bool vinValid,
    String? vinError,
    Vehicle? vehicle,
    List<Vehicle>? options,
    VehicleError? vehicleError,
    @Default(false) bool isWaiting,
    @Default(false) bool snackTriggered,
    @Default(false) bool openOptions
  }) = _VehiclesScreenState;

  factory VehiclesScreenState.initial() => const VehiclesScreenState();
}