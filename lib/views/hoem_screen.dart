import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutt_project1/controllers/login_controllers.dart';
import 'package:flutt_project1/views/login_screen.dart';
import 'package:flutt_project1/details.dart';
import 'package:flutt_project1/profile.dart';
import 'package:lottie/lottie.dart'; // Import de Lottie

class HomeScreen extends StatelessWidget {
  final LoginController loginController = Get.find();
  final FirebaseAuth auth = FirebaseAuth.instance;

  HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue, // Ajout de la couleur de fond de l'écran
          image: DecorationImage(
            image: AssetImage("images/baccccckk.jpg"), // Chemin de l'image
            fit: BoxFit.cover, // Ajuster l'image à la taille de l'écran
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login successfully", // Ajout du texte au-dessus de l'animation
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 24, 3, 145),
                ),
              ),
              SizedBox(height: 25),
              Lottie.network(
                "https://lottie.host/65ce9268-5c40-4c19-a82a-4350f3fa2527/bPszR5dusQ.json",
                height: 250,
                width: 250,
                reverse: true,
                repeat: true,
              ),
            ],
          ),
        ),
      ),
      
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profile()),
          );
        },
        label: Text(
          "Next ",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        icon: Icon(Icons.arrow_right, color: Colors.white),
        backgroundColor: Color.fromARGB(255, 10, 5, 121),
        elevation: 0, // Supprimer l'ombre et le cadre blanc
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Changer le rayon pour ajuster la courbure des coins
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
