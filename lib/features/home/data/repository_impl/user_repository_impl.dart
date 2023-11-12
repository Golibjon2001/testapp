import 'package:dio/dio.dart';
import 'package:testapp/core/exceptions/failures.dart';
import 'package:testapp/core/utils/either.dart';
import 'package:testapp/features/home/data/datasources/user_remote_datasources.dart';
import 'package:testapp/features/home/domain/entity/user_entity.dart';
import 'package:testapp/features/home/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSources dataSources;

  UserRepositoryImpl(this.dataSources);

  @override
  Future<Either<Failure, List<UserEntity>>> getUser() async {
    try {
      final result = await dataSources.getUsers();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    }
  }
}
