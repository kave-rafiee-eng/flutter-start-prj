import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/menu_model.dart';

class Submenu extends StatelessWidget {
  const Submenu({
    super.key,
    required this.allMenus,
    required this.handleSelect,
    required this.menu,
  });

  final List<MenuType> allMenus;
  final MenuType menu;
  final void Function(String id) handleSelect;

  List<ParanetIdLableType> findParents(List<MenuType> allMenus, MenuType menu) {
    List<ParanetIdLableType> Parents = [];
    allMenus.forEach((m) {
      m.parentId.forEach((parentId) {
        if (parentId.id == menu.id) {
          Parents.add(ParanetIdLableType(id: m.id, label: parentId.label));
        }
      });
    });
    return Parents;
  }

  @override
  Widget build(BuildContext context) {
    final parents = findParents(allMenus, menu);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          Text(menu.lable!),

          ...parents.map((sub) {
            return Row(
              children: [
                Text('name : ${sub.label}'),
                SizedBox(width: 50),
                TextButton(
                  onPressed: () {
                    handleSelect(sub.id);
                  },
                  child: Text('id : ${sub.id}'),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
