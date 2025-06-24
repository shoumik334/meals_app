//Show all the meals of the Category

import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';

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
                child: Text(
                  'No meals Available for this category',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(),
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
                    onTap: () {
                      MealsScreen(title: title, meals: meals);
                    },
                  );
                },
              ),
    );
  }
}
