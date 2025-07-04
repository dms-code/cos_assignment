import 'dart:convert';

import 'package:cos_assignment/core/auth/auth.dart';
import 'package:cos_assignment/data/apis/cos_api/cos_vehicle_dto.dart';
import 'package:cos_assignment/data/database/database.dart';
import 'package:cos_assignment/data/datasources/vehicles/vehicles_datasource_local.dart';
import 'package:cos_assignment/data/datasources/vehicles/vehicles_datasource_remote.dart';
import 'package:cos_assignment/domain/models/enums.dart';
import 'package:cos_assignment/domain/models/vehicles.dart';
import 'package:cos_assignment/domain/repositories/repository_template.dart';
import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicles_repository.g.dart';

/// The `VehiclesRepository` is a repository class that provides access to the vehicles data.
///
/// It provides the following functionality:
///
/// - **Get Vehicle**: Retrieves a vehicle using the [get] method.
/// - **Insert Vehicle**: Inserts a vehicle using the [insert] method.
/// - **Get Cached Vehicle**: Retrieves a cached vehicle using the [getCached] method.
/// - **Get All Vehicles**: Retrieves all vehicles using the [getAll] method.
/// - **Get First Vehicle**: Retrieves the first vehicle using the [getFirst] method.

class VehiclesRepository extends RepositoryTemplate<Vehicle, VehicleError> {
  final Auth auth;
  final VehiclesDataSourceRemote vehiclesRemoteDataSource;
  final VehiclesDataSourceLocal vehiclesLocalDataSource;

  VehiclesRepository(
      this.auth, this.vehiclesRemoteDataSource, this.vehiclesLocalDataSource);

  factory VehiclesRepository.init(
          Auth auth,
          VehiclesDataSourceRemote vehiclesRemoteDataSource,
          VehiclesDataSourceLocal vehiclesLocalDataSource) =>
      VehiclesRepository(
          auth, vehiclesRemoteDataSource, vehiclesLocalDataSource);

  @override
  Future<Either<Vehicle, VehicleError>> get(Vehicle item) async {
    return Right(VehicleError.notImplemented());
  }

  @override
  Future<Either<Vehicle, VehicleError>> insert(Vehicle value) async {
    return Right(VehicleError.notImplemented());
  }

  Future<Either<Vehicle, VehicleError>> getCached(Vehicle filter) async {

    final filterDto = VehicleDbDAO(vin: filter.vin!, jsonData: "", createdAt: DateTime.now(), id: 0);
    final either = await vehiclesLocalDataSource.getFirst(filter: filterDto);

    return either.fold((cacheDto) {
      final vehicleJson = jsonDecode(cacheDto.jsonData);
      vehicleJson["lastSync"] = cacheDto.createdAt.toIso8601String();
      final cosVehicleDTO = CosVehicleDTO.fromJson(vehicleJson);
      return Left(cosVehicleDTO.toVehicle());
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<List<Vehicle>, VehicleError>> getAll(Vehicle filter) async {
   
    CosVehicleDTO filterDto = CosVehicleDTO(vin: filter.vin, userId: auth.getUser()?.email);
    final response = await vehiclesRemoteDataSource.get(filterDto);

    return response.fold(
      (vehicles) async {
        // Cache vehicles when the response is successful

        if(vehicles.isNotEmpty) {  
          if (vehicles.length == 1) {
            final vehicle = vehicles.first;

            final vehicleDbDTO = VehicleDbDAO(
              id: vehicle.id!,
              vin: filter.vin!,
              jsonData: jsonEncode(vehicle.toJson()),
              createdAt: DateTime.now(),
            );

            await vehiclesLocalDataSource.insert(vehicleDbDTO);
          }
          
          //order by similarity
          vehicles.sort((a, b) => b.similarity!.compareTo(a.similarity!));
          return Left(vehicles.map((e) => e.toVehicle()).toList());
        }
        else{
          return const Left([]);
        }
      },
      (error) async {
        return Right(error.toVehicleError());
      },
    );
  }

  @override
  Future<Either<Vehicle, VehicleError>> getFirst() async {
    return Right(VehicleError.notImplemented());
  }
}

@riverpod
Future<VehiclesRepository> vehiclesRepository(ref) async {
  final auth = ref.watch(authProvider.notifier);
  final cosVehicleDatasourceRemote =
      await ref.watch(vehiclesRemoteDataSourceProvider.future);
  final cosVehicleDatasourceLocal =
      await ref.watch(vehiclesLocalDataSourceProvider.future);
  return VehiclesRepository.init(
      auth, cosVehicleDatasourceRemote, cosVehicleDatasourceLocal);
}
