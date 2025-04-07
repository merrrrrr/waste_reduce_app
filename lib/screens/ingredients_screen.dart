import 'package:flutter/material.dart';
import 'package:waste_reduce_app/screens/add_ingredient_screen.dart';

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({super.key});

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
	List _ingredients = [
		["Tomato", "2", "kg"],
		["Potato", "5", "kg"],
		["Onion", "1", "kg"],
		["Carrot", "3", "kg"],
		["Cabbage", "1", "kg"],
		["Spinach", "2", "kg"],
		["Broccoli", "1", "kg"],
		["Cauliflower", "1", "kg"],
		["Bell Pepper", "2", "kg"],
		["Zucchini", "3", "kg"],
		["Eggplant", "2", "kg"],
		["Cucumber", "5", "kg"],
		["Lettuce", "1", "kg"],
		["Radish", "2", "kg"],
		["Pumpkin", "1", "kg"],
		["Sweet Potato", "3", "kg"],
		["Beetroot", "2", "kg"],
		["Garlic", "1", "kg"],
		["Ginger", "2", "kg"],
		["Chili Pepper", "5", "kg"],
		["Green Beans", "1", "kg"],
	];

	List _filteredIngredients = [];
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _filteredIngredients = _ingredients; // Initialize with all ingredients
  }

  void _filterIngredients(String query) {
    setState(() {
      _searchQuery = query;
      _filteredIngredients = _ingredients
          .where((ingredient) =>
              ingredient[0].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

	_buildEmptyIngredientList() {
		return Expanded(
			child: Container(
				padding: EdgeInsets.all(16.0),
				child: Center(
					child: Text(
							"Your Ingredient List is Empty.\nAdd some ingredients to get started!",
							textAlign: TextAlign.center,
							style: TextStyle(
								fontSize: 18,
								color: Colors.grey[600],
							),
					),
				),
			),
		);
	}

	_buildIngredientList() {
		if (_ingredients.isEmpty) {
			return _buildEmptyIngredientList();

		} else {
			return Expanded(
				child: ListView.separated(
					separatorBuilder: (context, index) => SizedBox(height: 10),
					padding: EdgeInsets.all(8),
					itemCount: _ingredients.length,
					itemBuilder: (context, index) {
						return Column(
						  children: [
								
						    ListTile(
						    	shape: RoundedRectangleBorder(
						    		borderRadius: BorderRadius.circular(5),
						    		side: BorderSide(
						    			color: Colors.grey,
						    		),
						    	),
						    	title: Row(
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
						    	  children: [
						    	    Row(
						    	    	spacing: 12,
						    	      children: [
						    	        Text(
						    	    			_ingredients[index][0]
						    	    		),
						    	    						    
						    	    		Text(
						    	    			_ingredients[index][1],
						    	    			style: TextStyle(color: Colors.grey),
						    	    		),
						    	    						    
						    	    		Text(
						    	    			_ingredients[index][2],
						    	    			style: TextStyle(color: Colors.grey),
						    	    		),
						    	      ],
						    	    ),

											Row(
						    	    	mainAxisAlignment: MainAxisAlignment.end,
						    	    	children: [
						    	    		IconButton(
						    	    			icon: Icon(Icons.edit),
						    	    			onPressed: () {
						    	    				// Edit ingredient logic here
						    	    			},
						    	    		),

													IconButton(
						    						icon: Icon(Icons.delete),
						    						onPressed: () {
						    							setState(() {
						    								_ingredients.removeAt(index);
						    							});
						    						},
						    					),
						    	    	],
						    	    ),
						    	  ],
						    	),
						    ),
						  ],
						);
					},
				),
			);
		}
	}

_addIngredient() {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AddIngredientScreen(
        onAdd: (String name, String quantity, String unit, String expiryDate) {
          setState(() {
            _ingredients.add([name, "$quantity $unit", expiryDate]);
            _filteredIngredients = _ingredients;
          });
        },
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			appBar: AppBar(
				centerTitle: true,
				backgroundColor: Colors.teal[200],
				title: Text('Ingredients'),
			),

      body: Column(
        children: [
					Container(
						padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
						child: Column(
							children: [
								Container(
									color: Color.fromRGBO(254, 247, 255, 1.0),
									width: MediaQuery.of(context).size.width,
									child: Row(
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: [
											Text(
												"Ingredients (${_filteredIngredients.length})",
												style: TextStyle(
													fontSize: 20,
													fontWeight: FontWeight.bold,
												),
											),
								
											Row(
											  children: [
													IconButton(
														onPressed: () {},
														icon: Icon(Icons.filter_list_alt)
													),

											    IconButton(
											    	icon: Icon(Icons.sort),
											    	onPressed: () {
											    		setState(() {
											    			_ingredients.sort((a, b) => a[0].compareTo(b[0]));
											    		});
											    	},
											    ),
											  ],
											),
										],
									),
								),
						
								Container(
									color: Color.fromRGBO(254, 247, 255, 1.0),
									child: TextField(
										onChanged: _filterIngredients,
					
										decoration: InputDecoration(
											labelText: 'Search Ingredients',
											border: OutlineInputBorder(),
											prefixIcon: Icon(Icons.search),
										),
									),
								),
							],
						),
					),

          _buildIngredientList(),
        ],
      ),
			floatingActionButton: FloatingActionButton(
				onPressed: _addIngredient,
				backgroundColor: Colors.teal[200],
				child: Icon(Icons.add),
			),
		);
  }
}