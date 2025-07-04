import 'package:dartz/dartz.dart';

abstract class RepositoryTemplate<T,E> {
  Future<Either<T,E>> insert(T value);
  Future<Either<T,E>> get(T item);
  Future<Either<List<T>,E>> getAll(T filter);
  Future<Either<T,E>> getFirst();
}

