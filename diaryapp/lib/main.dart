import 'package:flutter/material.dart';
import 'diary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DiaryApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(82, 179, 239, 238)),
        useMaterial3: true,
      ),
      home: DiaryPage(),
    );
  }
}
