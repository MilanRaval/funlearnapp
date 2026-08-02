import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/chapters.dart';

part 'chapter_dao.g.dart';

@DriftAccessor(tables: [Chapters])
class ChapterDao extends DatabaseAccessor<AppDatabase> with _$ChapterDaoMixin {
  ChapterDao(AppDatabase db) : super(db);

  Future<List<Chapter>> getAllChapters() => select(chapters).get();

  Stream<List<Chapter>> watchAllChapters() => select(chapters).watch();
  
  Future<int> countChapters() async {
    final count = chapters.id.count();
    final query = selectOnly(chapters)..addColumns([count]);
    return await query.map((row) => row.read(count)).getSingle() ?? 0;
  }
}
