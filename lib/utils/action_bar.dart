import 'package:app_ases/models/flight_info.dart';
import 'package:app_ases/screens/flight_code.dart';
import 'package:app_ases/services/flight_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionBar extends StatelessWidget {
  final FlightService flightService = FlightService();
  final bool takePhoto;
  Function updatePosition;
  ActionBar({super.key, required this.takePhoto, required this.updatePosition});

  @override
  Widget build(BuildContext context) {
    void exit() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FlightCode()),
      );
    }

    void showFlightInfoModal() async {
      try {
        FlightInfo flightInfo = await flightService.fetchFlightInfo();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Informação do Piloto'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(flightInfo.pilotPhoto, height: 100),
                    const SizedBox(height: 8),
                    Text(flightInfo.pilotName,
                        style: const TextStyle(fontSize: 18)),
                    const Divider(),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Fechar'),
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
              title: const Text('Erro'),
              content: const Text(
                  'Não foi possível carregar as informações do piloto'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Fechar'),
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

    void sendPosition() {
      const List<String> list = <String>[
        'Em deslocamento até aeroporto',
        'Embarque',
        'Em voo',
        'Em deslocamento até hospital',
        'Chegada'
      ];
      AlertDialog alert = AlertDialog(
        title: const Text("Qual a sua posição?",
            style: TextStyle(
              fontSize: 17,
            )),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownMenu<String>(
              initialSelection: list.first,
              onSelected: (value) {
                updatePosition(value);
              },
              dropdownMenuEntries:
                  list.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList()),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.red, foregroundColor: Colors.white),
            child: const Text("Cancelar"),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white),
            child: const Text("OK"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }

    return Container(
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
            if (takePhoto) ...[
              GestureDetector(
                  onTap: () {},
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.add_a_photo_outlined),
                      Text("Foto", textAlign: TextAlign.center)
                    ],
                  )),
            ] else ...[
              GestureDetector(
                  onTap: () => showFlightInfoModal,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.info_outline),
                      Text("Info", textAlign: TextAlign.center)
                    ],
                  )),
            ],
            GestureDetector(
                onTap: sendPosition,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
        ));
  }
}
