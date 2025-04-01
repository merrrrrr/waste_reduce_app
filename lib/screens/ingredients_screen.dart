import 'package:flutter/material.dart';

class IngredientsScreen extends StatelessWidget {
  const IngredientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			appBar: AppBar(
				centerTitle: true,
				backgroundColor: Colors.teal[200],
				title: Text('Ingredients'),
			),
			body: Expanded(
				child: Container(
					padding: EdgeInsets.all(16.0),
					child: Center(
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								Icon(
									Icons.add_circle_outline,
									size: 100,
									color: Colors.teal[200]
								),

								Text(
									"Your Ingredient List is Empty.\nAdd some ingredients to get started!",
									textAlign: TextAlign.center,
								),
						
								ElevatedButton(
									onPressed: () {},
									child: Text('Add Ingredients'),
								),
						
							],
						),
					),

				),
			),
		);
  }
}