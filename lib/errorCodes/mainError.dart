import 'package:flutter/material.dart';
import 'package:flutter_application_1/errorCodes/models/errorCode_model.dart';
import 'package:flutter_application_1/errorCodes/providers/meals_provider.dart';
import 'package:flutter_application_1/errorCodes/screens.dart/selectBorad.dart';
import 'package:flutter_application_1/errorCodes/service/errorCode_service.dart';
import 'package:flutter_application_1/lcd_simulation/enums/Language_enums.dart';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyScrollBehavior(),
      debugShowCheckedModeBanner: false,

      home: LoadDataErrorCode(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class LoadDataErrorCode extends ConsumerWidget {
  final ErrorCodeServiceJosn _service = ErrorCodeServiceJosn();

  LoadDataErrorCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final errorLoad = ref.watch(errorPrivider);

    return FutureBuilder<List<ErrorCodeType>>(
      future: _service.loadMenus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        List<ErrorCodeType> errorCodes = snapshot.data!;

        // return errorLoad;
        return SelectboradForErrorCode(listErrorCode: errorCodes);
      },
    );
  }
}
