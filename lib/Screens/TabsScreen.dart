import "package:flutter/material.dart";

import "../Components/MainDrawer.dart";

import "CategoriesScreen.dart";
import "FavoriteScreen.dart";

class TabsScreen extends StatefulWidget {
    const TabsScreen({Key? key}) : super(key: key);

    @override
    State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
    int _selectScreenIndex = 0;
    static const List<Map<String, Object>> _screens = [
        { "title": "Lista de Categorias", "screen": CategoriesScreen()},
        { "title": "Meus Favoritos", "screen": FavoriteScreen()}
    ];

    _selectScreen(int index) => setState(() => _selectScreenIndex = index);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(_screens[_selectScreenIndex]["title"] as String)
            ),
            drawer: const MainDrawer(),
            body: _screens[_selectScreenIndex]["screen"] as Widget,
            bottomNavigationBar: BottomNavigationBar(
                onTap: _selectScreen,
                backgroundColor: Theme.of(context).primaryColor,
                unselectedItemColor: Colors.white,
                selectedItemColor: Theme.of(context).accentColor,
                currentIndex: _selectScreenIndex,
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.category),
                        label: "Categorias"
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: "Favoritos"
                    )
                ]
            )
        );
    }
}