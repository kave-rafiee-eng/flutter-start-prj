import 'package:flutter/material.dart';
import 'package:flutter_application_1/ravisApp/models/menu_model.dart';

class Optionslist extends StatelessWidget {
  const Optionslist(this.options, {super.key});

  final List<OptionType> options;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: options.map((option) {
          return Card(
            margin: EdgeInsets.only(bottom: 15),
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: Column(
                children: [
                  Text(
                    '${option.value} ',
                    style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Text('توضیحات', style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
