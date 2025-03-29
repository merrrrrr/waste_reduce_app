import 'package:flutter/material.dart';
import 'package:waste_reduce_app/screens/home_screen.dart';
import 'package:waste_reduce_app/screens/search_screen.dart';
import 'package:waste_reduce_app/screens/profile_screen.dart';
import 'package:waste_reduce_app/screens/recipes_screen.dart';
import 'package:waste_reduce_app/screens/settings_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
	final List _screenList = [
		HomeScreen(),
		RecipesScreen(),
		SearchScreen(),
		ProfileScreen(),
		SettingsScreen(),
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
						icon: Icon(Icons.menu_book_rounded),
						label: 'Recipes',
					),

					BottomNavigationBarItem(
						icon: Icon(Icons.search),
						label: 'Search',
					),

					BottomNavigationBarItem(
						icon: Icon(Icons.person),
						label: 'Profile',
					),

					BottomNavigationBarItem(
						icon: Icon(Icons.settings),
						label: 'Settings',
					)
				],
				currentIndex: _selectedIndex,
				onTap: _changeScreen ,

			),
			
		);
  }
}