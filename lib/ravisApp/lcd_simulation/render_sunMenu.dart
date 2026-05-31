import 'package:flutter/material.dart';
import 'package:flutter_application_1/ravisApp/lcd_simulation/GridPainter.dart';
import 'package:flutter_application_1/ravisApp/lcd_simulation/lcd_functions.dart';
import 'package:flutter_application_1/ravisApp/lcd_simulation/widgets/fastAdjustButton.dart';
import 'package:flutter_application_1/ravisApp/models/menu_model.dart';

class RendererSubMenuData {
  final List<ParanetIdLableType> submenu;
  // final DescriptionType description;
  late int menuIndex;
  late int menuOffset;
  RendererSubMenuData({
    required this.submenu,
    // required this.description
  }) {
    menuIndex = 0;
    menuOffset = 0;
  }

  List<ParanetIdLableType> get getSubmenuList => submenu;
}

void _renderLcd(LcdFunctions lcd, RendererSubMenuData data) {
  const MENU_VISIBLE_ITEMS = 3;

  if (data.menuIndex == data.submenu.length) {
    data.menuIndex = data.submenu.length - 1;
  }

  if (data.menuIndex > (data.menuOffset + MENU_VISIBLE_ITEMS - 1)) {
    data.menuOffset++;
  }
  if (data.menuIndex < data.menuOffset) {
    data.menuOffset--;
  }

  lcd.fillRect(0, 13, X_PIXELS, Y_PIXELS, false);

  lcd.drawLine(0, 13, X_PIXELS, 13, true);

  for (int i = 0; i < MENU_VISIBLE_ITEMS && i < data.submenu.length; i++) {
    int y = i * 17 + 17;

    String text = data.submenu[data.menuOffset + i].label;

    if (data.menuOffset + i == data.menuIndex) {
      lcd.fillRoundRect(0, y - 1, 90, 16, 5, true);
      lcd.print12x15(3, y, text, false);
    } else {
      lcd.print12x15(3, y, text, true);
    }
  }

  lcd.drawScrollBar(data.menuOffset, data.submenu.length, MENU_VISIBLE_ITEMS);
}

class RenderSubMenu extends StatefulWidget {
  final RendererSubMenuData inputData;
  final double cellSize;

  const RenderSubMenu({
    super.key,
    required this.inputData,
    this.cellSize = 2.2,
  });

  @override
  State<RenderSubMenu> createState() => _RenderSubMenuState();
}

class _RenderSubMenuState extends State<RenderSubMenu> {
  late final LcdFunctions _lcdFunctions;

  @override
  void initState() {
    super.initState();
    _lcdFunctions = LcdFunctions();
    _render();
  }

  void _render() {
    _renderLcd(_lcdFunctions, widget.inputData);
  }

  void _changeValue(int delta) {
    final data = widget.inputData;
    final next = (data.menuIndex + delta).clamp(0, data.submenu.length - 1);
    if (next == data.menuIndex) return;
    setState(() {
      widget.inputData.menuIndex = next;
      _render();
    });
  }

  @override
  Widget build(BuildContext context) {
    final buffer = _lcdFunctions.getBuffer();
    final w = buffer.cols * widget.cellSize;
    final h = buffer.rows * widget.cellSize;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: w + 30,
          height: h + 45,
          child: CustomPaint(
            painter: BoolGridPainter(
              lcdbuffer: buffer,
              cellSize: widget.cellSize,
              trueColor: const Color.fromARGB(255, 63, 12, 12),
              falseColor: Colors.white,
              borderColor: const Color.fromARGB(255, 41, 10, 10),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FastAdjustButton(
              icon: Icons.remove,
              onStep: (_) {
                _changeValue(-1);
              },
            ),
            FastAdjustButton(
              icon: Icons.add,
              onStep: (_) {
                _changeValue(1);
              },
            ),
            FastAdjustButton(icon: Icons.exit_to_app, onStep: (_) {}),
            FastAdjustButton(icon: Icons.done, onStep: (_) {}),
          ],
        ),
      ],
    );
  }
}
