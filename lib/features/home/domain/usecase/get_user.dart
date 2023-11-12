import 'package:testapp/core/exceptions/failures.dart';
import 'package:testapp/core/use_case/use_case.dart';
import 'package:testapp/core/utils/either.dart';
import 'package:testapp/features/home/domain/entity/user_entity.dart';
import 'package:testapp/features/home/domain/repository/user_repository.dart';

class GetUserUseCase extends UseCase<List<UserEntity>, NoParams> {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(NoParams params) async {
    return await repository.getUser();
  }
}
