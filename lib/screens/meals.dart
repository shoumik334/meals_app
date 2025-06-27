//Show all the meals of the Category

import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_item_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;



   void _selectMeal(BuildContext context, Meal meal) {
  // Navigate to the MealItemDetails screen for the selected meal
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (ctx) => MealItemDetails(meal: meal), // Pass a single meal to the details screen
    ),
  );
}


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
                  // final meal = meals[index];
                  return  MealItem(meal: meals[index],onSelectMeal: (){_selectMeal(context, meals[index]);},);

                    //subtitle: Text('Duration: ${meal.duration} min'),
                    //leading: Image.network(meal.imageUrl),
                  
                },
              ),
    );
  }
}
