import "package:flutter/material.dart";

import "Data/DummyData.dart";

import "Models/Meal.dart";
import "Models/Settings.dart";

import "Screens/CategoriesMealsScreen.dart";
import "Screens/MealDetailScreen.dart";
import "Screens/SettingsScreen.dart";
import "Screens/TabsScreen.dart";

import "Utils/AppRoutes.dart";

void main() => runApp(const MyApp());
 
class MyApp extends StatefulWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    Settings settings = Settings();
    List<Meal> _availableMeals = DUMMY_MEALS;
    List<Meal> _favoritesMeals = [];

    void _filterMeals(Settings settings) {
        setState(() {
            this.settings = settings;

            _availableMeals = DUMMY_MEALS.where((meal) {
                final bool filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
                final bool filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
                final bool filterVegan = settings.isVegan && !meal.isVegan;
                final bool filterVegatarian = settings.isVegetarian && !meal.isVegetarian;

                return !filterGluten && !filterLactose && !filterVegan && !filterVegatarian;
            }).toList();
        });
    }

    void _toggleFavorite(Meal meal) {
        setState(() => _favoritesMeals.contains(meal) ? _favoritesMeals.remove(meal) : _favoritesMeals.add(meal));
    }

    bool isFavorite(Meal meal) => _favoritesMeals.contains(meal);

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: "DeliMeals",
            theme: ThemeData(
                primarySwatch: Colors.pink,
                accentColor: Colors.amber,
                fontFamily: "Raleway",
                canvasColor: const Color.fromRGBO(255, 254, 229, 1),
                textTheme: ThemeData.light().textTheme.copyWith(
                    titleMedium: const TextStyle(
                        fontSize: 20,
                        fontFamily: "RobotoCondensed"
                    )
                )
            ),
            routes: {
                AppRoutes.HOME: (context) => TabsScreen(_favoritesMeals),
                AppRoutes.CATEGORIES_MEALS : (context) => CategoriesMealsScreen(_availableMeals),
                AppRoutes.MEAL_DETAIL: (context) => MealDetailScreen(_toggleFavorite, isFavorite),
                AppRoutes.SETTINGS: (context) => SettingsScreen(_filterMeals, settings)
            }
        );
    }
}