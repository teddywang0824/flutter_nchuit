import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/member.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('關於我們'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '資訊社在幹啥?',
              style: TextStyle(
                fontSize: 24,
                // fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  '中興大學資訊社是一個致力於推廣程式設計和資訊科技的學生組織。我們提供各種程式設計課程、舉辦技術講座，並創造一個讓同學們互相學習和交流的平台。',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '社團幹部',
              style: TextStyle(
                fontSize: 24,
                // fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            FutureBuilder<List<Member>>(
              future: _loadMembers(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('載入失敗');
                }
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                return Column(
                  children: snapshot.data!
                      .map((member) => _buildMemberCard(
                            name: member.name,
                            position: member.position,
                            description: member.description,
                            imageUrl:
                                'https://example.com/${member.position}.jpg',
                          ))
                      .toList(),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              '社團辦公室',
              style: TextStyle(
                fontSize: 24,
                // fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('地點：雲萍樓 3F 資訊社辦公室'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Member>> _loadMembers() async {
    final String jsonString =
        await rootBundle.loadString('assets/json/member.json'); // 讀取檔案
    final List<dynamic> jsonList = json.decode(jsonString); // 解析 json
    return jsonList.map((json) => Member.fromJson(json)).toList(); // 轉換型別
  }

  Widget _buildMemberCard({
    required String name,
    required String position,
    required String description,
    required String imageUrl,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    position,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
