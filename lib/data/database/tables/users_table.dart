import 'package:drift/drift.dart';

@DataClassName('UserDbDAO')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get email => text().unique()();
}
