import 'package:dartz/dartz.dart';

abstract class DataSourceTemplate<T, E> {
  Future<Either<T,E>> insert(T newValue);
  Future<Either<List<T>,E>> get(T filter);
  Future<Either<T,E>> getFirst({T? filter});
}
