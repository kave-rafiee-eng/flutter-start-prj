import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/menu_model.dart';

class MenuService {
  Future<List<MenuType>> loadMenus() async {
    final jsonString = await rootBundle.loadString(
      'assets/data/menu_json.json',
    );

    final dynamic jsonData = jsonDecode(jsonString);

    if (jsonData is List) {
      return jsonData.map((item) => MenuType.fromJson(item)).toList();
    } else {
      return [MenuType.fromJson(jsonData)];
    }
  }
}
