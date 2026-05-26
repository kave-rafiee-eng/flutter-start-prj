import 'package:flutter/material.dart';
import 'package:flutter_application_1/ravisApp/models/menu_model.dart';

class MenuOnparameter extends StatelessWidget {
  const MenuOnparameter(this.menu, {super.key});

  final SettingOneParameterType menu;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.description), text: "description"),
                Tab(
                  icon: Icon(Icons.view_comfy_alt_outlined),
                  text: "structur",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text(menu.description.toString())),
              Center(
                child: Column(
                  children: [
                    Text('min value = ${menu.minValue}'),
                    Text('max value = ${menu.maxValue}'),
                    Text('unit = ${menu.unit}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
