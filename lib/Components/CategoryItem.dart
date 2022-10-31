import "package:flutter/material.dart";

import "../Models/Category.dart";
import "../Utils/AppRoutes.dart";

class CategoryItem extends StatelessWidget {
    final Category category;

    const CategoryItem(this.category);

    void _selectCategory(BuildContext context) => Navigator.of(context).pushNamed(
        AppRoutes.CATEGORIES_MEALS,
        arguments: category
    );

    @override
    Widget build(BuildContext context) {
        return InkWell(
            onTap: () => _selectCategory(context),
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
            child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        colors: <Color>[
                            category.color.withOpacity(.5),
                            category.color
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
                    )
                ),
                child: Text(
                    category.title,
                    style: Theme.of(context).textTheme.titleMedium
                )
            )
        );
    }
}