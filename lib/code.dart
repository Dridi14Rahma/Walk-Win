import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:flutt_project1/profile.dart';

class CodePage extends StatefulWidget {
  const CodePage({Key? key}) : super(key: key);

  @override
  _CodePageState createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  late TextEditingController _codeController1;
  late TextEditingController _codeController2;
  late TextEditingController _codeController3;
  late TextEditingController _codeController4;
  late TextEditingController _codeController5;
  late TextEditingController _codeController6;
  var otp;

  @override
  void initState() {
    super.initState();
    _codeController1 = TextEditingController();
    _codeController2 = TextEditingController();
    _codeController3 = TextEditingController();
    _codeController4 = TextEditingController();
    _codeController5 = TextEditingController();
    _codeController6 = TextEditingController();
  }

  @override
  void dispose() {
    _codeController1.dispose();
    _codeController2.dispose();
    _codeController3.dispose();
    _codeController4.dispose();
    _codeController5.dispose();
    _codeController6.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "images/res.png",
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Positioned(
            left: 5,
            right: 10,
            bottom: 310, // Adjust this value to position the text fields lower
            child: Form(
              key: _formkey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OtpTextField(
                    numberOfFields: 6,
                    borderColor: const Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    filled: true,
                    //runs when every textfield is filled
                    // end onSubmit
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 5,
            right: 10,
            bottom: 130,
            child: Center(
              child: TextButton(
                onPressed: () {
                  
                },
                child: const Text(
                  "Resend New Code",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 5,
            right: 10,
            bottom: 240, // Adjust this value to position the button lower
            child: Center(
              child: MaterialButton(
                color: const Color.fromARGB(255, 24, 13, 244),
                textColor: Colors.white,
                minWidth: 200,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profile()),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Change the radius to adjust the corner curvature
                ),
                child: const Text("Verify"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
