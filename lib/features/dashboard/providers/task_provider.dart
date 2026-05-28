import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamin/features/dashboard/models/task_model.dart';
import 'package:hamin/features/dashboard/services/task_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskNotifier extends StateNotifier<List<TaskModel>> {
  final Box<TaskModel> taskBox;
  final TaskService service;

  TaskNotifier(this.taskBox, this.service) : super([]) {
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    try {
      final apiTasks = await service.fetchTasks();

      final mergedTasks = apiTasks.map((apiTasks) {
        final localMatch = taskBox.values
            .where((localTask) => localTask.judul == apiTasks.judul)
            .toList();

        if (localMatch.isNotEmpty) {
          return apiTasks.copyWith(isDone: localMatch.first.isDone);
        }

        return apiTasks;
      }).toList();

      await taskBox.clear();

      await taskBox.addAll(mergedTasks);

      state = mergedTasks;
    } catch (e) {
      print(e);
    }
  }

  void toggleTask(int index) {
    final updatedTask = state[index].copyWith(isDone: !state[index].isDone);

    taskBox.putAt(index, updatedTask);

    state = taskBox.values.toList();
  }
}

final taskProvider =
    StateNotifierProvider<TaskNotifier, List<TaskModel>>((ref) {
  final box = Hive.box<TaskModel>('tasks');
  return TaskNotifier(box, TaskService());
});
