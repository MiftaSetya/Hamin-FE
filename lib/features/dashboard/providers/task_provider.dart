import 'package:flutter_riverpod/legacy.dart';
import 'package:hamin/features/dashboard/models/task_model.dart';

class TaskNotifier extends StateNotifier<List<TaskModel>> {
  TaskNotifier()
    : super([
        TaskModel(
          matkul: "Praktikum Sistem Operasi",
          namaTugas: "Manajemen User",
          deskripsi: "Boleh video boleh laporan",
          deadline: "Kamis, 21 Mei 2026 - 23:59",
          isDone: false,
        ),
      ]);

  void toggleTask(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(isDone: !state[i].isDone)
        else
          state[i],
    ];
  }
}

final taskProvider = 
    StateNotifierProvider<TaskNotifier, List<TaskModel>>(
  (ref) => TaskNotifier(),
);