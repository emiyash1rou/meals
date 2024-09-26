import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

// The MealsScreen is a screen with all the list of meals.
class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, required this.title});
  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(
        meal: meals[index],
      ),
    );
    if (meals.isEmpty) {
      content = Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Nothing here. Try selecting a different category!",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          )
        ],
      ));
    }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: content,
    );
  }
}
