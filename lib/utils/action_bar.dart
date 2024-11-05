import 'package:app_ases/screens/flight_code.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({super.key});

  @override
  Widget build(BuildContext context) {

    void exit() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FlightCode()),
      );
    }

    void sendPosition(){
      const List<String> list = <String>['Em deslocamento até aeroporto', 'Em voo', 'Em deslocamento até hospital'];
      AlertDialog alert = AlertDialog(
        title: const Text(
          "Qual a sua posição?",
          style: TextStyle(
              fontSize: 17,
            )
          ),
        content: DropdownMenu<String>(
          initialSelection: list.first,
          dropdownMenuEntries:  list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList()
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("Cancelar"),
            onPressed: () {},
          ),
          TextButton(
            child: const Text("OK"),
            onPressed: () {},
          )
        ],
      );
      showDialog(
        context: context, 
        builder: (BuildContext context){
          return alert;
        }
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {},
                  child: const Column(
                    children: [
                      Icon(Icons.camera_alt_outlined),
                      Text("Tirar foto")
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: sendPosition,
                  child: const Column(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text("Enviar posição")
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: exit,
                  child: const Column(
                    children: [
                      Icon(Icons.logout),
                      Text("Sair")
                    ],
                  )),
            )
          ],
        ),
      ],
    );
  }
}