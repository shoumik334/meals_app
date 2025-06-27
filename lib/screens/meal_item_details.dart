import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealItemDetails extends StatelessWidget {
  const MealItemDetails({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(meal.title),
          Image.network(meal.imageUrl),

          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              meal.ingredients as String,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              meal.steps as String,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
