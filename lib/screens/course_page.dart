import 'package:flutter/material.dart';
import '../models/course.dart';

class CoursePage extends StatelessWidget {
  CoursePage({super.key});

  final List<Course> courses = [
    Course(
      title: 'Python 程式設計入門',
      instructor: '王小明',
      description: '從零開始學習Python程式設計，適合完全沒有程式基礎的同學。',
      level: '初學者',
      schedule: ['每週三 18:30-20:30', '共8週課程'],
    ),
    Course(
      title: 'Web 前端開發',
      instructor: '李小華',
      description: '學習HTML、CSS和JavaScript，建立自己的網站。',
      level: '中級',
      schedule: ['每週五 18:30-20:30', '共10週課程'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('課程資訊'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ExpansionTile(
              title: Text(
                course.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('講師：${course.instructor}'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow(
                        icon: Icons.bar_chart,
                        label: '課程難度',
                        value: course.level,
                      ),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                        icon: Icons.schedule,
                        label: '上課時間',
                        value: course.schedule.join('\n'),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '課程說明',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(course.description),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: 實現課程報名功能
                        },
                        child: const Text('立即報名'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Text(
          '$label：',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(child: Text(value)),
      ],
    );
  }
}
