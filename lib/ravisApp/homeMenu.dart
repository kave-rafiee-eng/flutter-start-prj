import 'package:flutter/material.dart';
import 'package:flutter_application_1/ravisApp/menu_widget/menu_multiSelect.dart';
import 'package:flutter_application_1/ravisApp/menu_widget/menu_onParameter.dart';
import 'package:flutter_application_1/ravisApp/menu_widget/menu_onSelect.dart';
import 'package:flutter_application_1/ravisApp/models/menu_model.dart';
import 'package:flutter_application_1/ravisApp/menu_widget/subMenu.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key, required this.menus});

  final List<MenuType> menus;

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  String _activeId = '0';

  List<ParanetIdLableType> navList = [
    ParanetIdLableType(id: '0', label: 'main'),
  ];
  @override
  Widget build(BuildContext context) {
    MenuType menuSelected = widget.menus.firstWhere((m) => m.id == _activeId);
    Widget activeWidget = Center(child: Text('not founded.'));

    if (menuSelected.type == TypeMenuEnum.submenu) {
      activeWidget = Submenu(
        allMenus: widget.menus,
        handleSelect: (id, name) {
          setState(() {
            _activeId = id;
            navList.add(ParanetIdLableType(id: id, label: name));
          });
        },
        menu: menuSelected,
      );
    }

    if (menuSelected.type == TypeMenuEnum.settingOnParameter) {
      activeWidget = MenuOnparameter(menuSelected.data.settingOneParameter!);
    }

    if (menuSelected.type == TypeMenuEnum.settingOnSelect) {
      activeWidget = MenuOnselect(menuSelected.data.settingOneSelect!);
    }

    if (menuSelected.type == TypeMenuEnum.settingMultySelect) {
      activeWidget = MenuMultiselect(menuSelected.data.settingMultySelect!);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          child: Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            alignment: WrapAlignment.start,
            children: [
              for (int index = 0; index < navList.length; index++)
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    backgroundColor: _activeId == navList[index].id
                        ? Colors.blue.withValues(alpha: 0.5)
                        : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _activeId = navList[index].id;
                      navList = navList.sublist(0, index + 1);
                    });
                  },
                  child: Text('${navList[index].label} -> '),
                ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadiusGeometry.circular(14),
          ),
          child: Text(
            menuSelected.lable!,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(child: activeWidget),
      ],
    );

    // return activeWidget;
  }
}

// List<List<String>> paths = findPath(menuSelected, widget.menus);

// MenuType? findById(String menuId, List<MenuType> allMenus) {
//   return allMenus.where((menu) => menu.id == menuId).firstOrNull;
// }

// List<List<String>> findPath(MenuType menu, List<MenuType> allMenues) {
//   final List<List<String>> result = [];

//   void find(String menuId, List<String> path) {
//     MenuType? foundedMenu = findById(menuId, allMenues);
//     if (foundedMenu == null) return;
//     if (foundedMenu.parentId.isEmpty) {
//       result.add(path);
//       return;
//     }
//     foundedMenu.parentId.forEach((parent) {
//       find(parent.id, [...path, parent.label]);
//     });
//   }

//   for (ParanetIdLableType parent in menu.parentId) {
//     find(parent.id, []);
//   }

//   return result;
// }
