import 'package:flutter/material.dart';
import 'package:waste_reduce_app/firebase_options.dart';
import 'package:waste_reduce_app/screens/login_screen.dart';
import 'package:waste_reduce_app/widgets/bottom_nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
	WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp(
		options: DefaultFirebaseOptions.currentPlatform,
	);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			title: 'Food Waste Reduce App',
			debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}
