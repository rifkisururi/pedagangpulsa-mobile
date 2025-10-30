import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const PedagangPulsaApp());
}

class PedagangPulsaApp extends StatelessWidget {
  const PedagangPulsaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedagang Pulsa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade50,
        ),
      ),
      home: const LoginPage(),
    );
  }
}
