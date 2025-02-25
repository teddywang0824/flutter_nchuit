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
    final List<Map<String, dynamic>> socialLinks = [
      {
        'icon': FontAwesomeIcons.facebookF,
        'title': 'Facebook 粉絲專頁',
        'subtitle': '追蹤最新社團動態和活動資訊',
        'color': Colors.blue,
        'url': 'https://www.facebook.com/nchuit.cc/',
      },
      {
        'icon': FontAwesomeIcons.discord,
        'title': 'Discord 社群',
        'subtitle': '加入我們的線上討論社群',
        'color': Colors.indigo,
        'url': 'https://discord.gg/6KNPVXhC',
      },
      {
        'icon': FontAwesomeIcons.line,
        'title': 'Line 社群',
        'subtitle': '得到最新消息',
        'color': Colors.green,
        'url': 'https://line.me/ti/g2/bCw9X0sudfU1pZIzIGCEZHxsoDsDzbAe8HYlQA',
      },
      {
        'icon': FontAwesomeIcons.instagram,
        'title': 'Instagram 專頁',
        'subtitle': '得知最新課程、活動消息',
        'color': Colors.purple,
        'url': 'https://www.instagram.com/nchuit.cc',
      },
      {
        'icon': FontAwesomeIcons.youtube,
        'title': 'Youtube 頻道',
        'subtitle': '重溫我們的社團紀錄吧!記得訂閱喔~',
        'color': Colors.red,
        'url': 'https://www.youtube.com/@nchuit',
      },
      {
        'icon': FontAwesomeIcons.github,
        'title': 'Github',
        'subtitle': '想知道我們做了哪些東西嗎?',
        'color': Colors.black,
        'url': 'https://github.com/NCHUIT',
      },
      {
        'icon': Icons.mail,
        'title': '聯絡我們',
        'subtitle': 'it.nchu@gmail.com',
        'color': Colors.red,
        'url':
            'https://mail.google.com/mail/u/0/#drafts?compose=DmwnWsmCLCqSFWZnFVdKDclwgVFPFzVwWhpcgCQdcNZDFGvGKMLRPvnLxltcjLcVsdtbmWrxxsDL',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('社群連結'),
        backgroundColor: Color(0xFFD0E8D0),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: ConnectionPainter(socialLinks.length),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFD0E8D0), Color(0xFFE8F5E9)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: ConnectionPainter(socialLinks.length),
                    ),
                  ),
                  Padding(
                    padding: MediaQuery.of(context).size.width > 900
                        ? const EdgeInsets.fromLTRB(200, 20, 200, 40)
                        : const EdgeInsets.all(20),
                    child: Wrap(
                      runSpacing: 16,
                      children: List.generate(socialLinks.length, (index) {
                        final item = socialLinks[index];
                        return Align(
                          alignment: index % 2 == 0
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: _buildSocialCard(
                            icon: item['icon'],
                            title: item['title'],
                            subtitle: item['subtitle'],
                            color: item['color'],
                            onTap: () => _launchUrl(item['url']),
                          ),
                        );
                      }),
                    ),
                  ),
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
    return Container(
      width: 350,
      height: 180, // 固定寬度，讓卡片不會太長
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        shadowColor: Colors.black,
        color: Colors.white,
        child: Center(
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.5),
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: FaIcon(icon, color: Colors.white, size: 24),
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}

class ConnectionPainter extends CustomPainter {
  final int itemCount;
  ConnectionPainter(this.itemCount);

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double startY = 70;
    final double endY = size.height - 50;

    final Paint solidLinePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final Paint dashedLinePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
        Offset(centerX, startY), Offset(centerX, endY), solidLinePaint);

    for (int i = 0; i < itemCount; i++) {
      double cardY = startY + (i * 125); // 讓每個卡片位置間距相同
      double targetX = (i % 2 == 0) ? centerX - 170 : centerX + 170; // 左右擺放

      Path path = Path()
        ..moveTo(centerX, cardY)
        ..lineTo(targetX, cardY);

      canvas.drawPath(
        path,
        dashedLinePaint..strokeCap = StrokeCap.round,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
