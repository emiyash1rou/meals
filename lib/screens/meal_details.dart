import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.meal});
  final Meal meal;
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // Gives the width
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    Widget content = Text('No meal selected');
    Widget image = Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.hardEdge,
      child: FadeInImage(
          height: 200,
          width: double.infinity,
          fit: BoxFit.fitHeight,
          placeholder: MemoryImage(
            kTransparentImage,
          ),
          image: NetworkImage(meal.imageUrl)),
    );
    Widget meal_attr = Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: 275,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surfaceBright,
      ),
      child: GridView.count(
        primary: false,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                width: double.infinity,
                child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(
                        'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/gettyimages-842866054-7f28bbd.jpg?quality=90&resize=400,363')),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                      meal.isGlutenFree ? "Glutten-Free" : "Non Glutten-Free",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          fontSize: 20)),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                width: double.infinity,
                child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(
                        'https://images.immediate.co.uk/production/volatile/sites/30/2023/01/Ponzu-tofu-poke-bowl-8733c67.jpg?quality=90&resize=440,400')),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(meal.isVegan ? "Vegan" : "Non Vegan",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          fontSize: 20)),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                width: double.infinity,
                child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(
                        'https://www.unlockfood.ca/EatRightOntario/media/Website-images-resized/Managing-lactose-intolerance-resized.jpg')),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                      meal.isLactoseFree ? "Lactose-Free" : "Non Lactose-Free",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          fontSize: 20)),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                width: double.infinity,
                child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(
                        'https://healthyfitnessmeals.com/wp-content/uploads/2018/09/One-pan-egg-and-veggie-breakfast-4.jpg')),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                      meal.isVegetarian ? "Vegetarian" : "Non Vegetarian",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          fontSize: 20)),
                ),
              ),
            ],
          )
        ],
      ),
    );
    Widget meal_init_info = Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surfaceBright,
      ),
      child: Column(
        children: [
          Column(
            children: [
              Icon(Icons.leaderboard),
              Text(
                '${complexityText}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.alarm),
                  Text(
                    '${meal.duration} minutes',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.monetization_on),
                  Text(
                    '${affordabilityText}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
    Widget meal_steps = Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surfaceBright,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingredients',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            for (int i = 0; i < meal.steps.length; i++)
              Text(
                '${i + 1}). ${meal.steps[i]}',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
          ],
        ),
      ),
    );
    Widget ingredient_content = Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surfaceBright,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingredients',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            for (int i = 0; i < meal.ingredients.length; i++)
              Text(
                '∗ ${meal.ingredients[i]}',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  image,
                  Text(
                    meal.title,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  meal_init_info,
                  meal_attr,
                  ingredient_content,
                  meal_steps,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
