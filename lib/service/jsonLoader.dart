import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class JsonLoader<T> {
  final String fileName;
  final String assetPath;
  final T Function(Map<String, dynamic>) fromJson;

  JsonLoader({
    required this.fileName,
    required this.assetPath,
    required this.fromJson,
  });

  Future<List<T>> loadData() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');

    final jsonString = await (file.exists().then(
      (exists) =>
          exists ? file.readAsString() : rootBundle.loadString(assetPath),
    ));

    final List<dynamic> jsonData = jsonDecode(jsonString);

    return jsonData.map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }
}
