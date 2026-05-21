class TaskModel {
  final String matkul;
  final String namaTugas;
  final String deskripsi;
  final String deadline;
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
