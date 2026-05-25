import 'package:flutter_application_1/meals/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProvider = Provider((ref) {
  return DUMMY_MEALS;
});
