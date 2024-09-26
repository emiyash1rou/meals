import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealDetails(meal: meal),
        ));
  }

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
    // TODO: implement build
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(8),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10))), //Adds a Circular Border
      clipBehavior: Clip
          .hardEdge, //Clip enables you to cut the content when it is affected. Cuz for instance, this image is rectangular by nature. If you clip this, then it will follow the border and cut-off the content of pic jsut to follow that circular border.

      child: InkWell(
          onTap: () {
            _selectMeal(context, meal);
          },
          child: Stack(
            children: [
              FadeInImage(
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: MemoryImage(
                    kTransparentImage,
                  ),
                  image: NetworkImage(meal.imageUrl)),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      color: Colors.black54,
                      child: Column(
                        children: [
                          Container(
                            //this container is just to show the widget area
                            child: Text(
                              meal.title,
                              maxLines:
                                  2, //text will wrap based on number of lines.
                              textAlign: TextAlign
                                  .center, //Aligns to the center of container
                              softWrap:
                                  true, //makes sure its wrapped in a good-looking way
                              overflow: TextOverflow
                                  .ellipsis, //how text will cut-off if it takes too long. To be ended with an ellipsis(...)
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MealItemTrait(
                                  icon: Icons.schedule,
                                  label: '${meal.duration} min'),
                              const SizedBox(
                                width: 5,
                              ),
                              MealItemTrait(
                                  icon: Icons.work,
                                  label: '${complexityText} '),
                              MealItemTrait(
                                  icon: Icons.money,
                                  label: '${affordabilityText} ')
                            ],
                          ),
                        ],
                      )))
            ], //the top/bot/right are pixel representations of how far that edge is moved away from the shelf. Left-edge, right-edge, top-edge
          )),
    );
  }
}
