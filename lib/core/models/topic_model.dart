class TopicOfTheDay {
  final int id;
  final String topicDescription;
  final String topicImagePath;

  TopicOfTheDay({
    required this.id,
    required this.topicDescription,
    required this.topicImagePath,
  });

  factory TopicOfTheDay.fromJson(Map<String, dynamic> json) {
    return TopicOfTheDay(
      id: json['id'] as int,
      topicDescription: json['topicDescription'] as String,
      topicImagePath: json['topicImagePath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'topicDescription': topicDescription,
      'topicImagePath': topicImagePath,
    };
  }
}
