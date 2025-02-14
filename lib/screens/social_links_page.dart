import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinksPage extends StatelessWidget {
  const SocialLinksPage({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('無法開啟 $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('社群連結'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSocialCard(
            icon: Icons.facebook,
            title: 'Facebook 粉絲專頁',
            subtitle: '追蹤最新社團動態和活動資訊',
            color: Colors.blue,
            onTap: () => _launchUrl('https://facebook.com'),
          ),
          _buildSocialCard(
            icon: Icons.discord,
            title: 'Discord 社群',
            subtitle: '加入我們的線上討論社群',
            color: Colors.indigo,
            onTap: () => _launchUrl('https://discord.gg'),
          ),
          _buildSocialCard(
            icon: Icons.mail,
            title: '聯絡我們',
            subtitle: 'infoclub@nchu.edu.tw',
            color: Colors.red,
            onTap: () => _launchUrl('mailto:infoclub@nchu.edu.tw'),
          ),
          const SizedBox(height: 20),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '社團辦公室',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('地點：資訊大樓 2F 社團辦公室'),
                  Text('開放時間：週一至週五 12:00-18:00'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
