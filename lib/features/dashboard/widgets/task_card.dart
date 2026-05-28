import 'package:flutter/material.dart';
import 'package:hamin/core/theme/app_colors.dart';

class TaskCard extends StatelessWidget {
  final String matkul;
  final String namaTugas;
  final String deskripsi;
  final String deadline;
  final bool isDone;
  final VoidCallback onCheck;
  final VoidCallback onCardTap;

  const TaskCard({
    super.key,
    required this.matkul,
    required this.namaTugas,
    required this.deskripsi,
    required this.deadline,
    required this.isDone,
    required this.onCheck,
    required this.onCardTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        width: double.infinity,
        height: 200,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              matkul,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
      
            const SizedBox(height: 4),
      
            Text(
              "Nama Tugas : $namaTugas",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
      
            const SizedBox(height: 4),
      
            Text(
              "Deskripsi : $deskripsi",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
      
            const Spacer(),
      
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Text(
                        deadline,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
      
                const Spacer(),
      
                GestureDetector(
                  onTap: onCheck,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color:
                          isDone ? AppColors.primary : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color:
                            isDone ? AppColors.primary : Colors.grey.shade400,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isDone
                              ? AppColors.primary.withOpacity(0.3)
                              : Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      color: isDone ? Colors.white : Colors.grey,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}