import 'package:dio/dio.dart';
import 'package:mvvm/app/strings.dart' show AppStrings;
import 'package:mvvm/data/response/task_response.dart' show TaskResponse;
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: AppStrings.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/tasks')
  Future<List<TaskResponse>> getTasks();
}