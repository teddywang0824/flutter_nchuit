import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            icon: FontAwesomeIcons.facebookF,
            title: 'Facebook 粉絲專頁',
            subtitle: '追蹤最新社團動態和活動資訊',
            color: Colors.blue,
            onTap: () => _launchUrl('https://facebook.com'),
          ),
          _buildSocialCard(
            icon: FontAwesomeIcons.discord,
            title: 'Discord 社群',
            subtitle: '加入我們的線上討論社群',
            color: Colors.indigo,
            onTap: () => _launchUrl('https://discord.gg'),
          ),
          _buildSocialCard(
            icon: FontAwesomeIcons.line,
            title: 'Line 社群',
            subtitle: '得到最新消息',
            color: Colors.green,
            onTap: () => _launchUrl('https://discord.gg'),
          ),
          _buildSocialCard(
            icon: FontAwesomeIcons.instagram,
            title: 'Instagram 專頁',
            subtitle: '得知最新課程、活動消息',
            color: Colors.purple,
            onTap: () => _launchUrl('https://discord.gg'),
          ),
          // _buildSocialCard(
          //   icon: Icons.mail,
          //   title: '聯絡我們',
          //   subtitle: 'infoclub@nchu.edu.tw',
          //   color: Colors.red,
          //   onTap: () => _launchUrl('mailto:infoclub@nchu.edu.tw'),
          // ),
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
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: FaIcon(icon, color: Colors.white, size: 20),
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
