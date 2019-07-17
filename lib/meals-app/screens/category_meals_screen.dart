import 'package:first_app/meals-app/source/dummy-data.dart';
import 'package:first_app/meals-app/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../models/Meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayMeals;
  bool loadedInitData = false;

  @override
  void didChangeDependencies() {
    if(!loadedInitData){
      final routeArgs =
      ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];

      displayMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                displayMeals[index].id,
                displayMeals[index].title,
                displayMeals[index].imageUrl,
                displayMeals[index].duration,
                displayMeals[index].complexity,
                displayMeals[index].affordability);
          },
          itemCount: displayMeals.length,
        ),
      ),
    );
  }
}
