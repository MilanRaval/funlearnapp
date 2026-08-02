import 'package:drift/drift.dart';
import 'package:funlearnapp/core/database/tables/chapters.dart';

class Topics extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get chapterId => integer().references(Chapters, #id)();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  IntColumn get orderIndex => integer()();
}
