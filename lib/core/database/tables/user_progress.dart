import 'package:drift/drift.dart';
import 'package:funlearnapp/core/database/tables/topics.dart';

class UserProgress extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get topicId => integer().references(Topics, #id)();
  IntColumn get points => integer().withDefault(const Constant(0))();
  TextColumn get completedQuestions => text().nullable()(); // JSON list
}
