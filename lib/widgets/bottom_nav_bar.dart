import 'package:flutter/material.dart';
import 'package:waste_reduce_app/screens/home_screen.dart';
import 'package:waste_reduce_app/screens/ingredients_screen.dart';
import 'package:waste_reduce_app/screens/profile_screen.dart';
import 'package:waste_reduce_app/screens/recipes_screen.dart';
import 'package:waste_reduce_app/screens/expiry_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
	final List _screenList = [
		HomeScreen(),
		RecipesScreen(),
		IngredientsScreen(),
		ExpiryScreen(),
		ProfileScreen(),
	];

	int _selectedIndex = 0;

	void _changeScreen(int index) {
		setState(() {
			_selectedIndex = index;
		});
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			body: _screenList[_selectedIndex],
			bottomNavigationBar: BottomNavigationBar(
				type: BottomNavigationBarType.fixed,
				backgroundColor: Colors.teal[200],
				selectedItemColor: Colors.teal[700],
				unselectedItemColor: Colors.grey[700],
				items: [
					BottomNavigationBarItem(
						icon: Icon(Icons.home),
						label: 'Home',
					),

					BottomNavigationBarItem(
						icon: Icon(Icons.restaurant_menu),
						label: 'Recipes',
					),

					BottomNavigationBarItem(
						icon: Icon(Icons.kitchen),
						label: 'Ingredients',
					),

					BottomNavigationBarItem(
						icon: Icon(Icons.access_time_filled),
						label: 'Expiry',
					),

					BottomNavigationBarItem(
						icon: Icon(Icons.person),
						label: 'Profile',
					),

				],
				currentIndex: _selectedIndex,
				onTap: _changeScreen ,

			),
			
		);
  }
}