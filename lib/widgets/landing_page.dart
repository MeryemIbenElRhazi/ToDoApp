import 'package:flutter/material.dart';
import 'dart:async'; // Pour utiliser Timer
import 'tasks.dart'; // Assurez-vous que le chemin vers tasks.dart est correct

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Tasks()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Couleur de fond blanche
      body: Center(
        child: Image.asset(
          'assets/images/logo.png', 
          width: 200, // Ajustez la largeur si besoin
          height: 200, // Ajustez la hauteur si besoin
        ),
      ),
    );
  }
}
