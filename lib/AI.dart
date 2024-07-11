import 'package:flutter/material.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:lottie/lottie.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 1;
  bool _showMorePhysicalExerciseQuestions = false;

  // Un dictionnaire contenant des questions spécifiques pour chaque exercice physique
  Map<String, List<String>> exerciseQuestions = {
    'Advice on physical wellness': ['Are there stretches I should do before and after walking?', 'What are some effective full-body workouts I can try?'],
    'Keep tabs on your data': ['How many steps did I take?', 'How far did I walk?', 'How long did I spend walking?'],
    // Ajoutez d'autres exercices physiques avec leurs questions associées
  };

  String? _selectedExercise;

  // Une liste de couleurs associées à chaque option d'exercice
  List<Color> exerciseColors = [Color.fromARGB(255, 30, 108, 243), Colors.blue];

  @override
  void initState() {
    super.initState();
    _initAlanButton();
  }

  void _initAlanButton() {
    AlanVoice.addButton("ded9135d072c627208ea2cc0f5960d842e956eca572e1d8b807a3e2338fdd0dc/stage");

    AlanVoice.onCommand.add((command) {
      debugPrint("got new command ${command.toString()}");
      var commandName = command.data["command"] ?? "";
      if (commandName == "showAlert") {
        /// handle command "showAlert"
      }
    });

    AlanVoice.onEvent.add((event) {
      debugPrint("got new event ${event.data.toString()}");
    });

    AlanVoice.onButtonState.add((state) {
      debugPrint("got new button state ${state.name}");
    });
  }

  Widget _buildQuestionExample(String question, {double? height, double? width, Color? color}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 5),
      height: height ?? 100, // Définir la hauteur par défaut ici
      width: width ?? double.infinity, // Définir la largeur par défaut ici
      decoration: BoxDecoration(
        color: color ?? Colors.grey[200], // Définir la couleur par défaut ici
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        question,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
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
                "https://lottie.host/1f6266c3-ecba-42d2-8746-751cde919d23/uMCAt58pAz.json",
                width: 50,
                reverse: true,
                repeat: true,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Alan',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Lottie.network(
                "https://lottie.host/842eda6b-f5bc-4755-bc12-d2765bf3ac92/0E2SpmsKuk.json",
                reverse: true,
                repeat: true,
                width: 130,
                height: 130,
              ),
              Text(
                'Hello, It is Alan',
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'AI Assistant in your pocket ',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Text(
                'Artificial Intelligence will make your Daily Life easier ',
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 51, 51, 51),
                ),
              ),
              DropdownButton<String>(
                hint: Text('Select an option',style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                wordSpacing: 5.0,
                fontFamily: 'Roboto',
              ),),
                value: _selectedExercise,
                onChanged: (newValue) {
                  setState(() {
                    _selectedExercise = newValue;
                  });
                },
                items: exerciseQuestions.keys.map((exercise) {
                  return DropdownMenuItem<String>(
                    value: exercise,
                    child: Text(exercise),
                  );
                }).toList(),
              ),
              // Affichez les questions supplémentaires en fonction de l'exercice sélectionné
              if (_selectedExercise != null) ...[
                ...exerciseQuestions[_selectedExercise]!.asMap().entries.map((entry) {
                  int index = entry.key;
                  String question = entry.value;
                  Color color = exerciseColors[index % exerciseColors.length];
                  return _buildQuestionExample(question, color: color);
                }),
              ],
            ],
          ),
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
