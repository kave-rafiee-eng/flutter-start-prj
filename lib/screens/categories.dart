import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/dummy_data.dart';
import 'package:flutter_application_1/models/meal.dart';
import 'package:flutter_application_1/screens/meals.dart';
import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/widgets/category_grid_item.dart';

class CategoriesScrenn extends StatelessWidget {
  const CategoriesScrenn({super.key, required this.onToggleFav});

  final void Function(Meal meal) onToggleFav;

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          meals: filteredMeals,
          title: category.title,
          onToggleFav: onToggleFav,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in DUMMY_CATEGORIES)
          CategoryGridItem(
            category: category,
            onSelect: () {
              _selectedCategory(context, category);
            },
          ),
      ],
    );
  }
}
