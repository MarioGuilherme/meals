import "package:flutter/material.dart";

import "../Components/MealItem.dart";

import "../Models/Category.dart";
import "../Models/Meal.dart";

class CategoriesMealsScreen extends StatelessWidget {
    final List<Meal> meals;

    const CategoriesMealsScreen(this.meals);

    @override
    Widget build(BuildContext context) {
        final Category category = ModalRoute.of(context)?.settings.arguments as Category;
        final List<Meal> categoryMeals = meals.where((meal) => meal.categories.contains(category.id)).toList();

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