import 'package:dio/dio.dart' show Dio;
import 'package:get_it/get_it.dart';
import 'package:mvvm/data/client/dio.dart' show getDio;
import 'package:mvvm/data/data_source/remote_data_source.dart'
    show RemoteDataSource, RemoteDataSourceImpl;
import 'package:mvvm/data/repository/repository_impl.dart' show RepositoryImpl;
import 'package:mvvm/data/service/api_service.dart' show ApiService;
import 'package:mvvm/domain/repository/repository.dart' show Repository;
import 'package:mvvm/domain/usecase/usecase/get_tasks_usecase.dart' show GetTasksUseCase;

final getIt = GetIt.instance;

void initModule() {
  final dio = getDio();
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<Repository>(
          () => RepositoryImpl(getIt<RemoteDataSourceImpl>()));
  getIt.registerLazySingleton<GetTasksUseCase>(
          () => GetTasksUseCase(getIt<RepositoryImpl>()));
}
