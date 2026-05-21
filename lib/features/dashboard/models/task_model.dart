import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String matkul;

  @HiveField(1)
  final String namaTugas;

  @HiveField(2)
  final String deskripsi;

  @HiveField(3)
  final String deadline;

  @HiveField(4)
  final bool isDone;

  TaskModel({
    required this.matkul,
    required this.namaTugas,
    required this.deskripsi,
    required this.deadline,
    required this.isDone,
  });

  TaskModel copyWith({
    String? matkul,
    String? namaTugas,
    String? deskripsi,
    String? deadline,
    bool? isDone,
  }) {
    return TaskModel(
      matkul: matkul ?? this.matkul,
      namaTugas: namaTugas ?? this.namaTugas,
      deskripsi: deskripsi ?? this.deskripsi,
      deadline: deadline ?? this.deadline,
      isDone: isDone ?? this.isDone,
    );
  }
}
