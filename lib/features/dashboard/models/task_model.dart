import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String matkul;

  @HiveField(1)
  final String judul;

  @HiveField(2)
  final String deskripsi;

  @HiveField(3)
  final String deadline;

  @HiveField(4)
  final bool isDone;

  TaskModel({
    required this.matkul,
    required this.judul,
    required this.deskripsi,
    required this.deadline,
    this.isDone = false,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        matkul: json['matkul'] ?? '',
        judul: json['judul'] ?? '',
        deskripsi: json['deskripsi'] ?? '',
        deadline: json['deadline'] ?? '',
        isDone: false);
  }

  Map<String, dynamic> toJson() {
    return {
      'matkul': matkul,
      'judul': judul,
      'deskripsi': deskripsi,
      'deadline': deadline,
      'isDone': isDone
    };
  }

  TaskModel copyWith({
    String? matkul,
    String? judul,
    String? deskripsi,
    String? deadline,
    bool? isDone,
  }) {
    return TaskModel(
      matkul: matkul ?? this.matkul,
      judul: judul ?? this.judul,
      deskripsi: deskripsi ?? this.deskripsi,
      deadline: deadline ?? this.deadline,
      isDone: isDone ?? this.isDone,
    );
  }
}
