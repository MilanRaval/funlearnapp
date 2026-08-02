import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/database/app_database.dart';
import 'core/services/database_seeder.dart';
import 'features/dasboard/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final db = AppDatabase();
  
  // Seed the database with initial data
  await DatabaseSeeder(db).seed();
  
  runApp(
    Provider<AppDatabase>(
      create: (_) => db,
      child: const FunLearnApp(),
    ),
  );
}

class FunLearnApp extends StatelessWidget {
  const FunLearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FunLearn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}
