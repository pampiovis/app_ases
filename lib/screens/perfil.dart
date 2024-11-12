import 'package:app_ases/screens/flight_code.dart';
import 'package:app_ases/utils/action_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ActionBar(takePhoto: true),
           
           Container(
            padding: const EdgeInsets.all(20.0), 
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30), 
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), 
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                'Dados do Usuário',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Nome:',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Ex. Maria Teresinha Silva",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Text(
                'Telefone:',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Digite o segundo campo...",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Text(
                'Endereço:',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Ex. Av. Ipiranga, 88 - POA/RS",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}