import "package:flutter/material.dart";

import "../Components/MealItem.dart";
import "../Models/Meal.dart";

class FavoriteScreen extends StatelessWidget {
    final List<Meal> favoriteMeals;

    const FavoriteScreen(this.favoriteMeals);

    @override
    Widget build(BuildContext context) {
        return favoriteMeals.isEmpty
        ? const Center(child: Text("Nenhuma refeição foi marcada como favorita!"))
        : ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (context, index) => MealItem(favoriteMeals[index])
        );
    } 
}