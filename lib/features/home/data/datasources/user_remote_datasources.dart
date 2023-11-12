import 'package:dio/dio.dart';
import 'package:testapp/core/exceptions/exceptions.dart';
import 'package:testapp/features/home/data/models/user_model.dart';

abstract class UserRemoteDataSources {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourcesImpl extends UserRemoteDataSources {
  final Dio _dio;

  UserRemoteDataSourcesImpl(this._dio);

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _dio.get("/users");
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return ((response.data as List<dynamic>).map((e) => UserModel.fromJson(e)).toList());
      } else {
        if (response.data is Map) {
          throw ServerException(
                  statusCode: response.statusCode!,
                  errorMessage: (response.data as Map).values.isNotEmpty
                      ? (response.data as Map).values.first
                      : "LocaleKeys.error_while_get_user")
              .toString();
        } else {
          throw ServerException(statusCode: response.statusCode!, errorMessage: response.data.toString());
        }
      }
    } on ServerException {
      rethrow;
    }  on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}
