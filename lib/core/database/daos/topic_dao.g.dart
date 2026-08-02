// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_dao.dart';

// ignore_for_file: type=lint
mixin _$TopicDaoMixin on DatabaseAccessor<AppDatabase> {
  $ChaptersTable get chapters => attachedDatabase.chapters;
  $TopicsTable get topics => attachedDatabase.topics;
  TopicDaoManager get managers => TopicDaoManager(this);
}

class TopicDaoManager {
  final _$TopicDaoMixin _db;
  TopicDaoManager(this._db);
  $$ChaptersTableTableManager get chapters =>
      $$ChaptersTableTableManager(_db.attachedDatabase, _db.chapters);
  $$TopicsTableTableManager get topics =>
      $$TopicsTableTableManager(_db.attachedDatabase, _db.topics);
}
