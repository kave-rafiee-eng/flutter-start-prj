import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/meal.dart';
import 'package:flutter_application_1/screens/categories.dart';
import 'package:flutter_application_1/screens/filters.dart';
import 'package:flutter_application_1/screens/meals.dart';
import 'package:flutter_application_1/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  final List<Meal> _favoritesMeals = [];

  void showInfoMwssage(String messgae) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(messgae)));
  }

  void _toggleMealFavoritesStatus(Meal meal) {
    final isExisting = _favoritesMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoritesMeals.remove(meal);
      });
      showInfoMwssage("Meal is no longer at favorite.");
    } else {
      setState(() {
        _favoritesMeals.add(meal);
      });
      showInfoMwssage("Marked is favorite.");
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (ctx) => FiltersScreen()));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScrenn(
      onToggleFav: _toggleMealFavoritesStatus,
    );
    var activeTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoritesMeals,
        onToggleFav: _toggleMealFavoritesStatus,
      );
      activeTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activeTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
      body: activePage,
    );
  }
}
