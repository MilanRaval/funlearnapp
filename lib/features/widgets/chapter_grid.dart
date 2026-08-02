import 'package:flutter/material.dart';
import 'package:funlearnapp/core/database/app_database.dart';
import 'chapter_card.dart';

class ChapterGrid extends StatelessWidget {
  final List<Chapter> chapters;

  const ChapterGrid({
    super.key,
    required this.chapters,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: chapters.length,
      itemBuilder: (context, index) {
        final chapter = chapters[index];
        return ChapterCard(
          title: chapter.name,
          icon: _getIconData(chapter.icon),
        );
      },
    );
  }

  IconData _getIconData(String? iconName) {
    switch (iconName) {
      case 'accessibility':
        return Icons.accessibility;
      case 'science':
        return Icons.science;
      case 'biotech':
        return Icons.biotech;
      case 'layers':
        return Icons.layers;
      default:
        return Icons.book;
    }
  }
}
