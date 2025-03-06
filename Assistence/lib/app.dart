import 'package:flutter/material.dart';
import 'package:getx/screens/home_screen.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendee Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyanAccent,
        ),
        useMaterial3: false,
      ),
      home: HomeScreen(),
    );
  }
} 
  