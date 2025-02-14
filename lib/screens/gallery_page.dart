import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({super.key});

  final List<GalleryItem> galleryItems = [
    GalleryItem(
      title: '2024 程式設計工作坊',
      date: '2024/03/15',
      imageUrls: [
        'https://example.com/workshop1.jpg',
        'https://example.com/workshop2.jpg',
        'https://example.com/workshop3.jpg',
      ],
    ),
    // 可以添加更多相簿
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('活動相簿'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: galleryItems.length,
        itemBuilder: (context, index) {
          final item = galleryItems[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item.date,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: item.imageUrls.length,
                    itemBuilder: (context, imageIndex) {
                      return GestureDetector(
                        onTap: () {
                          _showFullScreenImage(
                            context,
                            item.imageUrls[imageIndex],
                          );
                        },
                        child: Container(
                          width: 300,
                          margin: const EdgeInsets.only(left: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item.imageUrls[imageIndex],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showFullScreenImage(BuildContext context, String imageUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          body: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Center(
              child: InteractiveViewer(
                child: Image.network(imageUrl),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GalleryItem {
  final String title;
  final String date;
  final List<String> imageUrls;

  GalleryItem({
    required this.title,
    required this.date,
    required this.imageUrls,
  });
}
