
import 'package:cos_assignment/domain/models/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cos_error_dto.g.dart';

/// The `CosErrorDTO` is a data transfer object that provides access to the error data.
/// It provides the following functionality:
///
/// - **To Vehicle Error**: Converts the error to a vehicle error using the [toVehicleError] method.
@JsonSerializable()
class CosErrorDTO {

  final String msgKey;
  final Map<String, dynamic> params;
  final String message;

  CosErrorDTO({
    required this.msgKey,
    required this.params,
    required this.message,
  });

  factory CosErrorDTO.fromJson(Map<String, dynamic> json) => _$CosErrorDTOFromJson(json);
  Map<String,dynamic> toJson() => _$CosErrorDTOToJson(this);

  VehicleError toVehicleError() {

    if(msgKey == "maintenance"){
      if(params["delaySeconds"] == null){
        return VehicleError(VehicleErrorType.delay, delay: 0);
      }
      return VehicleError(VehicleErrorType.delay, delay: int.tryParse(params["delaySeconds"]));
    }
    else if(msgKey == "Timed-out"){
      return VehicleError(VehicleErrorType.timeout);
    }
    else{
      return VehicleError(VehicleErrorType.notImplemented);
    }

  }  
}