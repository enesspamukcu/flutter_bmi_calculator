import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.blue,
          appBarTheme: AppBarTheme(color: Color.fromRGBO(250, 250, 250, 1),),
          scaffoldBackgroundColor:Color.fromRGBO(250, 250, 250, 1),),
      home: HomePage(),
    );
  }
}
