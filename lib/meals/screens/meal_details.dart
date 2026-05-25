import 'package:flutter/material.dart';
import 'package:flutter_application_1/meals/models/meal.dart';
import 'package:flutter_application_1/meals/providers/favoriyes_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMelsa = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMelsa.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    wasAdded ? 'Meal added as favorite.' : 'Meal removed.',
                  ),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 900),
              transitionBuilder: (child, animation) {
                return RotationTransition(turns: animation, child: child);
              },
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/img1.jpg',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsetsGeometry.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Text(
                'Ingredient',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 14),

            for (final ingredient in meal.ingredients) Text(ingredient),

            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),

            for (final step in meal.steps) Text(step),
          ],
        ),
      ),
      // body: Image.network(
      //   meal.imageUrl,
      //   height: 300,
      //   width: double.infinity,
      //   fit: BoxFit.cover,
      // ),
    );
  }
}

//Text(meal.imageUrl),
