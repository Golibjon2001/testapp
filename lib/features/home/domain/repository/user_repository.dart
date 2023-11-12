import 'package:testapp/core/exceptions/failures.dart';
import 'package:testapp/core/utils/either.dart';
import 'package:testapp/features/home/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUser();
}
