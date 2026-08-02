import 'package:drift/drift.dart';
import '../database/app_database.dart';

class DatabaseSeeder {
  final AppDatabase db;

  DatabaseSeeder(this.db);

  Future<void> seed() async {
    final chapters = await db.chapterDao.getAllChapters();
    
    // If the first chapter is 'Mathematics' (old data), we'll clear and re-seed
    if (chapters.isNotEmpty && chapters.any((c) => c.name == 'Mathematics')) {
      await db.customStatement('DELETE FROM questions');
      await db.customStatement('DELETE FROM user_progress');
      await db.customStatement('DELETE FROM topics');
      await db.customStatement('DELETE FROM chapters');
    } else if (chapters.isNotEmpty) {
      return; // Already has the new data or other data
    }

    await db.batch((batch) {
      // 1. Insert Chapters
      batch.insertAll(db.chapters, [
        ChaptersCompanion.insert(
          name: 'Intro to Human Body',
          description: const Value('Overview of anatomy and physiology'),
          icon: const Value('accessibility'),
          orderIndex: 0,
        ),
        ChaptersCompanion.insert(
          name: 'The Chemical level of Organization',
          description: const Value('Atoms, molecules, and chemical bonds'),
          icon: const Value('science'),
          orderIndex: 1,
        ),
        ChaptersCompanion.insert(
          name: 'The Cellular level of Organization',
          description: const Value('Structure and function of cells'),
          icon: const Value('biotech'),
          orderIndex: 2,
        ),
        ChaptersCompanion.insert(
          name: 'The Tissue level of Organization',
          description: const Value('Types of tissues in the body'),
          icon: const Value('layers'),
          orderIndex: 3,
        ),
      ]);
    });
  }
}
