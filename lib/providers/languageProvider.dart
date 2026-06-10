import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/lcd_simulation/enums/Language_enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final errorPrivider = Provider((ref) {
  return Text('erorr loading');
});

class LanguageNotifier extends Notifier<LanguageEnum> {
  // initial value
  @override
  LanguageEnum build() {
    return LanguageEnum.persian;
  }

  // mrthods to update
  void changeLanguage(LanguageEnum newLanguage) {
    state = newLanguage;
  }
}

final languageNotifierProvider =
    NotifierProvider<LanguageNotifier, LanguageEnum>(() {
      return LanguageNotifier();
    });
