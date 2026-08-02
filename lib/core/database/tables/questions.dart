import 'package:drift/drift.dart';
import 'package:funlearnapp/core/database/tables/topics.dart';

class Questions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get topicId => integer().references(Topics, #id)();
  IntColumn get level => integer()();
  IntColumn get score => integer()();
  TextColumn get questionText => text()();
  TextColumn get optionA => text()();
  TextColumn get optionB => text()();
  TextColumn get optionC => text().nullable()();
  TextColumn get optionD => text().nullable()();
  TextColumn get correctAnswer => text()();
  TextColumn get explanation => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
}
