import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
      ],
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
                "https://lottie.host/cb21fd19-8e25-4397-ae7b-1bc1c94484be/Ew21MUlSk1.json",
                width: 50,
                reverse: true,
                repeat: true,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Edit Profile',
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
                "Update your profile", // Ajout du texte au-dessus de l'animation
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
              const SizedBox(height: 40),
              FloatingActionButton(
                onPressed: () {
                  updateUser(context);
                },
                child: const Icon(Icons.update),
              ),
            ],
          ),
        ),
      ),
    );
  }

CollectionReference client = FirebaseFirestore.instance.collection('client');
var userId = FirebaseAuth.instance.currentUser!.phoneNumber;

Future<void> updateUser(BuildContext context) async {
  try {
    // Vérifier si le document de l'utilisateur existe déjà
    var userDoc = await client.doc(userId).get();
    if (userDoc.exists) {
      // Si le document existe déjà, mettre à jour les données de l'utilisateur
      await client.doc(userId).update({
        'weight': _controllerweight.text, // Poids de l'utilisateur
        'height': _controllerheight.text, // Taille de l'utilisateur
        'goal': _controllergoal.text, // Objectif de l'utilisateur
        'gender': selectedGender ?? '',
      });
      print('User Updated');
      Navigator.pop(context); // Revenir à la page précédente après la mise à jour
    } else {
      // Si le document n'existe pas, afficher un message d'erreur
      print('User document does not exist');
    }
  } catch (error) {
    print('Failed to update user: $error');
  }
}






}
