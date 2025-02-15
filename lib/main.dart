import 'package:flutter/material.dart';
// import 'screens/events_page.dart';
import 'screens/course_page.dart';
import 'screens/about_page.dart';
import 'screens/gallery_page.dart';
import 'screens/social_links_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(const NCHUInfoClubApp());
}

class NCHUInfoClubApp extends StatelessWidget {
  const NCHUInfoClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NCHU Information Club',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
        fontFamily: 'NotoSansTC',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final Uri url = Uri.parse("https://forms.gle/cpCzXWN5kWUx7QQS9");
  final Uri rick = Uri.parse("https://www.youtube.com/watch?v=dQw4w9WgXcQ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(20, 2, 2, 2),
          child: Image.network("https://i.imgur.com/sQVQhdk.png"),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: const Text(
            'NCHUIT',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: ElevatedButton(
              onPressed: () async {
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  debugPrint("無法開啟連結");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // 按鈕背景色
                foregroundColor: Colors.white, // 文字顏色
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // 讓按鈕變成長方形
                ),
                elevation: 5, // 增加浮起來的感覺
                padding: EdgeInsets.symmetric(
                    horizontal: 25, vertical: 10), // 設定內距，讓按鈕更長
              ),
              child: const Text(
                "我要入社!!",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildBanner(),
                  const SizedBox(height: 30),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // 根據螢幕寬度決定文字大小和容器高度
                      double textSize =
                          constraints.maxWidth > 900 ? 24.0 : 18.0;
                      double containerHeight =
                          constraints.maxWidth > 900 ? 40.0 : 80.0;

                      return SizedBox(
                        height: containerHeight,
                        width: constraints.maxWidth > 900
                            ? double.infinity
                            : constraints.maxWidth - 50,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: textSize,
                            fontFamily: 'Courier New',
                            color: Colors.black,
                            overflow: TextOverflow.fade,
                          ),
                          maxLines: 1,
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                "這裡是中興資訊社官網，點擊下方資訊更了解我們👇",
                                speed: const Duration(milliseconds: 140),
                                textAlign: TextAlign.center,
                              ),
                              TypewriterAnimatedText(
                                  'print("這裡是中興資訊社官網，點擊下方資訊更了解我們👇")',
                                  speed: const Duration(milliseconds: 140),
                                  textAlign: TextAlign.center),
                              TypewriterAnimatedText(
                                  'std::cout << "這裡是中興資訊社官網，點擊下方資訊更了解我們👇" << std::endl;',
                                  speed: const Duration(milliseconds: 140),
                                  textAlign: TextAlign.center),
                              TypewriterAnimatedText(
                                "JavaScript 跟 Java 不一樣ㄟ",
                                speed: const Duration(milliseconds: 140),
                                textAlign: TextAlign.center,
                              ),
                              TypewriterAnimatedText(
                                  r'printf("這裡是中興資訊社官網，點擊下方資訊更了解我們👇\n");',
                                  speed: const Duration(milliseconds: 140),
                                  textAlign: TextAlign.center),
                              TypewriterAnimatedText(
                                  'System.out.println("這裡是中興資訊社官網，點擊下方資訊更了解我們👇");',
                                  speed: const Duration(milliseconds: 140),
                                  textAlign: TextAlign.center),
                              TypewriterAnimatedText(
                                  'console.log("這裡是中興資訊社官網，點擊下方資訊更了解我們👇");',
                                  speed: const Duration(milliseconds: 140),
                                  textAlign: TextAlign.center),
                              TypewriterAnimatedText("\$ rm -rf",
                                  speed: const Duration(milliseconds: 140),
                                  textAlign: TextAlign.center),
                              TypewriterAnimatedText(
                                  r'$display("這裡是中興資訊社官網，點擊下方資訊更了解我們👇");',
                                  speed: const Duration(milliseconds: 140),
                                  textAlign: TextAlign.center),
                              TypewriterAnimatedText('我要吃社團尾牙!!',
                                  speed: const Duration(milliseconds: 140),
                                  textAlign: TextAlign.center),
                              TypewriterAnimatedText(
                                  'println!("這裡是中興資訊社官網，點擊下方資訊更了解我們👇")',
                                  speed: const Duration(milliseconds: 140),
                                  textAlign: TextAlign.center),
                              TypewriterAnimatedText(
                                  'fmt.Println("這裡是中興資訊社官網，點擊下方資訊更了解我們👇")',
                                  speed: const Duration(milliseconds: 140),
                                  textAlign: TextAlign.center),
                            ],
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true,
                            pause: Duration(seconds: 2),
                            onTap: () async {
                              if (await canLaunchUrl(rick)) {
                                await launchUrl(rick,
                                    mode: LaunchMode.externalApplication);
                              } else {
                                debugPrint("無法開啟連結");
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _buildMenuGrid(),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          // Footer
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: Colors.black,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "© 2023 NCHUIT, Club",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 抽取橫幅組件
  Widget _buildBanner() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.grey,
            ]),
      ),
      height: 200,
      width: double.infinity,
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: NetworkImage('https://example.com/nchu-image.jpg'),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Image.asset("assets/images/NCHUIT_image.png"),
      // Container(
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: [
      //       Colors.black,
      //       Colors.black,
      //     ],
      // ),
      // ),
      // child: const Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Text(
      //       '歡迎來到中興大學資訊社',
      //       style: TextStyle(
      //         fontSize: 28,
      //         fontWeight: FontWeight.bold,
      //         color: Colors.white,
      //       ),
      //     ),
      //     SizedBox(height: 20),
      //   ],
      // ),
      // ),
    );
  }

  // 抽取功能選單網格組件
  Widget _buildMenuGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 根據容器寬度決定每行顯示的卡片數量
        // 當寬度大於 900px 時顯示 4 個卡片，否則顯示 2 個
        final crossAxisCount = constraints.maxWidth > 900 ? 4 : 2;

        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          // 調整卡片的長寬比例，讓它們在一列四個時不會太高
          childAspectRatio: constraints.maxWidth > 900 ? 1.5 : 1.2,
          children: [
            _buildMenuCard(
              icon: Icons.event,
              title: '課程活動',
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      CoursePage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOutCubic;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                        position: offsetAnimation, child: child);
                  },
                  transitionDuration: const Duration(milliseconds: 500),
                ),
              ),
            ),
            _buildMenuCard(
              icon: Icons.groups,
              title: '社團信息',
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      AboutPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOutCubic;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                        position: offsetAnimation, child: child);
                  },
                  transitionDuration: const Duration(milliseconds: 500),
                ),
              ),
            ),
            _buildMenuCard(
              icon: Icons.photo_album,
              title: '活動相簿',
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      GalleryPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOutCubic;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                        position: offsetAnimation, child: child);
                  },
                  transitionDuration: const Duration(milliseconds: 500),
                ),
              ),
            ),
            _buildMenuCard(
              icon: Icons.link,
              title: '社群資訊',
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      SocialLinksPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOutCubic;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                        position: offsetAnimation, child: child);
                  },
                  transitionDuration: const Duration(milliseconds: 500),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.green),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.7, // 調整行高
                letterSpacing: 0.5, // 增加字距
              ),
            ),
          ],
        ),
      ),
    );
  }
}
