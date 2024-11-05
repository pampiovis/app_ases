import 'package:app_ases/models/flight_info.dart';
import 'package:app_ases/screens/flight_code.dart';
import 'package:app_ases/services/flight_service.dart';
import 'package:flutter/material.dart';

class MonitorFlightScreen extends StatelessWidget {
  final FlightService flightService = FlightService();

  MonitorFlightScreen({super.key});

  void _showFlightInfoModal(BuildContext context) async {
    try {
      List<FlightInfo> flightInfoList = await flightService.fetchFlightInfo();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Informação do Piloto'),
            content: SingleChildScrollView(
              child: ListBody(
                children: flightInfoList.map((flightInfo) {
                  return Column(
                    children: [
                      Image.network(flightInfo.pilotPhoto, height: 100),
                      const SizedBox(height: 8),
                      Text(flightInfo.pilotName,
                          style: TextStyle(fontSize: 18)),
                      Divider(),
                    ],
                  );
                }).toList(),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text('Não foi possível carregar as informações do piloto'),
            actions: <Widget>[
              TextButton(
                child: Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    void exit() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FlightCode()),
      );
    }

    return Column(
      children: [
        // Top blue container
        Container(
          color: Colors.lightBlue,
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
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () => _showFlightInfoModal(context),
                  child: const Column(
                    children: [
                      Icon(Icons.info_outline),
                      Text("Info", textAlign: TextAlign.center)
                    ],
                  )),
              GestureDetector(
                  onTap: () {},
                  child: const Column(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text("Enviar posição", textAlign: TextAlign.center)
                    ],
                  )),
              GestureDetector(
                  onTap: exit,
                  child: const Column(
                    children: [
                      Icon(Icons.exit_to_app),
                      Text("Sair", textAlign: TextAlign.center)
                    ],
                  ))
            ],
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Você está conectado a internet",
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Ponto de Encontro:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Hospital Santa Casa - POA/RS\n24 de outubro, às 18h",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.directions_car),
                        title: Text("Transporte até o ponto de encontro"),
                        subtitle: Text("..."),
                      ),
                      ListTile(
                        leading: Icon(Icons.flight_takeoff),
                        title: Text("Embarque"),
                        subtitle: Text("..."),
                      ),
                      ListTile(
                        leading: Icon(Icons.flight),
                        title: Text("Em voo"),
                        subtitle: Text("..."),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text("Chegada"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Ponto de Chegada:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Hospital Santa Isabel - SAO/SP\n24 de outubro, às 21h",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
