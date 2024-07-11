import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutt_project1/controllers/login_controllers.dart';
import 'package:flutt_project1/views/otp_screen.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phone = TextEditingController();
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 50,
              child: Lottie.network(
                "https://lottie.host/dbe5393a-88e9-4d19-9e0a-703b59d90f4d/nr2HhgkQAc.json",
                width: 50,
                reverse: true,
                repeat: true,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Login',
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
      body: loginController.isLoading(false)
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                SizedBox(height: 20),
                Column(
                  children: [
                    Lottie.network(
                      "https://lottie.host/f37eac7a-1ddf-4e04-996b-3368f3a22cac/eydvnJwcE2.json",
                      reverse: true,
                      repeat: true,
                    ),
                    SizedBox(height: 50),
                    Text(
                      "Enter your Phone Number",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "We will send you the 6 digit verification code ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20),


                   Positioned(
  top: 200,
  left: 5,
  right: 10,
  bottom: 200,
  child: ConstrainedBox(
    constraints: BoxConstraints(maxWidth: 400), // Définissez la largeur maximale souhaitée
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Lottie.network(
              "https://lottie.host/8f9f2dae-2ed6-4569-85a0-8d4ffe756fbb/jf0TePWBIE.json",
              width: 40,
              reverse: true,
              repeat: true,
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                  wordSpacing: 5.0,
                  fontFamily: 'Roboto',
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),



                    SizedBox(height: 20),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, bottom: 50),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 240,
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              loginController.verifyPhone(
                                  phone.text);
                              Get.to(OtpScreen());
                            },
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                      EdgeInsets.zero),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 18, 115, 205),
                              ),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                               shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Définir le rayon de la bordure
            ),
          ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 19.0,
                                horizontal: 15.0,
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      "GENERATE OTP",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        letterSpacing: 1.5,
                                        wordSpacing: 3.0,
                                        fontFamily: 'Roboto',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
