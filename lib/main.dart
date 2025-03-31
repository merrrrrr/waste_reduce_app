import 'package:flutter/material.dart';
import 'package:waste_reduce_app/widgets/bottom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			title: 'Food Waste Reduce App',
			// home: const MyHomePage(title: 'Waste Reduce App Home Page'),
			debugShowCheckedModeBanner: false,
      home: BottomNavBar()
    );
  }
}
