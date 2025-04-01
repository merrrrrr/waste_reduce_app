import 'package:flutter/material.dart';

class ExpiryScreen extends StatelessWidget {
  const ExpiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			appBar: AppBar(
				centerTitle: true,
				backgroundColor: Colors.teal[200],
				title: Text('Expiry Tracker'),
			),
			body: Center(
				child: Text('Expiry Screen'),
			),
		);
  }
}