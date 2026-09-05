import 'package:flutter/material.dart';
import '../../core/models/topic_model.dart';
import '../../core/services/content_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ContentService _contentService = ContentService();
  List<TopicOfTheDay>? _topics;
  int _currentIndex = 0;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    try {
      final topics = await _contentService.loadTopics();
      if (topics.isNotEmpty) {
        final day = DateTime.now().day;
        int index = topics.indexWhere((t) => t.id == day);
        if (index == -1) {
          // If no direct match, cycle through available topics using the day
          index = (day - 1) % topics.length;
        }
        setState(() {
          _topics = topics;
          _currentIndex = index;
          _isLoading = false;
        });
      } else {
        setState(() {
          _topics = [];
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _nextTopic() {
    if (_topics == null || _topics!.isEmpty) return;
    setState(() {
      _currentIndex = (_currentIndex + 1) % _topics!.length;
    });
  }

  void _previousTopic() {
    if (_topics == null || _topics!.isEmpty) return;
    setState(() {
      _currentIndex = (_currentIndex - 1 + _topics!.length) % _topics!.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Scaffold(
        body: Center(child: Text("Error: $_error")),
      );
    }

    if (_topics == null || _topics!.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("No topics found.")),
      );
    }

    final topic = _topics![_currentIndex];
    final size = MediaQuery.of(context).size;
    final imageHeight = size.height * 0.5;

    // Check if the current topic is the daily one using Day of Month logic
    final day = DateTime.now().day;
    int dailyIndex = _topics!.indexWhere((t) => t.id == day);
    if (dailyIndex == -1) {
      dailyIndex = (day - 1) % _topics!.length;
    }
    final isDailyTopic = _currentIndex == dailyIndex;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        color: Colors.black, // Background for letterboxing
                        child: Image.asset(
                          topic.topicImagePath,
                          height: imageHeight,
                          width: double.infinity,
                          fit: BoxFit.contain, // Show full image
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: imageHeight,
                              color: Colors.grey.shade300,
                              child: const Icon(Icons.image, size: 50, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isDailyTopic ? "TOPIC OF THE DAY" : "FEATURED TOPIC",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent.withOpacity(0.8),
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              topic.topicDescription,
                              style: const TextStyle(
                                fontSize: 21,
                                height: 1.5,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Left Navigation Button
                  Positioned(
                    left: 12,
                    child: _buildNavigationButton(
                      icon: Icons.chevron_left,
                      onPressed: _previousTopic,
                    ),
                  ),
                  // Right Navigation Button
                  Positioned(
                    right: 12,
                    child: _buildNavigationButton(
                      icon: Icons.chevron_right,
                      onPressed: _nextTopic,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, size: 32, color: Colors.blueAccent),
        onPressed: onPressed,
      ),
    );
  }
}
