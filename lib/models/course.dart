class Course {
  final String title;
  final String instructor;
  final String description;
  final String time;
  final String totalWeek;

  Course({
    required this.title,
    required this.instructor,
    required this.description,
    required this.time,
    required this.totalWeek,
  });

  // 解析 JSON
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      title: json['title'],
      instructor: json['instructor'],
      description: json['description'],
      time: json['time'],
      totalWeek: json['totalWeek'],
    );
  }
}
