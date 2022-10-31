import "package:flutter/material.dart";

import "../Components/MainDrawer.dart";

class SettingsScreen extends StatelessWidget {
    const SettingsScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text("Configurações")
            ),
            drawer: const MainDrawer(),
            body: const Center(
                child: Text("Configurações")
            )
        );
    }
}