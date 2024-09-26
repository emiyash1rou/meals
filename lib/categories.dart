import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

import 'models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  void _selectCategory(BuildContext context, Category category) {
    // Gets category then runs through the Meal List and filters which elements are having the ID of the category name
    //and gets filtered.
    List<Meal> categorizedMeal = dummyMeals
        .where(
          (each_element) => each_element.categories.contains(category.id),
        )
        .toList();

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              MealsScreen(meals: categorizedMeal, title: category.title),
        ));
    //route takes a MaterialPageRoute
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick your Category'),
      ),
      body: GridView(
        padding: EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20), //cross-axis (left - right). Count: 2,
        //3/2 for childAspectRatio is 3 ratio 2 or 3:2

        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
