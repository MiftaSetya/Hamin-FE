import 'package:hamin/features/dashboard/models/task_model.dart';

class TaskResponseModel {
  final List<TaskModel> data;
  final bool success;

  TaskResponseModel({required this.data, required this.success});

  factory TaskResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return TaskResponseModel(
        data: (json['data'] as List)
            .map((item) => TaskModel.fromJson(item))
            .toList(),
        success: json['success'] ?? false);
  }
}
