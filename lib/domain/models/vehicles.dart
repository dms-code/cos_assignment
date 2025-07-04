import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicles.freezed.dart';

/// The `Vehicle` is a model class that represents a vehicle in the system.
///
/// It contains the following properties:
///
/// - **id**: The unique identifier of the vehicle.
/// - **vin**: The Vehicle Identification Number (VIN) of the vehicle.
/// - **model**: The model of the vehicle.
/// - **make**: The make of the vehicle.
/// - **price**: The price of the vehicle.
/// - **feedback**: The feedback of the vehicle.
/// - **feedbackSentiment**: The sentiment of the feedback of the vehicle.
/// - **similarity**: The similarity of the vehicle.
/// - **lastSync**: The last sync of the vehicle.

@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    int? id,
    String? vin,
    String? model,
    String? make,
    int? price,
    String? feedback,
    bool? feedbackSentiment,
    int? similarity,
    DateTime? lastSync,
  }) = _Vehicle;
}
