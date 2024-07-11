import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutt_project1/details.dart';
import 'package:lottie/lottie.dart';

class FormPagee extends StatefulWidget {
  final ref = FirebaseDatabase.instance.ref("walkandwin");

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPagee> {
  List<Map<String, dynamic>> dataList = [];
  String predictionResult = '';
  late Widget predictionImage;

  @override
  void initState() {
    super.initState();
    predictionImage = SizedBox(); // Initialisation de predictionImage
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
                "https://lottie.host/4bfb3ee8-fd44-4a31-9eec-1929c268994b/YPIwU0Q2if.json",
                width: 50,
                reverse: true,
                repeat: true,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Predict your foot type',
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
            children: [
              SizedBox(height: 20),
              Text(
                'Prediction result : $predictionResult',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color.fromARGB(255, 21, 2, 84),
                ),
              ),
              // Affichage de l'image prédite
              predictionImage,
              Expanded(
                child: FirebaseAnimatedList(
                  query: widget.ref,
                  itemBuilder: (context, snapshot, animation, index) {
                    String pression1 = snapshot.child("pression1").value.toString();
                    String pression2 = snapshot.child("pression2").value.toString();
                    String pression3 = snapshot.child("pression3").value.toString();
                    String pression4 = snapshot.child("pression4").value.toString();

                    dataList.add({
                      'pression1': pression1,
                      'pression2': pression2,
                      'pression3': pression3,
                      'pression4': pression4,
                    });

                    if (predictionResult.isEmpty) {
                      _makePredictionRequest();
                    }

                    return SizedBox();
                  },
                ),
              ),
              
              MaterialButton(
                      color: const Color.fromARGB(255, 24, 13, 244),
                      textColor: Colors.white,
                      minWidth: 340,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DetailsPage()),
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
    );
  }

  Future<void> _makePredictionRequest() async {
    try {
      if (dataList.isNotEmpty) {
        Map<String, dynamic> data = dataList.last;
        var pressionValues = [data['pression1'], data['pression2'], data['pression3'], data['pression4']];
        var nonZeroPressions = pressionValues.where((pression) => pression != '0').toList();

        if (nonZeroPressions.length >= 2) {
          var body = {
            'pression1': data['pression1'],
            'pression2': data['pression2'],
            'pression3': data['pression3'],
            'pression4': data['pression4'],
          };

          var url = Uri.parse('http://walkwin.pythonanywhere.com/predict');
          var response = await http.post(url, body: body);

          if (response.statusCode == 200) {
            var responseData = jsonDecode(response.body);
            var prediction = responseData['Type de pied'];
            setState(() {
              predictionResult = getPredictionDescription(double.parse(prediction));
              predictionImage = getPredictionImage(double.parse(prediction));
              sendPredictionToFirestore(predictionResult);
            });
          } else {
            print('Request failed with status: ${response.statusCode}');
          }
        } else {
          print('At least two non-zero pressure values are required for prediction.');
        }
      } else {
        print('DataList is empty');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  String getPredictionDescription(double predictionValue) {
    if (predictionValue == 0.0) {
      return 'Normal foot';
    } else if (predictionValue == 1.0) {
      return 'Hollow foot';
    } else if (predictionValue == 2.0) {
      return 'Flat foot';
    } else {
      return 'Unknown result';
    }
  }

  Widget getPredictionImage(double predictionValue) {
    if (predictionValue == 0.0) {
      return Image.asset('images/pied normal.png'); // Assurez-vous que le chemin de votre image est correct
    } else if (predictionValue == 1.0) {
      return Image.asset('images/pied creux.png'); // Assurez-vous que le chemin de votre image est correct
    } else if (predictionValue == 2.0) {
      return Image.asset('images/pied plat.png'); // Assurez-vous que le chemin de votre image est correct
    } else {
      return SizedBox();
    }
  }

  Future<void> sendPredictionToFirestore(String prediction) async {
    try {
      var userId = FirebaseAuth.instance.currentUser!.phoneNumber;
      var userDoc = await FirebaseFirestore.instance.collection('client').doc(userId).get();
      if (userDoc.exists) {
        await FirebaseFirestore.instance.collection('client').doc(userId).update({
          'prediction': prediction,
        });
      } else {
        await FirebaseFirestore.instance.collection('client').doc(userId).set({
          'prediction': prediction,
        });
      }
    } catch (error) {
      print('Error sending prediction to Firestore: $error');
    }
  }
}
