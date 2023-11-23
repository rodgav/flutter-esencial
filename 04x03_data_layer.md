# [Flutter esencial](readme.md)

¡Aprende a crear aplicaciones móviles increíbles con Flutter!

## Layer Data

```yaml
dependencies:
  ...
  dio: ^5.3.3
  retrofit: ^4.0.3
  json_annotation: ^4.8.1
dev_dependencies:
  ...
  retrofit_generator: ^8.0.3
  build_runner: ^2.4.6
  json_serializable: ^6.7.1
```

data/client/dio.dart
```dart
import 'package:dio/dio.dart';

Dio getDio() {
  final dio = Dio(BaseOptions(
    baseUrl: AppStrings.baseUrl,
    connectTimeout: const Duration(seconds: 6),
    receiveTimeout: const Duration(seconds: 4),
  ));
  dio.interceptors.add(LogInterceptor(responseBody: true));
  return dio;
}
```

app/app_strings.dart
```dart
class AppStrings {
  static const baseUrl = 'http://192.168.1.8:3000';
}
```

data/service/api_service.dart
```dart
import 'package:clean_mvvm/app/app_strings.dart';
import 'package:clean_mvvm/data/response/task_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/tasks')
  Future<List<TaskResponse>> getTasks();
}
```

data/response/task_response.dart
```dart
import 'package:json_annotation/json_annotation.dart';

part 'task_response.g.dart';

@JsonSerializable()
class TaskResponse {
  final String? id;
  final String? name;

  TaskResponse(this.id, this.name);

  factory TaskResponse.fromJson(Map<String, dynamic> json) => _$TaskResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaskResponseToJson(this);
}
```

`fvm flutter run build_runner  build`
o
`fvm flutter packages run build_runner  build`

data/data_source/remote_data_source.dart

```dart
import 'package:clean_mvvm/data/response/task_response.dart';
import 'package:clean_mvvm/data/service/api_service.dart';

abstract class RemoteDataSource {
  Future<List<TaskResponse>> getTasks();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiService _apiService;

  RemoteDataSourceImpl(this._apiService);

  @override
  Future<List<TaskResponse>> getTasks() => _apiService.getTasks();
}
```


app/dependency_injection.dart metodo initModule
```dart
final dio = getDio();
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
  getIt.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(getIt<ApiService>()));
```