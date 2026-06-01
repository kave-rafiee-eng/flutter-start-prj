import 'package:flutter/material.dart';
import 'package:flutter_application_1/meals/data/dummy_data.dart';
import 'package:flutter_application_1/meals/models/meal.dart';
import 'package:flutter_application_1/meals/screens/meals.dart';
import 'package:flutter_application_1/meals/models/category.dart';
import 'package:flutter_application_1/meals/widgets/category_grid_item.dart';

class CategoriesScrenn extends StatefulWidget {
  const CategoriesScrenn({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScrenn> createState() => _CategoriesScrennState();
}

class _CategoriesScrennState extends State<CategoriesScrenn>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(meals: filteredMeals, title: category.title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      // builder: (ctx, child) => SlideTransition(
      //   position: _animationController.drive(
      //     Tween(begin: Offset(0, 0.3), end: Offset(0, 0)),
      //   ),

      //   child: child,
      // ),
      builder: (ctx, child) => Padding(
        padding: EdgeInsetsGeometry.only(
          top: 100 - _animationController.value * 100,
        ),
        child: child,
      ),
    );
  }
}
