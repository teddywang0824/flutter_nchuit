class Member {
  final String name;
  final String position;
  final String description;

  Member(
      {required this.name, required this.position, required this.description});

  // 解析 JSON
  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
        name: json['name'],
        position: json['position'],
        description: json['description']);
  }
}
