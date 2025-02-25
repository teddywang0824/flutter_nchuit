import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/course.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('此學期課程資訊(請以IG公告為準)'),
      ),
      body: FutureBuilder(
        future: _loadCourse(),
        builder: (BuildContext context, snapshot) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              if (snapshot.hasError) {
                return const Text('載入失敗');
              }
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: ExpansionTile(
                  title: Text(
                    snapshot.data![index].title,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text('講者：${snapshot.data![index].instructor}'),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow(
                            icon: Icons.schedule,
                            label: '上課時間',
                            value:
                                '${snapshot.data![index].time}\n${snapshot.data![index].totalWeek}',
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            '課程說明',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(snapshot.data![index].description),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
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
        ),
        Expanded(child: Text(value)),
      ],
    );
  }

  Future<List<Course>> _loadCourse() async {
    final String jsonString =
        await rootBundle.loadString('assets/json/course.json'); // 讀取檔案
    final List<dynamic> jsonList = json.decode(jsonString); // 解析 json
    return jsonList.map((json) => Course.fromJson(json)).toList(); // 轉換型別
  }
}
