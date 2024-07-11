import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutt_project1/details.dart';
import 'package:flutter/widgets.dart';
import 'package:flutt_project1/test2.dart';
import 'package:lottie/lottie.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _controllerweight = TextEditingController();
  TextEditingController _controllerheight = TextEditingController();
  TextEditingController _controllergoal = TextEditingController();
  TextEditingController _controllergender = TextEditingController();

  
  String? selectedWeight;
  String? selectedHeight;
  String? selectedGoal;
  String? selectedGender;

  void _openWeightPicker(BuildContext context) {
    BottomPicker(
      items: List.generate(266, (index) => Text('${index + 35} kg')),
      title: 'Select Weight',
      pickerTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      onSubmit: (index) {
        setState(() {
          selectedWeight = '${index + 35} kg';
          _controllerweight.text = selectedWeight ?? '';
        });
      },
    ).show(context);
  }

  void _openHeightPicker(BuildContext context) {
    BottomPicker(
      items: List.generate(211, (index) => Text('${index + 30} cm')),
      title: 'Select Height',
      pickerTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      onSubmit: (index) {
        setState(() {
          selectedHeight = '${index + 30} cm';
          _controllerheight.text = selectedHeight ?? '';
        });
      },
    ).show(context);
  }

  void _openGoalsPicker(BuildContext context) {
    BottomPicker(
      items: List.generate(9, (index) => Text('${index * 500 + 6000}')),
      title: 'Select Goals',
      pickerTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      onSubmit: (index) {
        setState(() {
          selectedGoal = '${index * 500 + 6000}';
          _controllergoal.text = selectedGoal ?? '';
        });
      },
    ).show(context);
  }

  void _openGenderPicker(BuildContext context) {
  BottomPicker(
    items: [
      Text('Male'),
      Text('Female')
    ], // Options de genre
    title: 'Select Gender',
    pickerTextStyle: const TextStyle(
      color: Colors.blue,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    onSubmit: (index) {
      setState(() {
        selectedGender = ['Male', 'Female'][index];
        _controllergender.text = selectedGender ?? '';
      });
    },
  ).show(context);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 50,
              child: Lottie.network(
                "https://lottie.host/8c794a18-e28d-4601-8927-ca459cc0efb0/SD872kmIGl.json",
                width: 50,
                reverse: true,
                repeat: true,
              ),
              
            ),
            SizedBox(width: 10),
            Text(
              'Profil page',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.5,
                wordSpacing: 5.0,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/baccccckk.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Finish filling out your inscription", // Ajout du texte au-dessus de l'animation
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 24, 3, 145),
                ),
              ),
             
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  _openGenderPicker(context);
                },
               icon: Image.asset('images/gend.png', height: 70, width: 50),
                label: Text(selectedGender ?? "Select Gender"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  _openWeightPicker(context);
                },
                icon: Image.asset('images/weight.png', height: 70, width: 50),
                label: Text(selectedWeight ?? "Select Weight"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  _openHeightPicker(context);
                },
                icon: Image.asset('images/height.png', height: 70, width: 50),
                label: Text(selectedHeight ?? "Select Height"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  _openGoalsPicker(context);
                },
                icon: Image.asset('images/arrow.png', height: 70, width: 50),
                label: Text(selectedGoal ?? "Select Goals"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Ajout d'un espace entre les boutons flottants
              // Bouton pour ajouter l'utilisateur à Firestore
              FloatingActionButton(
                onPressed: addUser,
                child: const Icon(Icons.add),
              ),
SizedBox(height: 70),
 MaterialButton(
                      color: const Color.fromARGB(255, 24, 13, 244),
                      textColor: Colors.white,
                      minWidth: 340,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FormPagee()),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 228, 210, 210),
                        ),
                      ),
                    ),

            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Positionnement du bouton flottant
    );
  }


CollectionReference client = FirebaseFirestore.instance.collection('client');

Future<void> addUser() {
  String userId = FirebaseAuth.instance.currentUser!.phoneNumber!;

  // Ajouter les données de l'utilisateur en fusionnant avec les données existantes
  return client
      .doc(userId)
      .set({
        'weight': _controllerweight.text, // Poids de l'utilisateur
        'height': _controllerheight.text, // Taille de l'utilisateur
        'goal': _controllergoal.text, // Objectif de l'utilisateur
        'gender': selectedGender ?? '',
        'id' : FirebaseAuth.instance.currentUser!.phoneNumber,
      }, SetOptions(merge: true)) // Utiliser SetOptions avec merge: true
      .then((value) => print("User data added"))
      .catchError((error) => print("Failed to add user data: $error"));
}


}

