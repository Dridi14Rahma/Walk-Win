import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutt_project1/controllers/login_controllers.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatelessWidget {
  final loginController = Get.put(LoginController());
  final otp = TextEditingController();

  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 50,
              child: Lottie.network(
                "https://lottie.host/2d791b55-6613-4f64-9cc2-a3767b642423/cmbhRkXpMM.json",
                width: 50,
                reverse: true,
                repeat: true,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Verification Screen',
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
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Lottie.network(
                      "https://lottie.host/889ebb5b-0e5c-447b-88f9-ba1557a2e027/AUX2d1XkH9.json",
                      height: 450,
                      width: 700,
                      reverse: true,
                      repeat: true,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "OTP Verification ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Enter the OTP sent to your phone  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 40),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 400),
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
                                "https://lottie.host/730367c8-f65b-4320-b5a0-36a075c6fc99/6XBa6E6xdI.json",
                                width: 40,
                                reverse: true,
                                repeat: true,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: otp,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  labelText: 'Enter OTP',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.5,
                                    wordSpacing: 5.0,
                                    fontFamily: 'Roboto',
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
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
                            maxWidth: 280,
                          ),
                    child: ElevatedButton(
                      onPressed: () {
                        loginController.otpVerify(otp.text);
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.zero,
                        ),
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
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 19.0,
                          horizontal: 15.0,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "VERIFY & CONTINUE",
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
    )
    )

          )
    );


  }
}
