import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:recipes_aplazo/core/services/internet_service.dart';
import 'package:recipes_aplazo/data/datasources/interfaces/i_main_remote_datasource.dart';
import 'package:recipes_aplazo/data/datasources/main_remote_datasource.dart';
import 'package:recipes_aplazo/data/repositories/main_repository.dart';
import 'package:recipes_aplazo/data/services/api_service.dart';
import 'package:recipes_aplazo/domain/repositories/i_main_repository.dart';

final GetIt getIt = GetIt.instance;

setupDiCore() async {
  getIt.registerLazySingleton<HasConnection>(() => HasConnection());

  getIt.registerLazySingleton<ChuckerHttpClient>(() => ChuckerHttpClient(http.Client()));

  getIt.registerLazySingleton<ApiService>(() => ApiService(client: getIt(), baseUrl: 'https://dummyjson.com'));

  getIt.registerLazySingleton<IMainRemoteDatasource>(() => MainRemoteDatasource(apiService: getIt()));

  getIt.registerLazySingleton<IMainRepository>(() => MainRepository(mainRemoteDatasource: getIt()));
}
