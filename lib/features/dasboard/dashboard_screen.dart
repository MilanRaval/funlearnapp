import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:funlearnapp/features/widgets/chapter_grid.dart';
import '../../core/database/app_database.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);

    return StreamBuilder<List<Chapter>>(
      stream: db.chapterDao.watchAllChapters(),
      builder: (context, snapshot) {
        final chapters = snapshot.data ?? [];

        return Scaffold(
          backgroundColor: Colors.grey.shade50,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            title: Row(
              children: [
                const Text(
                  "Fun Learn",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.black54),
                  onPressed: () {},
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.orange.shade200),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.stars, size: 16, color: Colors.orange),
                      const SizedBox(width: 4),
                      const Text(
                        "120",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : chapters.isEmpty 
                  ? const Center(child: Text("No chapters found. Try restarting the app to seed data."))
                  : ChapterGrid(chapters: chapters),
        );
      },
    );
  }
}
