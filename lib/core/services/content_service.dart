import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/topic_model.dart';

class ContentService {
  Future<List<TopicOfTheDay>> loadTopics() async {
    final String response = await rootBundle.loadString('assets/data/topic_of_the_day.json');
    final data = await json.decode(response) as List<dynamic>;
    return data.map((json) => TopicOfTheDay.fromJson(json as Map<String, dynamic>)).toList();
  }
}
