import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CalculadoraMediaApp());
}

class CalculadoraMediaApp extends StatelessWidget {
  const CalculadoraMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de Média',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}