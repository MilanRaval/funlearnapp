import 'package:drift/drift.dart';

class Chapters extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get icon => text().nullable()();
  IntColumn get orderIndex => integer()();
}
