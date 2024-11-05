import 'package:app_ases/screens/home.dart';
import 'package:app_ases/screens/monitor_flight.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    const Home(),
    MonitorFlightScreen(),
    const Text('Index 2: Perfil'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
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
