import "package:flutter/material.dart";

import "../Components/CategoryItem.dart";
import "../Data/DummyData.dart";

class CategoriesScreen extends StatelessWidget {
    const CategoriesScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return GridView(
            padding: const EdgeInsets.all(25),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1.5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20
            ),
            children: DUMMY_CATEGORIES.map((category) => CategoryItem(category)).toList()
        );
    }
}