import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    const Text('Index 0: Home'),
    const Text('Index 1: Acompanhamento'),
    const Text('Index 2: Perfil'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined), label: "Início"),
          NavigationDestination(
              icon: Icon(Icons.flight_outlined), label: "Acompanhamento"),
          NavigationDestination(
              icon: Icon(Icons.person_outline), label: "Perfil")
        ],
      ),
      body: Center(child: widgetOptions.elementAt(currentPageIndex)),
    );
  }
}
