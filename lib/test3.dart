import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class test3 extends StatefulWidget {
  @override
  _Test3State createState() => _Test3State();
}

class _Test3State extends State<test3> {
  String predictionResult = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Prediction App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _makePredictionRequest();
                },
                child: Text('Get Prediction'),
              ),
              SizedBox(height: 20),
              Text('Prediction: $predictionResult'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _makePredictionRequest() async {
    var url = Uri.parse('http://walkwin.pythonanywhere.com/predict');
    var response = await http.post(url, body: {
      'pression1': '123',
      'pression2': '0',
      'pression3': '0',
      'pression4': '101',
    });
    
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var prediction = data['Type de pied'];
      setState(() {
        predictionResult = prediction;
      });
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }
}
