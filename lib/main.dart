import 'package:flutter/material.dart';
import 'core/services/notification_service.dart';
import 'features/dasboard/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Notification Service
  try {
    final notificationService = NotificationService();
    await notificationService.init();
    await notificationService.scheduleDaily6AMNotification();
  } catch (e) {
    debugPrint('Failed to initialize notifications: $e');
  }

  runApp(const FunAtomyApp());
}

class FunAtomyApp extends StatelessWidget {
  const FunAtomyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FunAtomy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}
