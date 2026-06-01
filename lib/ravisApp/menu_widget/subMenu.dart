import 'package:flutter/material.dart';
import 'package:flutter_application_1/ravisApp/models/menu_model.dart';

class Submenu extends StatelessWidget {
  const Submenu({
    super.key,
    required this.allMenus,
    required this.handleSelect,
    required this.menu,
  });

  final List<MenuType> allMenus;
  final MenuType menu;
  final void Function(String id, String name) handleSelect;

  List<ParanetIdLableType> findParents(List<MenuType> allMenus, MenuType menu) {
    List<ParanetIdLableType> Parents = [];
    for (var m in allMenus) {
      for (var parentId in m.parentId) {
        if (parentId.id == menu.id) {
          Parents.add(ParanetIdLableType(id: m.id, label: parentId.label));
        }
      }
    }
    return Parents;
  }

  @override
  Widget build(BuildContext context) {
    final parents = findParents(allMenus, menu);

    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...parents.map((sub) {
            return Card(
              margin: EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('name : ${sub.label}'),
                  SizedBox(width: 50),
                  OutlinedButton(
                    onPressed: () {
                      handleSelect(sub.id, sub.label);
                    },
                    child: Text('id : ${sub.id}'),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
