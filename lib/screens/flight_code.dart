import 'package:flutter/material.dart';

class FlightCode extends StatelessWidget {
  const FlightCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[400],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 200),
            const Text(
              "Acompanhamento de acionamento ASES",
              style: TextStyle(fontSize: 20),
            ),
            const Text("Insira seu código de acesso:"),
            const TextField(),
            TextButton(onPressed: () {}, child: const Text("Entrar")),
            GestureDetector(
              onTap: () {},
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Esqueceu o código?',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ),
              ),
            )
          ],
        ));
  }
}
