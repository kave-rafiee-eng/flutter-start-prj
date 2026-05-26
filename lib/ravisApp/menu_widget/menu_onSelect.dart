import 'package:flutter/material.dart';
import 'package:flutter_application_1/ravisApp/models/menu_model.dart';
import 'package:flutter_application_1/ravisApp/widgets/optionsList.dart';

class MenuOnselect extends StatelessWidget {
  const MenuOnselect(this.menu, {super.key});

  final SettingOneSelectType menu;

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
                Tab(icon: Icon(Icons.view_comfy_alt_outlined), text: "options"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text(menu.description.toString())),
              Center(child: Optionslist(menu.options)),
            ],
          ),
        ),
      ),
    );
  }
}
