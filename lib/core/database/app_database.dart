import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/chapters.dart';
import 'tables/topics.dart';
import 'tables/questions.dart';
import 'tables/user_progress.dart';
import 'daos/topic_dao.dart';
import 'daos/chapter_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Chapters, Topics, Questions, UserProgress],
  daos: [TopicDao, ChapterDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          // We added the 'icon' column to chapters in version 2
          await m.addColumn(chapters, chapters.icon);
        }
      },
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'funlearn.sqlite'));
    return NativeDatabase(file);
  });
}
