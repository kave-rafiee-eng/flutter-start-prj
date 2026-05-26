import 'package:flutter/material.dart';
import 'package:flutter_application_1/ravisApp/models/menu_model.dart';
import 'package:flutter_application_1/ravisApp/widgets/optionsList.dart';

class MenuMultiselect extends StatelessWidget {
  const MenuMultiselect(this.menu, {super.key});

  final SettingMultySelectType menu;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.description), text: "description"),
                Tab(icon: Icon(Icons.format_indent_increase), text: "options"),
                Tab(icon: Icon(Icons.publish_rounded), text: "items"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text(menu.description.toString())),
              Center(child: Optionslist(menu.options)),
              Center(child: Optionslist(menu.itemLabels)),
            ],
          ),
        ),
      ),
    );
  }
}
