import 'dart:math';

import 'package:flutter/material.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			appBar: AppBar(
				centerTitle: true,
				backgroundColor: Colors.teal[200],
				title: Text('Recipes'),
			),

			body: ListView(
				padding: EdgeInsets.all(12),
				children: [
					Container(
						margin: EdgeInsets.only(bottom: 10),
						child: TextField(
							decoration: InputDecoration(
								labelText: 'Search Recipes',
								border: OutlineInputBorder(),
								suffixIcon: Icon(Icons.search),
							),
						),
					),

					Row(
						children: [
							Expanded(
								child: FilledButton(
									onPressed: () {},
									style: FilledButton.styleFrom(
										backgroundColor: Colors.teal[100],
										fixedSize: Size(100, 100),
										shape: RoundedRectangleBorder(
											borderRadius: BorderRadius.circular(0),
										),
										
									),
									child: Center(
										child: Text('Popular'),
									),
								),
							),

							Expanded(
								child: FilledButton(
									onPressed: () {},
									style: FilledButton.styleFrom(
										backgroundColor: Colors.teal[200],
										fixedSize: Size(100, 100),
										shape: RoundedRectangleBorder(
											borderRadius: BorderRadius.circular(0),
										),
										
									),
									child: Center(
										child: Text('Latest'),
									),
								),
							),
						],
					),

					Row(
						children: [
							Expanded(
								child: FilledButton(
									onPressed: () {},
									style: FilledButton.styleFrom(
										backgroundColor: Colors.teal[300],
										fixedSize: Size(100, 100),
										shape: RoundedRectangleBorder(
											borderRadius: BorderRadius.circular(0),
										),
										
									),
									child: Center(
										child: Text('Category 3'),
									),
								),
							),

							Expanded(
								child: FilledButton(
									onPressed: () {},
									style: FilledButton.styleFrom(
										backgroundColor: Colors.teal[400],
										fixedSize: Size(100, 100),
										shape: RoundedRectangleBorder(
											borderRadius: BorderRadius.circular(0),
										),
										
									),
									child: Center(
										child: Text('Category 4'),
									),
								),
							),
						],
					),

					Row(
						children: [
							OutlinedButton(
								onPressed: () {},
								child: Text('Recommended'),
							),

							OutlinedButton(
								onPressed: () {},
								child: Text('Popular'),
							),

							OutlinedButton(
								onPressed: () {},
								child: Text('Latest'),
							),
						],
					),
					
					Card(
						child: ListTile(
							title: Text('Recipe 1'),
							subtitle: Text('Description of Recipe 1'),
							trailing: Icon(Icons.arrow_forward),
							onTap: () {
								// Navigate to recipe details
							},
						),
					),
					Card(
						child: ListTile(
							title: Text('Recipe 2'),
							subtitle: Text('Description of Recipe 2'),
							trailing: Icon(Icons.arrow_forward),
							onTap: () {
								// Navigate to recipe details
							},
						),
					),
				],
			)
		);
  }
}