import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/member.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});
  final Uri url = Uri.parse(
      "https://docs.google.com/spreadsheets/d/1I4mREkUJYozfvOM75juT45uiS2cUI6VcydIk2hXpJQ4/edit?gid=0#gid=0");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '關於我們',
        ),
        backgroundColor: Color(0xFFFAF9F6),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFAF9F6),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSectionTitle('資訊社在幹啥?'),
              const SizedBox(height: 30),
              Container(
                width: 800,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green.shade50, Colors.blue.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const Text(
                      '我們的目標是推廣興大的資訊風氣，使興大有更多能夠了解並且使用資訊科技的同學們，並且能夠透過本社團互相交流、取暖(?)',
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.6,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    const Text(
                      '如果你對我們有興趣，請在粉專上面按個讚，我們會不定期有資訊講座，還有一些有趣的資訊新聞分享，才不會錯過喔！',
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.6,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              _buildSectionTitle('社團收支表'),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.amber[600]!, Colors.amber[200]!], // 漸層金色
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton.icon(
                  onPressed: () async {
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      debugPrint("無法開啟連結");
                    }
                  },
                  icon: const Icon(Icons.account_balance_wallet,
                      color: Colors.white),
                  label: const Text(
                    "查看收支表",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 90, vertical: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              _buildSectionTitle('社團辦公室'),
              const SizedBox(height: 30),
              Container(
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.green,
                      size: MediaQuery.of(context).size.width * 0.04,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Text(
                      '雲平樓 3F 資訊社辦公室',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05 > 35
                            ? 35
                            : MediaQuery.of(context).size.width * 0.05,
                        height: 1.5,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('社團幹部'),
              const SizedBox(height: 16),
              FutureBuilder<List<Member>>(
                future: _loadMembers(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        children: [
                          const Icon(Icons.error_outline,
                              size: 48, color: Colors.red),
                          const SizedBox(height: 8),
                          Text('載入失敗: ${snapshot.error}'),
                        ],
                      ),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.green,
            width: 4,
          ),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 40,
          color: Color.fromARGB(255, 48, 109, 50),
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
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      position,
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
