import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamin/features/dashboard/models/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskNotifier extends StateNotifier<List<TaskModel>> {
  final Box<TaskModel> taskBox;

  TaskNotifier(this.taskBox) : super([]) {
    _initializeTasks();
  }

  void _initializeTasks() {
    if (taskBox.isEmpty) {
      taskBox.addAll([
        TaskModel(
          matkul: "Praktikum Sistem Operasi",
          namaTugas: "Manajemen User",
          deskripsi: "Boleh video boleh laporan",
          deadline: "Kamis, 21 Mei 2026",
          isDone: false,
        ),
      ]);
    }

    state = taskBox.values.toList();
  }

  void toggleTask(int index) {
    final updatedTask = state[index].copyWith(isDone: !state[index].isDone);

    taskBox.putAt(index, updatedTask);

    state = taskBox.values.toList();

    if (taskBox.isEmpty) {
      taskBox.addAll([
        TaskModel(
          matkul: "Praktikum Sistem Operasi",
          namaTugas: "Manajemen User",
          deskripsi: "Boleh video boleh laporan",
          deadline: "Kamis, 21 Mei 2026",
          isDone: false,
        ),
      ]);
    }
  }
}

final taskProvider =
    StateNotifierProvider<TaskNotifier, List<TaskModel>>((ref) {
  final box = Hive.box<TaskModel>('tasks');
  return TaskNotifier(box);
});
