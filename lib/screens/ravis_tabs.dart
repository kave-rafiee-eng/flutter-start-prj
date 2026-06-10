// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/ravisApp/loadData.dart';
// import 'package:flutter_application_1/ravisApp/widgets/home_drawer.dart';

// class RavisTabs extends StatefulWidget {
//   const RavisTabs({super.key});

//   @override
//   State<RavisTabs> createState() => _RavisTabsState();
// }

// class _RavisTabsState extends State<RavisTabs> {
//   int _selectedPageIndex = 0;

//   void _selectPage(int index) {
//     setState(() {
//       _selectedPageIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget activeScreen = MenuPage();
//     if (_selectedPageIndex == 1) {
//       activeScreen = Center(child: Text('Ai mode'));
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Ravis App'),
//         backgroundColor: Theme.of(context).colorScheme.primaryContainer,
//       ),
//       drawer: HomeDrawer(),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedPageIndex,
//         onTap: _selectPage,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.elevator),
//             activeIcon: Icon(Icons.elevator, color: Colors.red),
//             label: 'app',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat Ai'),
//         ],
//       ),
//       body: activeScreen,
//     );
//   }
// }
