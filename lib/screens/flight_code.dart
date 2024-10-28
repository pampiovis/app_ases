import 'package:app_ases/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlightCode extends StatelessWidget {
  const FlightCode({super.key});

  @override
  Widget build(BuildContext context) {
    void goToHome() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }

    return Scaffold(
        backgroundColor: const Color(0xff64CCF3),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/images/logo.png', width: 200, height: 150),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Acompanhamento de acionamento ASES",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Insira seu código de acesso:",
                      style: GoogleFonts.montserrat(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: "Ex: 1245AQ6",
                        hintStyle: const TextStyle(color: Colors.grey)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 20),
                  child: FilledButton(
                    onPressed: goToHome,
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            const Color(0xff01AFEF))),
                    child: Text(
                      "Entrar",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Esqueci meu código',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        )),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
