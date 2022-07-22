import 'package:flutter/material.dart';
import 'package:fooderlich_test/screen/grocery_item_screen.dart';
import 'empty_grocery_screen.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final manager = Provider.of<GroceryManager>(context, listen: false);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroceryItemScreen(
                onCreate: (item) {
                  manager.addItem(item);
                  Navigator.pop(context);
                },
                onUpdate: (item) {},
              ),
            ),
          );
        },
      ),
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(
      builder: ((context, value, child) {
        if (value.groceryItems.isNotEmpty) {
          return Container();
        } else {
          return const EmptyGroceryScreen();
        }
      }),
    );
  }
}
