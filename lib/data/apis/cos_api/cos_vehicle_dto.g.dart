// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cos_vehicle_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CosVehicleDTO _$CosVehicleDTOFromJson(Map<String, dynamic> json) =>
    CosVehicleDTO(
      id: (json['id'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      vin: json['vin'] as String?,
      feedback: json['feedback'] as String?,
      valuatedAt: json['valuatedAt'] == null
          ? null
          : DateTime.parse(json['valuatedAt'] as String),
      requestedAt: json['requestedAt'] == null
          ? null
          : DateTime.parse(json['requestedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      make: json['make'] as String?,
      model: json['model'] as String?,
      externalId: json['externalId'] as String?,
      fkSellerUser: json['_fk_sellerUser'] as String?,
      price: (json['price'] as num?)?.toInt(),
      positiveCustomerFeedback: json['positiveCustomerFeedback'] as bool?,
      fkUuidAuction: json['_fk_uuid_auction'] as String?,
      inspectorRequestedAt: json['inspectorRequestedAt'] == null
          ? null
          : DateTime.parse(json['inspectorRequestedAt'] as String),
      origin: json['origin'] as String?,
      estimationRequestId: json['estimationRequestId'] as String?,
      similarity: (json['similarity'] as num?)?.toInt(),
      containerName: json['containerName'] as String?,
      lastSync: json['lastSync'] == null
          ? null
          : DateTime.parse(json['lastSync'] as String),
    );

Map<String, dynamic> _$CosVehicleDTOToJson(CosVehicleDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'vin': instance.vin,
      'feedback': instance.feedback,
      'valuatedAt': instance.valuatedAt?.toIso8601String(),
      'requestedAt': instance.requestedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'make': instance.make,
      'model': instance.model,
      'externalId': instance.externalId,
      '_fk_sellerUser': instance.fkSellerUser,
      'price': instance.price,
      'positiveCustomerFeedback': instance.positiveCustomerFeedback,
      '_fk_uuid_auction': instance.fkUuidAuction,
      'inspectorRequestedAt': instance.inspectorRequestedAt?.toIso8601String(),
      'origin': instance.origin,
      'estimationRequestId': instance.estimationRequestId,
      'similarity': instance.similarity,
      'containerName': instance.containerName,
      'lastSync': instance.lastSync?.toIso8601String(),
    };
