import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/topics.dart';

part 'topic_dao.g.dart';

@DriftAccessor(tables: [Topics])
class TopicDao extends DatabaseAccessor<AppDatabase> with _$TopicDaoMixin {
  TopicDao(AppDatabase db) : super(db);

  // Watch all topics (reactive)
  Stream<List<Topic>> watchAllTopics() {
    return select(topics).watch();
  }

  // Get topics for a chapter
  Stream<List<Topic>> watchTopicsForChapter(int chapterId) {
    return (select(topics)..where((t) => t.chapterId.equals(chapterId))).watch();
  }
}
