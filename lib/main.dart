import "package:flutter/material.dart";

import "Screens/CategoriesMealsScreen.dart";
import "Screens/MealDetailScreen.dart";
import "Screens/SettingsScreen.dart";
import "Screens/TabsScreen.dart";

import "Utils/AppRoutes.dart";

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

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
                AppRoutes.HOME: (context) => const TabsScreen(),
                AppRoutes.CATEGORIES_MEALS : (context) => CategoriesMealsScreen(),
                AppRoutes.MEAL_DETAIL: (context) => const MealDetailScreen(),
                AppRoutes.SETTINGS: (context) => const SettingsScreen()
            }
        );
    }
}