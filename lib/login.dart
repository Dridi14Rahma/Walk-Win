import 'package:flutter/material.dart';
import 'package:flutt_project1/code.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
// Assurez-vous d'importer votre contrôleur signUpController

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  

  @override
  _LoginState createState() => _LoginState();
}



class _LoginState extends State<Login> {
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "images/login.png",
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Positioned(
            left: 5,
            right: 10,
            bottom: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: SizedBox(
                    width: 200,
                    child: IntlPhoneField(
                      controller: _phoneNumberController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your phone number',
                        
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 5,
            right: 10,
            bottom: 60,
            child: Center(
              child: MaterialButton(
                color: const Color.fromARGB(255, 24, 13, 244),
                textColor: Colors.white,
                minWidth: 200,
                onPressed: () {
                  Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const CodePage()),
);

                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("Next"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


