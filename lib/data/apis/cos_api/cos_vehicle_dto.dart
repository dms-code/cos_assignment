import 'package:cos_assignment/domain/models/vehicles.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cos_vehicle_dto.g.dart';

/// The `CosVehicleDTO` is a data transfer object that provides access to the vehicle data.
/// It provides the following functionality:
///
/// - **To Vehicle**: Converts the vehicle to a vehicle using the [toVehicle] method.
@JsonSerializable()
class CosVehicleDTO {
  final int? id;
  final String? userId;
  final String? vin;
  final String? feedback;
  final DateTime? valuatedAt;
  final DateTime? requestedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? make;
  final String? model;
  final String? externalId;
  @JsonKey(name: '_fk_sellerUser')
  final String? fkSellerUser;
  final int? price;
  final bool? positiveCustomerFeedback;
  @JsonKey(name: '_fk_uuid_auction')
  final String? fkUuidAuction;
  final DateTime? inspectorRequestedAt;
  final String? origin;
  final String? estimationRequestId;
  final int? similarity;
  final String? containerName;
  final DateTime? lastSync;

  CosVehicleDTO({
    this.id,
    this.userId,
    this.vin,
    this.feedback,
    this.valuatedAt,
    this.requestedAt,
    this.createdAt,
    this.updatedAt,
    this.make,
    this.model,
    this.externalId,
    this.fkSellerUser,
    this.price,
    this.positiveCustomerFeedback,
    this.fkUuidAuction,
    this.inspectorRequestedAt,
    this.origin,
    this.estimationRequestId,
    this.similarity,
    this.containerName,
    this.lastSync,
  });

  factory CosVehicleDTO.fromJson(Map<String, dynamic> json) => _$CosVehicleDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CosVehicleDTOToJson(this);

  Vehicle toVehicle() {
    return Vehicle(
      id: id,
      vin: vin,
      make: make,
      model: model,
      price: price,
      feedbackSentiment: positiveCustomerFeedback,
      feedback: feedback,
      similarity: similarity,
      lastSync: lastSync ?? DateTime.now(),
    );
  }
}
