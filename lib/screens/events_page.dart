import 'package:flutter/material.dart';
import '../models/event.dart';

class EventsPage extends StatelessWidget {
  EventsPage({super.key});

  final List<Event> events = [
    Event(
      title: '程式設計入門工作坊',
      description: '適合初學者的Python程式設計課程，從基礎語法開始教起。',
      date: DateTime(2024, 3, 15),
      imageUrl: 'assets/images/python_workshop.jpg',
      location: '資訊大樓 104 教室',
    ),
    // 可以添加更多活動
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('該學期課程活動'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
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
                        event.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 16),
                          const SizedBox(width: 8),
                          Text(
                            '${event.date.year}/${event.date.month}/${event.date.day}',
                          ),
                          const SizedBox(width: 16),
                          const Icon(Icons.location_on, size: 16),
                          const SizedBox(width: 8),
                          Text(event.location),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(event.description),
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
}
