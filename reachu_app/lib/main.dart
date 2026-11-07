import 'package:flutter/material.dart';
import 'screen3.dart';

void main() {
  runApp(const ReachUApp());
}

class ReachUApp extends StatelessWidget {
  const ReachUApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReachU',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const TopicsScreen(),
    );
  }
}