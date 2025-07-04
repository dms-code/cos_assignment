import 'dart:io';

import 'package:cos_assignment/data/database/tables/users_table.dart';
import 'package:cos_assignment/data/database/tables/vehicles_table.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'database.g.dart';

/// The `Database` is a database class that provides access to the database.
@DriftDatabase(tables: [Users, Vehicles])
class Database extends _$Database  {
 
  Database(super.e);

  Database build() {
    return this;
  }

  @override
  int get schemaVersion => 1;
}

/// The `databaseProvider` is a provider that provides access to the database.
final databaseProvider = FutureProvider<Database>((ref) async {
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(path.join(dbFolder.path, 'app_database.db'));
  final database = Database(NativeDatabase(file));
  
  ref.onDispose(() {
    database.close();
  });
  
  return database;
});
