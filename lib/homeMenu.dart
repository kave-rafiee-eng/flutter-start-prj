import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/menu_model.dart';
import 'package:flutter_application_1/subMenu.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key, required this.menus});

  final List<MenuType> menus;

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  String _activeId = '0';

  @override
  Widget build(BuildContext context) {
    MenuType menuSelected = widget.menus.firstWhere((m) => m.id == _activeId);

    Widget activeWidget = Text('not founded.');

    if (menuSelected.type == TypeMenuEnum.submenu) {
      activeWidget = Submenu(
        allMenus: widget.menus,
        handleSelect: (id) {
          setState(() {
            _activeId = id;
          });
        },
        menu: menuSelected,
      );
    }

    return activeWidget!;
  }
}
