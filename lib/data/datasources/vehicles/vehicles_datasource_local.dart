
import 'package:cos_assignment/core/util/logs.dart';
import 'package:cos_assignment/data/database/database.dart';
import 'package:cos_assignment/data/datasources/datasource_template.dart';
import 'package:cos_assignment/domain/models/enums.dart';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicles_datasource_local.g.dart';

/// The `VehiclesDataSourceLocal` is a data source class that provides access to the vehicles data.
///
/// It provides the following functionality:
///
/// - **Get Vehicle**: Retrieves a vehicle using the [get] method.
/// - **Insert Vehicle**: Inserts a vehicle using the [insert] method.
/// - **Get First Vehicle**: Retrieves the first vehicle using the [getFirst] method.

class VehiclesDataSourceLocal implements DataSourceTemplate<VehicleDbDAO, VehicleError> {
  
  final Database localDatabase;
  final Log log;

  VehiclesDataSourceLocal(this.localDatabase, this.log);

  @override
  Future<Either<List<VehicleDbDAO>, VehicleError>> get(VehicleDbDAO filter) async {
    return Right(VehicleError.notImplemented());
  }

  @override
  Future<Either<VehicleDbDAO, VehicleError>> getFirst({VehicleDbDAO? filter}) async {
    try {

        final vehicle = await (localDatabase.select(localDatabase.vehicles)
          ..orderBy([
            (u) =>
              OrderingTerm(expression: u.createdAt, mode: OrderingMode.desc),
          ])..limit(1)..where((tbl) => tbl.vin.equals(filter!.vin))).get();

        if(vehicle.isEmpty){
          return Right(VehicleError.notFound());
        }
        return Left(vehicle.first);
    }
    on Exception catch (e, s){
      log.d(e.toString(), s);
      return Right(VehicleError.notFound());
    }
  }

  @override
  Future<Either<VehicleDbDAO, VehicleError>> insert(VehicleDbDAO newValue) async {
    try {
      final insertedVehicle = await localDatabase.vehicles.insertReturning(
        VehiclesCompanion(
          id: const Value.absent(),
          vin: Value(newValue.vin),
          jsonData: Value(newValue.jsonData),
          createdAt: Value(newValue.createdAt)
        ), mode: InsertMode.insertOrReplace); 
      
      return Left(insertedVehicle);
    }
    on Exception catch (e, s){
      log.d(e.toString(), s);
      return Right(VehicleError.insertDb());
    }
  }
  
}

@riverpod
Future<VehiclesDataSourceLocal> vehiclesLocalDataSource(ref) async {
  final database = await ref.watch(databaseProvider.future);
  final log = ref.watch(logProvider);

  return VehiclesDataSourceLocal(database, log);
}

