import 'package:mvvm/data/response/task_response.dart' show TaskResponse;
import 'package:mvvm/data/service/api_service.dart' show ApiService;

abstract class RemoteDataSource {
  Future<List<TaskResponse>> getTasks();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiService _apiService;

  RemoteDataSourceImpl(this._apiService);

  @override
  Future<List<TaskResponse>> getTasks() => _apiService.getTasks();
}