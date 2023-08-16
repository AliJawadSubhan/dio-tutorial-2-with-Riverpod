import 'package:flutter/material.dart';
import 'package:hackermoondiooo/features/CRUD/presentation/screens/home_screen.dart';

class UserRecords extends StatelessWidget {
  const UserRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo,
        appBarTheme: const AppBarTheme(color: Colors.indigo, centerTitle: true),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
