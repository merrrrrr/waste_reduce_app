import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			appBar: AppBar(
				centerTitle: true,
				backgroundColor: Colors.teal[200],
				title: Text('Home'),
			),
			body: Center(
				child: Text('Home Screen'),
			),
		);
  }
}