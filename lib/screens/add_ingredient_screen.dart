import 'package:flutter/material.dart';

class AddIngredientScreen extends StatefulWidget {
  final Function(String name, String quantity, String unit, String expiryDate) onAdd;

  const AddIngredientScreen({super.key, required this.onAdd});

  @override
  State<AddIngredientScreen> createState() => _AddIngredientScreenState();
}

class _AddIngredientScreenState extends State<AddIngredientScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  String _selectedUnit = 'g'; // Default unit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Ingredient'),
        backgroundColor: Colors.teal[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name TextField
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.fastfood),
              ),
            ),
            const SizedBox(height: 16),

            // Quantity TextField with Dropdown for Unit
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.scale),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _selectedUnit,
                  items: ['g', 'kg', 'ml', 'pcs']
                      .map((unit) => DropdownMenuItem(
                            value: unit,
                            child: Text(unit),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedUnit = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Expiry Date TextField
            TextField(
              controller: _expiryDateController,
              decoration: InputDecoration(
                labelText: 'Expiry Date (YYYY-MM-DD)',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(height: 24),

            // Add Button
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text.trim();
                final quantity = _quantityController.text.trim();
                final expiryDate = _expiryDateController.text.trim();

                if (name.isNotEmpty && quantity.isNotEmpty && expiryDate.isNotEmpty) {
                  widget.onAdd(name, quantity, _selectedUnit, expiryDate);
                  Navigator.pop(context); // Go back to the previous screen
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill in all fields.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Add Ingredient',
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