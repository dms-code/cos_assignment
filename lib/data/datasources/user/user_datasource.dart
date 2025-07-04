import 'package:cos_assignment/core/util/logs.dart';
import 'package:cos_assignment/data/database/database.dart';
import 'package:cos_assignment/data/datasources/datasource_template.dart';
import 'package:cos_assignment/domain/models/enums.dart';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_datasource.g.dart';

/// The `UserDataSource` is a data source class that provides access to the user data using the local database.
///
/// It provides the following functionality:
///
/// - **Get User**: Retrieves a user using the [get] method.
/// - **Insert User**: Inserts a user using the [insert] method.
/// - **Get First User**: Retrieves the first user using the [getFirst] method.

class UserDataSource implements DataSourceTemplate<UserDbDAO, UserError> {
  final Database localDatabase;
  final Log log;

  UserDataSource(this.localDatabase, this.log);

  factory UserDataSource.build(Database db, Log log) => UserDataSource(db, log);
  
  @override
  Future<Either<UserDbDAO, UserError>> insert(UserDbDAO value) async {
    try{
      final updatedUser = await localDatabase.users.insertReturning(
        UsersCompanion(
          id: const Value.absent(),
          email: Value(value.email)
        ), mode: InsertMode.insertOrReplace); 
      
      return Left(updatedUser);
    }
    on Exception catch (e, s){
      log.d(e.toString(), s);
      return const Right(UserError.insertError);
    }
  }

  @override
  Future<Either<List<UserDbDAO>, UserError>> get(UserDbDAO filter) async {
    return const Right(UserError.notFound);
  }
  
  @override
  Future<Either<UserDbDAO, UserError>> getFirst({UserDbDAO? filter}) async {
    try{
      //Select the first entry from the table
      final user = await localDatabase.users.select().getSingleOrNull();
      return user != null ? Left(user) : const Right(UserError.notFound);
    }
    on Exception catch (e, s){
      log.d(e.toString(), s);
      return const Right(UserError.notFound);
    }
  }

}

@riverpod
Future<UserDataSource> userDataSource(ref) async {
  final database = await ref.watch(databaseProvider.future);
  final log = ref.watch(logProvider);

  return UserDataSource.build(database, log);
}

