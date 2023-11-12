import 'package:dio/dio.dart';
import 'package:testapp/core/exceptions/exceptions.dart';
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
    } on DioError{
      throw Left(DioFailure());
    } on ParsingException catch(e){
      return Left(ParsingFailure(errorMessage:e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}
