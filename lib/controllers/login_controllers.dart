import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutt_project1/views/hoem_screen.dart';

class LoginController extends GetxController {

  var isLoading = false.obs;
  var verId = '';
  var authStatus = ''.obs;

  var auth = FirebaseAuth.instance;

  verifyPhone(String phone) async {
    isLoading.value = true;
    await auth.verifyPhoneNumber(
        timeout:const Duration(seconds: 50),
        phoneNumber: phone,
        verificationCompleted: (AuthCredential authCredential) {
          if (auth.currentUser != null) {
            isLoading.value = false;
            authStatus.value = "login successfully";
          }
        },
        verificationFailed: (authException) {
          Get.snackbar("sms code info", "otp code hasn't been sent!!");
        },
        codeSent: (String id, [int? forceResent]) {
          isLoading.value = false;
          verId = id;
          authStatus.value = "login successfully";
        },
        codeAutoRetrievalTimeout: (String id) {
          verId = id;
        });
  }


  /////////
  otpVerify(String otp) async {
    isLoading.value = true;
    try {
      UserCredential userCredential = await auth.signInWithCredential(
          PhoneAuthProvider.credential(verificationId: verId, smsCode: otp)
      );
      if (userCredential.user != null) {
        isLoading.value = false;
       Get.to( HomeScreen());
      }
    } on Exception {
      Get.snackbar("otp info", "otp code is not correct !!");
    }
  }
}