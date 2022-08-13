import 'package:flutter/material.dart';
import 'package:better_price_flutter/src/volume/volume_screen.dart';
import 'package:better_price_flutter/src/weight/weight_screen.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  int currentIndex = 0;
  final screens = const [
    WeightScreen(),
    VolumeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: Colors.pink,
          useMaterial3: true,
          brightness: Brightness.light),
      darkTheme: ThemeData(
          colorSchemeSeed: Colors.pink,
          useMaterial3: true,
          brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.balance),
              label: 'Weight',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_bar),
              label: 'Volume',
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
