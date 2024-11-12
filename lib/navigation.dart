import 'package:app_ases/screens/home.dart';
import 'package:app_ases/screens/monitor_flight.dart';
import 'package:app_ases/screens/perfil.dart';
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
    const Perfil(),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
          color: Theme.of(context).colorScheme.primary,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: const Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('lib/images/profile_picture.jpg'),
              ),
              SizedBox(height: 8),
              Text(
                "Olá, ...!",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "Passageiro",
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(child: widgetOptions.elementAt(currentPageIndex)),
      ])
    );
  }
}
