import 'package:drift/drift.dart';

@DataClassName('VehicleDbDAO')
class Vehicles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get vin => text()();
  TextColumn get jsonData => text()();
  DateTimeColumn get createdAt => dateTime()();
}
