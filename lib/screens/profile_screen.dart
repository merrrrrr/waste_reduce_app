import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

	void _signOut() {
		FirebaseAuth.instance.signOut().then((value) {
			print('User signed out successfully!');
			// Navigate to the login screen or show a success message
		}).catchError((error) {
			print('Sign-out failed: ${error.message}');
		});
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			appBar: AppBar(
				centerTitle: true,
				backgroundColor: Colors.teal[200],
				title: Text('Profile'),
			),
			body: SingleChildScrollView(
				padding: const EdgeInsets.all(24.0),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						crossAxisAlignment: CrossAxisAlignment.stretch,
						children: [
							ElevatedButton(
								onPressed: () {},
								style: ElevatedButton.styleFrom(
									backgroundColor: Colors.red[600],
									padding: const EdgeInsets.symmetric(vertical: 16),
									shape: RoundedRectangleBorder(
										borderRadius: BorderRadius.circular(12),
									),
								),
								child: Text(
									'Sign Out',
									style: TextStyle(
										fontSize: 18,
										fontWeight: FontWeight.bold,
										color: Colors.white,
									),
								),
							),
						],
					),
				),
		);
  }
}