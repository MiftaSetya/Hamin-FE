import 'package:flutter/material.dart';
import 'package:hamin/features/dashboard/models/task_model.dart';

class TaskDetailSheet extends StatelessWidget {
  final TaskModel task;

  const TaskDetailSheet({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,

      padding: const EdgeInsets.all(20),

      decoration: const BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,

              decoration: BoxDecoration(
                color: Colors.grey.shade300,

                borderRadius:
                    BorderRadius.circular(20),
              ),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            task.matkul,

            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            task.judul,

            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(14),

            decoration: BoxDecoration(
              color: Colors.black,

              borderRadius:
                  BorderRadius.circular(20),
            ),

            child: Row(
              children: [
                const Icon(
                  Icons.schedule,
                  color: Colors.white,
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    task.deadline,

                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            "Deskripsi",

            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: SingleChildScrollView(
              child: Text(
                task.deskripsi,

                style: const TextStyle(
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}