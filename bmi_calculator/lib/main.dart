import 'package:flutter/material.dart';
import 'input_page.dart';
import 'results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        textTheme: const TextTheme(
        bodyText2: TextStyle(
            color: Colors.white,
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: Color(0xFF0A0E21),
      ),
      scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: '/',
      routes: {
        '/' :(context) => InputPage(),
      },
    );
  }
}

