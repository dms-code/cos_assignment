import 'dart:async';
import 'dart:convert';

import 'package:cos_assignment/core/util/logs.dart';
import 'package:cos_assignment/data/apis/cos_api/api_provider.dart';
import 'package:cos_assignment/data/apis/cos_api/cos_error_dto.dart';
import 'package:cos_assignment/data/apis/cos_api/cos_vehicle_dto.dart';
import 'package:cos_assignment/data/apis/cos_api/snippet.dart';
import 'package:cos_assignment/data/datasources/datasource_template.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../apis/cos_api/api_routes.dart';
part 'vehicles_datasource_remote.g.dart';

/// The `VehiclesDataSourceRemote` is a data source class that provides access to the vehicles data using the remote API.
///
/// It provides the following functionality:
///
/// - **Get Vehicle**: Retrieves a vehicle using the [get] method.
/// - **Insert Vehicle**: Inserts a vehicle using the [insert] method.
/// - **Get First Vehicle**: Retrieves the first vehicle using the [getFirst] method.

class VehiclesDataSourceRemote implements DataSourceTemplate<CosVehicleDTO, CosErrorDTO> {
  
  final BaseClient api;
  final Log log;

  VehiclesDataSourceRemote(this.api, this.log);

  factory VehiclesDataSourceRemote.build(BaseClient api, Log log) => VehiclesDataSourceRemote(api, log);
  
  String _sanitize(String body) {
    final regex = RegExp(r'("externalId":\s*"[^"]*")\s*("_fk_sellerUser")');
    return body.replaceFirstMapped(regex, (match) {
      return '${match.group(1)},${match.group(2)}';
    });
  }

  @override
  Future<Either<CosVehicleDTO, CosErrorDTO>> insert(CosVehicleDTO value) async {
      return Right(CosErrorDTO(message: "Not implemented", params: {}, msgKey: ""));
  }

  @override
  Future<Either<List<CosVehicleDTO>, CosErrorDTO>> get(CosVehicleDTO filter) async {

    try {
        final response = await api.get(Uri.parse(ApiRoutes.vehicles.path), headers: {CosChallenge.user: filter.userId!});
        final decodedJson = jsonDecode(_sanitize(response.body));

        if(response.statusCode == 200){
            return Left([CosVehicleDTO.fromJson(decodedJson)]);
        }
        else if(response.statusCode == 300){

            final vehiclesOptions = decodedJson;

            if(vehiclesOptions is List){
              return Left(vehiclesOptions.map((e) => CosVehicleDTO.fromJson(e)).toList());
            }

            return const Left([]);
        }
        else{
          return Right(CosErrorDTO.fromJson(decodedJson));
        }
    }
    on Exception catch (e, s){
      log.d(e.toString(), s);

      if(e is TimeoutException){
        return Right(CosErrorDTO(msgKey: "Timed-out", params: {}, message: e.toString()));
      }
      else{
        return Right(CosErrorDTO(msgKey: "Unknown", params: {}, message: e.toString()));
      }
    }

  }
  
  @override
  Future<Either<CosVehicleDTO, CosErrorDTO>> getFirst({CosVehicleDTO? filter}) async {
    return Right(CosErrorDTO(message: "Not implemented", params: {}, msgKey: ""));
  }
}

@riverpod
Future<VehiclesDataSourceRemote> vehiclesRemoteDataSource(ref) async {
  final api = ref.watch(apiProvider);
  final log = ref.watch(logProvider);

  return VehiclesDataSourceRemote.build(api, log);
}

