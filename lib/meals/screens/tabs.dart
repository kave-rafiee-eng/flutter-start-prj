import 'package:flutter/material.dart';
// import 'package:flutter_application_1/data/dummy_data.dart';
import 'package:flutter_application_1/meals/screens/categories.dart';
import 'package:flutter_application_1/meals/screens/filters.dart';
import 'package:flutter_application_1/meals/screens/meals.dart';
import 'package:flutter_application_1/meals/widgets/main_drawer.dart';

import 'package:flutter_application_1/meals/providers/favoriyes_provider.dart';
import 'package:flutter_application_1/meals/providers/filters_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => FiltersScreen()));
      // final result = await Navigator.of(context).push<Map<Filter, bool>>(
      //   MaterialPageRoute(
      //     builder: (ctx) => FiltersScreen(),
      //   ),
      // );

      // setState(() {
      //   _selectedFilters = result ?? kInitFilters;
      // });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScrenn(
      availableMeals: ref.watch(filteredMealsProvider),
    );
    var activeTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(meals: favoriteMeals);
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
