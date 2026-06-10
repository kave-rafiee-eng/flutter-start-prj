import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/errorCode_model.dart';

class ErrorCodeServiceJosn {
  Future<List<ErrorCodeType>> loadMenus() async {
    final jsonString = await rootBundle.loadString(
      'assets/data/errorCodes.json',
    );

    final dynamic jsonData = jsonDecode(jsonString);

    if (jsonData is List) {
      return jsonData.map((item) => ErrorCodeType.fromJson(item)).toList();
    } else {
      return [ErrorCodeType.fromJson(jsonData)];
    }
  }
}
