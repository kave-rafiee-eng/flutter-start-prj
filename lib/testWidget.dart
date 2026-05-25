import 'package:flutter/material.dart';
import 'package:flutter_application_1/homeMenu.dart';
import 'package:flutter_application_1/menu_service.dart';
import 'package:flutter_application_1/models/menu_model.dart';

class MenuPage extends StatelessWidget {
  final MenuService _service = MenuService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MenuType>>(
      future: _service.loadMenus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final menus = snapshot.data!;

        return HomeMenu(menus: menus);

        // return ListView.builder(
        //   itemCount: menus.length,
        //   itemBuilder: (context, index) {
        //     if (index == 0) {
        //       print(menus[index].data.settingMultyGroup);
        //     }
        //     final menu = menus[index];
        //     return ListTile(
        //       title: Text(menu.lable ?? "no name"),
        //       subtitle: Text(menu.description.persian),
        //     );
        //   },
        // );
      },
    );
  }
}



        // try {
        //   final menu = menus.firstWhere(
        //     (m) => m.id == "105",
        //     orElse: () => null as MenuType,
        //   );

        //   if (menu.type == TypeMenuEnum.settingOnParameter) {
        //     print('founded');

        //     SettingOneParameterType myMenu = menu.data.settingOneParameter!;
        //     print(myMenu.description.english);
        //   }
        // } catch (_) {}