import 'package:cos_assignment/data/database/database.dart';
import 'package:cos_assignment/data/datasources/user/user_datasource.dart';
import 'package:cos_assignment/domain/models/enums.dart';
import 'package:cos_assignment/domain/models/user.dart';
import 'package:cos_assignment/domain/repositories/repository_template.dart';
import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

/// The `UserRepository` is a repository class that provides access to the user data.
///
/// It provides the following functionality:
///
/// - **Get User**: Retrieves a user using the [get] method.
/// - **Insert User**: Inserts a user using the [insert] method.
/// - **Get Cached User**: Retrieves a cached user using the [getCached] method.
/// - **Get All Users**: Retrieves all users using the [getAll] method.
/// - **Get First User**: Retrieves the first user using the [getFirst] method.

class UserRepository extends RepositoryTemplate<User, UserError>{

  final UserDataSource userSource;

  UserRepository(this.userSource);

  factory UserRepository.init(UserDataSource userSource) => UserRepository(userSource);
  
  @override
  Future<Either<User, UserError>> get(User item) async {
    return const Right(UserError.notImplemented);
  }
  
  @override
  Future<Either<User, UserError>> insert(User value) async {

    final insertedUser = await userSource.insert(UserDbDAO(
      id: 0, // AutoIncrement
      email: value.email
    ));

    return insertedUser.fold(
      (inserted){
        return Left(value.copyWith(id: inserted.id));
      },
      (error) {
        return Right(error);
      }
    );
  }
  
  @override
  Future<Either<List<User>, UserError>> getAll(User filter) async {
    return const Right(UserError.notImplemented);
  }
  
  @override
  Future<Either<User, UserError>> getFirst() async {
     final firstUser = await userSource.getFirst();

     return firstUser.fold(
      (user){
        final cachedUser = User(id: user.id, email: user.email);
        return Left(cachedUser);
      },
      (error) {
        return Right(error);
      }
    );
  }

}

@riverpod
Future<UserRepository>  userRepository(ref) async {
  final userDatasource = await ref.watch(userDataSourceProvider.future);
  return UserRepository.init(userDatasource);
}