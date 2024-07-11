import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutt_project1/Edit.dart';
import 'package:lottie/lottie.dart';
import 'views/login_screen.dart';
import 'package:get/get.dart';
import 'package:flutt_project1/provisioning_screen.dart';

class Statss extends StatefulWidget {
  const Statss({Key? key}) : super(key: key);

  @override
  State<Statss> createState() => _StatssState();
}

class _StatssState extends State<Statss> {
  TextEditingController _controllergender = TextEditingController();
  String? selectedWeight;
  String? selectedHeight;
  String? selectedGoal;
  String? selectedGender;
  String? prediction;

  int _currentIndex = 2;
  List<QueryDocumentSnapshot> data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('client')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.phoneNumber)
        .get();
    setState(() {
      data = querySnapshot.docs;
      if (data.isNotEmpty) {
        selectedWeight = data[0]['weight'];
        selectedHeight = data[0]['height'];
        selectedGoal = data[0]['goal'];
        selectedGender = data[0]['gender'];
        prediction = data[0]['prediction'];
      }
    });
  }

  void _openWeightPicker(BuildContext context, int i) {
    BottomPicker(
      items: List.generate(266, (index) => Text('${index + 35} kg')),
      title: ("${data[i]['weight']}"),
      pickerTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      onSubmit: (index) {
        setState(() {
          selectedWeight = '${index + 35} kg';
        });
      },
    ).show(context);
  }

  void _openHeightPicker(BuildContext context, int i) {
    BottomPicker(
      items: List.generate(211, (index) => Text('${index + 30} cm')),
      title: ("${data[i]['height']}"),
      pickerTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      onSubmit: (index) {
        setState(() {
          selectedHeight = '${index + 30} cm';
        });
      },
    ).show(context);
  }

  void _openGoalsPicker(BuildContext context, int i) {
    BottomPicker(
      items: List.generate(9, (index) => Text('${index * 500 + 6000}')),
      title: ("${data[i]['goal']}"),
      pickerTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      onSubmit: (index) {
        setState(() {
          selectedGoal = '${index * 500 + 6000}';
        });
      },
    ).show(context);
  }

  void _openGenderPicker(BuildContext context, int i) {
    List<String> genderOptions = ['Male', 'Female'];
    BottomPicker(
      items: genderOptions.map((option) => Text(option)).toList(),
      title: 'Select Gender',
      pickerTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      onSubmit: (index) {
        setState(() {
          selectedGender = genderOptions[index];
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
                "https://lottie.host/362057ff-3cbc-42aa-9ac5-4710817bf889/3snbGzSHdj.json",
                width: 50,
                reverse: true,
                repeat: true,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Configuration',
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
            image: AssetImage('images/baccccckk.jpg'), // Remplacez 'assets/background_image.jpg' par le chemin de votre image
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: const Text(
                      "Personal Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _openGenderPicker(context, index);
                                  },
                                  icon: Image.asset('images/gen.png', height: 60, width: 30),
                                  label: Text(selectedGender ?? "${data[index]['gender']}"),
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
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _openWeightPicker(context, index);
                                  },
                                  icon: Image.asset('images/weight.png', height: 60, width: 30),
                                  label: Text(selectedWeight ?? "${data[index]['weight']}"),
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
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _openHeightPicker(context, index);
                                  },
                                  icon: Image.asset('images/height.png', height: 60, width: 30),
                                  label: Text(selectedHeight ?? "${data[index]['height']}"),
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
                              ],
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton.icon(
                              onPressed: () {
                                _openGoalsPicker(context, index);
                              },
                              icon: Image.asset('images/arrow.png', height: 60, width: 30),
                              label: Text(selectedGoal ?? "${data[index]['goal']}"),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: const BorderSide(color: Colors.black, width: 2),
                                  ),
                                ),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(horizontal: 150),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Prediction result : $prediction',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color.fromARGB(255, 21, 2, 84),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: MaterialButton(
                      color: const Color.fromARGB(255, 24, 13, 244),
                      textColor: Colors.white,
                      minWidth: 340,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditProfile()),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Edit Your Profile",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 228, 210, 210),
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FloatingActionButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Get.offAll(const LoginScreen());
                  },
                  child: const Icon(Icons.logout),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/details');
              },
              child: Image.asset(
                'images/home.png',
                height: 30,
                width: 30,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/AI');
              },
              child: Image.asset(
                'images/robot.png',
                height: 30,
                width: 30,
              ),
            ),
            label: 'Allan',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/config');
              },
              child: Image.asset(
                'images/settings.png',
                height: 30,
                width: 30,
              ),
            ),
            label: 'Config',
          ),
        ],
      ),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<BottomNavigationBarItem> items;

  const MyBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  }) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      items: widget.items,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }
}
