import 'package:dio/dio.dart';
import 'package:hamin/features/dashboard/models/task_model.dart';
import 'package:hamin/features/dashboard/models/task_response_model.dart';

class TaskService {
  final Dio dio = Dio(BaseOptions(
      baseUrl: "http://10.0.2.2:8080/api",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10)));

  Future<List<TaskModel>> fetchTasks() async {
    try {
      final response = await dio.get("/tugas");

      final taskResponse = TaskResponseModel.fromJson(response.data);

      return taskResponse.data;
    } catch (e) {
      throw Exception('Failed to fetch tasks: $e');
    }
  }
}
