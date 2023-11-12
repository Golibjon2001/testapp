import 'package:get_it/get_it.dart';
import 'package:testapp/core/singeltons/dio_settings.dart';
import 'package:testapp/core/singeltons/storage.dart';
import 'package:testapp/features/home/data/datasources/user_remote_datasources.dart';
import 'package:testapp/features/home/data/repository_impl/user_repository_impl.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  await StorageRepository.getInstance();
  serviceLocator.registerFactory(() => DioSettings());

  serviceLocator.registerLazySingleton(() => UserRemoteDataSourcesImpl(serviceLocator<DioSettings>().dio));
  serviceLocator.registerLazySingleton(() => UserRepositoryImpl(serviceLocator<UserRemoteDataSourcesImpl>()));
}
