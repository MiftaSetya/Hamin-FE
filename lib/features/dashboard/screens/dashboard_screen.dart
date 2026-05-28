import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamin/core/theme/app_colors.dart';
import 'package:hamin/core/widgets/task_card.dart';
import 'package:hamin/features/dashboard/providers/task_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://imgs.search.brave.com/D9JKrXExEBjMYQnA33bVtilik0GqtEsdet4OxMk6cYU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNTE5/MzczODMvcGhvdG8v/c2FuLWZyYW5jaXNj/by1hcHBsZS1jZW8t/c3RldmUtam9icy1k/ZWxpdmVycy1hLWtl/eW5vdGUtYWRkcmVz/cy1hdC10aGUtMjAw/NS1tYWN3b3JsZC1l/eHBvLWphbnVhcnku/anBnP3M9NjEyeDYx/MiZ3PTAmaz0yMCZj/PVpCVDBaWXFNWnVC/RzlTWWdsZURPZGZR/WTNubnN6SHBLVUNM/VE9qSEdLa1E9",
            ),
          ),
        ),
        title: Text(
          "Hey, Student Pens",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        color: AppColors.primary,
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Text("Your tasks", style: TextStyle(fontSize: 28)),
            SizedBox(height: 8),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await ref.read(taskProvider.notifier).fetchTasks();
                },
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: tasks.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final task = tasks[index];

                    return TaskCard(
                      matkul: task.matkul,
                      namaTugas: task.judul,
                      deskripsi: task.deskripsi,
                      deadline: task.deadline,
                      isDone: task.isDone,
                      onTap: () {
                        ref.read(taskProvider.notifier).toggleTask(index);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
