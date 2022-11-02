import "package:flutter/material.dart";

import "../Components/MainDrawer.dart";
import "../Models/Settings.dart";

class SettingsScreen extends StatefulWidget {
    const SettingsScreen(this.onSettingsChanged, this.settings);

    final Function(Settings) onSettingsChanged;
    final Settings settings;

    @override
    State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
    late Settings settings;

    @override
    void initState() {
        super.initState();
        settings = widget.settings;
    }

    Widget _createSwitch(String title, String subtitle, bool value, void Function(bool) onChanged) {
        return SwitchListTile.adaptive(
            title: Text(title),
            subtitle: Text(subtitle),
            value: value,
            onChanged: (value) {
                onChanged(value);
                widget.onSettingsChanged(settings);
            }
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text("Configurações")
            ),
            drawer: const MainDrawer(),
            body: Column(
                children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                            "Configurações",
                            style: Theme.of(context).textTheme.titleMedium
                        )
                    ),
                    Expanded(
                        child: ListView(
                            children: <Widget>[
                                _createSwitch(
                                    "Sem Glúten",
                                    "Só exibe refeições sem glúten!",
                                    settings.isGlutenFree,
                                    (value) => setState(() => settings.isGlutenFree = value)
                                ),
                                _createSwitch(
                                    "Sem Lactose",
                                    "Só exibe refeições sem lactose!",
                                    settings.isLactoseFree,
                                    (value) => setState(() => settings.isLactoseFree = value)
                                ),
                                _createSwitch(
                                    "Vagana",
                                    "Só exibe refeições vaganas!",
                                    settings.isVegan,
                                    (value) => setState(() => settings.isVegan = value)
                                ),
                                _createSwitch(
                                    "Vegetariana",
                                    "Só exibe refeições vegetarianas!",
                                    settings.isVegetarian,
                                    (value) => setState(() => settings.isVegetarian = value)
                                )
                            ]
                        )
                    )
                ]
            )
        );
    }
}