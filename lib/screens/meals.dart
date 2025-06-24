//Show all the meals of the Category

import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body:
          meals.isEmpty
              ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'No meals Available for this category',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Text(
                      'Try Searching a different Category',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                itemCount: meals.length,
                itemBuilder: (ctx, index) {
                  final meal = meals[index];
                  return ListTile(
                    title: Text(meal.title),
                    subtitle: Text('Duration: ${meal.duration} min'),
                    leading: Image.network(meal.imageUrl),
                  );
                },
              ),
    );
  }
}
