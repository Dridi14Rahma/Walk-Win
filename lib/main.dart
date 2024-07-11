import 'package:firebase_core/firebase_core.dart';
import 'package:flutt_project1/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutt_project1/homepage.dart';
import 'package:flutt_project1/profile.dart';
import 'package:flutt_project1/details.dart';
import 'package:flutt_project1/forme.dart';
import 'package:flutt_project1/config.dart';
import 'package:flutt_project1/login.dart';
import 'package:flutt_project1/code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'controllers/login_controllers.dart';
import 'package:get/get.dart';
import 'package:flutt_project1/views/hoem_screen.dart';
import 'package:flutt_project1/views/login_screen.dart';
import 'package:flutt_project1/views/otp_screen.dart';
import 'package:flutt_project1/wifi.dart';
import 'package:flutt_project1/Edit.dart';
import 'package:flutt_project1/Edit.dart';
import 'package:flutt_project1/AI.dart';
import 'package:flutt_project1/test2.dart';
import 'package:flutt_project1/provisioning_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 
 final loginController = Get.put(LoginController());
 final genderController = TextEditingController();
 final weightController = TextEditingController();
 final heightController = TextEditingController();
 final goalController = TextEditingController();


   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePPage(),
        '/details': (context) => const DetailsPage(),
        '/config': (context) => const Statss(),
        '/profile': (context) => const Profile(),
        '/forme': (context) =>  FormPage(),
        '/login': (context) => const Login(),
        '/code': (context) => const CodePage(),
        '/otp_screen': (context) =>  OtpScreen(),
        '/wifi': (context) =>  WifiSetter(),
        '/Edit': (context) =>  EditProfile(),
        '/AI': (context) =>  MyHomePage(title: "hello"),
        '/test2': (context) =>  FormPagee(),
       '/provisioning_screen': (context)=> const ProvisioningScreen(title: 'SmartConfig Demo'),
       
        


      },
      initialRoute: '/',
      
    );
     

  }}


class InitializerWidget extends StatefulWidget {
  const InitializerWidget({super.key});

  @override
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {

  late FirebaseAuth _auth;

  late User _user;

  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser!;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ) : _user == null ? const LoginScreen() :  HomeScreen();
  }
}