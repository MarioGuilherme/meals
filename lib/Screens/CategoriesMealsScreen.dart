import "package:flutter/material.dart";

import "../Components/MealItem.dart";
import "../Data/DummyData.dart";
import "../Models/Category.dart";
import "../Models/Meal.dart";

class CategoriesMealsScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        final Category category = ModalRoute.of(context)?.settings.arguments as Category;
        final List<Meal> categoryMeals = DUMMY_MEALS.where((meal) => meal.categories.contains(category.id)).toList();

        return Scaffold(
            appBar: AppBar(
                title: Text(category.title)
            ),
            body: ListView.builder(
                itemCount: categoryMeals.length,
                itemBuilder: ((context, index) => MealItem(categoryMeals[index]))
            )
        );
    }
}