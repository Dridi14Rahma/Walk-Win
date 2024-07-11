import 'package:flutter/material.dart';
import 'package:flutt_project1/views/login_screen.dart';
import 'package:flutt_project1/config.dart';
import 'package:flutt_project1/profile.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutt_project1/views/otp_screen.dart';
import 'package:flutt_project1/details.dart';
import 'test.dart';
import 'package:flutt_project1/forme.dart';
import 'package:flutt_project1/AI.dart';
import 'package:flutt_project1/test2.dart';
import 'test3.dart';
import 'package:flutt_project1/test4.dart';
import 'package:flutt_project1/views/hoem_screen.dart';
import 'package:flutt_project1/provisioning_screen.dart';
class HomePPage extends StatefulWidget {
  const HomePPage({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<HomePPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Lottie.network(
              "https://lottie.host/80e4a4c9-bc45-4d07-bcbb-7fc551e3174d/Vbu1Vsirci.json",
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
              reverse: true,
              repeat: true,
            ),
          ),
          Positioned(
            top: 70, // Placer l'image en haut de l'écran
            left: (MediaQuery.of(context).size.width - 200) / 2, // Centrer horizontalement
            child: Container(
              child: Image.asset(
                "images/111.png",
                width: 200,
                height: 200,
              ),
            ),
          ),
           
           Positioned(
            top: 200, // Placez la deuxième Lottie en haut de l'écran
            left: 0,
             right: 30,
            child: Lottie.network(
              
              "https://lottie.host/1cb2c59d-4f8c-4f63-bdb6-0a510501896e/bFxk12fUiY.json",
 height: 500,
 width: 700,
  fit: BoxFit.fill,
            reverse: true,
            repeat: true,
            ),
          ),
          Positioned(
            top: 750, // Placer le texte en haut de l'écran
            left: (MediaQuery.of(context).size.width - 130) / 2, // Centrer horizontalement
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      "JUST",
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Utiliser une couleur solide sans spécifier l'opacité
                      ),
                      speed: const Duration(milliseconds: 900),
                    ),
                  ],
                  totalRepeatCount: 2,
                  pause: const Duration(milliseconds: 900),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
                SizedBox(width: 10), // Espacement entre les deux textes
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      "RUN",
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue, // Utiliser une couleur solide sans spécifier l'opacité
                      ),
                      speed: const Duration(milliseconds: 900),
                    ),
                  ],
                  totalRepeatCount: 2,
                  pause: const Duration(milliseconds: 900),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 10,
            bottom: 20, // Ajustez cette valeur pour positionner le bouton plus bas
            child: Center(
              child: MaterialButton(
                color: Color.fromARGB(255, 10, 5, 121),
                textColor: Colors.white,
                minWidth: 200,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginScreen())
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Changer le rayon pour ajuster la courbure des coins
                ),
               child: Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    const Text("Let's Get Started", style: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    )),
    const SizedBox(width: 5), // Ajout d'un espace entre le texte et l'icône
    const Icon(Icons.arrow_right, color: Colors.white),
  ],
),

            ),
          ),
         
          ),
        ],
    )
    );
  }
}
