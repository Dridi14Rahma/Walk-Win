import 'package:flutter/material.dart';
import 'dart:math';


class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<DateBox> dateBoxes = [];

    DateTime date = DateTime.now().subtract(const Duration(days: 3));

    for (int i = 0; i < 6; i++) {
      dateBoxes.add(DateBox(date: date, active: i == 3));
      date = date.add(const Duration(days: 1));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Boxes'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: dateBoxes,
              ),
            ),
          ),
          const SizedBox(height: 50),
          const formee(),
          const SizedBox(height: 50),
          const Graph(), // Ajoutez le widget Graph ici
          const SizedBox(height: 40),
          const Inf(), // Ajoutez le widget Inf ici
          const SizedBox(height: 20),
          
          // Nouveau widget CircularProgressIndicator
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            
            
            label: 'Search',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.home , color: Color.fromARGB(255, 154, 152, 146), size: 20,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Config',
          ),

        ],
        selectedItemColor: Colors.blue, // Couleur des icônes sélectionnées
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class DateBox extends StatelessWidget {
  final bool active;
  final DateTime date;

  const DateBox({
    Key? key,
    this.active = false,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
      decoration: BoxDecoration(
        gradient: active
            ? const LinearGradient(colors: [
          Color(0xff92e2ff),
          Color(0xff1ebdf8),
        ], begin: Alignment.topCenter)
            : null,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xffe1e1e1),
        ),
      ),
      child: DefaultTextStyle.merge(
        style: active
            ? const TextStyle(color: Colors.white)
            : const TextStyle(color: Colors.black),
        textAlign: TextAlign.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              daysOfWeek[date.weekday] ?? '',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(date.day.toString().padLeft(2, '0'),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ),
    );
  }
}

// Define the map for daysOfWeek here
const Map<int, String> daysOfWeek = {
  1: 'Monday',
  2: 'Tuesday',
  3: 'Wednesday',
  4: 'Thursday',
  5: 'Friday',
  6: 'Saturday',
  7: 'Sunday',
};

class Graph extends StatelessWidget {
  const Graph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity, // Ajustez la largeur selon vos besoins
      height: 200, // Définissez la hauteur selon vos besoins
      child: GraphArea(),
    );
  }
}

class GraphArea extends StatefulWidget {
  const GraphArea({Key? key}) : super(key: key);

  @override
  _GraphAreaState createState() => _GraphAreaState();
}

class _GraphAreaState extends State<GraphArea>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  List<DataPoint> data = [
    DataPoint(day: 1, steps: Random().nextInt(100)),
    DataPoint(day: 2, steps: Random().nextInt(100)),
    DataPoint(day: 3, steps: Random().nextInt(100)),
    DataPoint(day: 4, steps: Random().nextInt(100)),
    DataPoint(day: 5, steps: Random().nextInt(100)),
    DataPoint(day: 6, steps: Random().nextInt(100)),
    DataPoint(day: 7, steps: Random().nextInt(100)),
    DataPoint(day: 8, steps: Random().nextInt(100)),
  ];

  final List<String> daysOfWeek = [
    'M',
    'T',
    'W',
    'T',
    'F',
    'S',
    'S',
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward(from: 0.0);
      },
      child: CustomPaint(
        painter:
        GraphPainter(_animationController.view, data: data, daysOfWeek: daysOfWeek),
      ),
    );
  }
}
class formee extends StatelessWidget {
  const formee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int goal = 6000; // Remplacez cette valeur par l'objectif réel

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // Couleur du fond
            ),
            child: CircularProgressIndicator(
              value: 0.7, // Remplacez cette valeur par la progression réelle
              strokeWidth: 10,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          PhysicalModel(
            color: Colors.transparent,
            elevation: 8,
            shadowColor: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(100),
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent, // Couleur transparente pour éviter les interférences avec le cercle intérieur
              ),
            ),
          ),
          Image.asset(
            "images/footsteps.png",
            width: 120,
          ),
          const Positioned(
            bottom: 20, // Ajustez cette valeur pour déplacer le texte vers le bas
            child: Text(
              'Goal: $goal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}





class GraphPainter extends CustomPainter {
  final List<DataPoint> data;
  final List<String> daysOfWeek;
  final Animation<double> _size;

  GraphPainter(Animation<double> animation, {required this.data, required this.daysOfWeek})
      : _size = Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(
      parent: animation,
      curve: const Interval(0.0, 1.0, curve: Curves.easeInOutCubic),
    ),
  ),
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final barWidth = size.width / (data.length * 2);
    final barSpacing = barWidth;
    final maxSteps = data.map((e) => e.steps).reduce(max).toDouble();
    final unitHeight = size.height / maxSteps;

    Paint barPaint = Paint()
      ..color = const Color(0xff30c3f9)
      ..style = PaintingStyle.fill;

    // Dessine les barres
    for (int i = 0; i < data.length; i++) {
      final barHeight = data[i].steps * unitHeight * _size.value;
      final startX = (i * 2 + 1) * barSpacing;
      final startY = size.height - barHeight;

      canvas.drawRect(
        Rect.fromLTWH(startX - barWidth / 2, startY, barWidth, barHeight),
        barPaint,
      );

      // Dessine les labels des jours
      TextPainter(
        text: TextSpan(
          text: daysOfWeek[(data[i].day - 1) % 7],
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      )
        ..layout(
          minWidth: barWidth,
          maxWidth: barWidth,
        )
        ..paint(
          canvas,
          Offset(startX - barWidth / 2, size.height + 4),
        );
    }

    // Dessine les graduations sur l'axe Y
    _drawYAxisGraduations(canvas, size, maxSteps);
  }

  void _drawYAxisGraduations(Canvas canvas, Size size, double maxSteps) {
    final graduations = [1000, 2000, 3000, 4000, 5000, 6000];

    final unitHeight = size.height / maxSteps;

    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    for (final value in graduations) {
      final y = size.height - value * unitHeight;

      // Dessine la ligne de graduation
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );

      // Dessine le texte de la valeur de la graduation
      textPainter
        ..text = TextSpan(
          text: value.toString(),
          style: const TextStyle(fontSize: 10),
        )
        ..layout();
      textPainter.paint(
        canvas,
        Offset(-textPainter.width - 4, y - textPainter.height / 2),
      );
    }
  }

  @override
  bool shouldRepaint(covariant GraphPainter oldDelegate) {
    return data != oldDelegate.data;
  }
}

class DataPoint {
  final int day;
  final int steps;

  DataPoint({
    required this.day,
    required this.steps,
  });
}

class Inf extends StatelessWidget {
  const Inf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Stats(value: '345', unit: 'kcal', label: 'Calories'),
        Stats(value: '3.6', unit: 'km', label: 'Distance'),
        Stats(value: '1.5', unit: 'hr', label: 'Hours'),
      ],
    );
  }
}

class Stats extends StatelessWidget {
  final String value;
  final String unit;
  final String label;

  const Stats({
    Key? key,
    required this.value,
    required this.unit,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(
          TextSpan(
            text: value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
            children: [
              
              const TextSpan(text: ' '),
              
              TextSpan(
                text: unit,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}





void main() {
  runApp(const MaterialApp(
    home: Info(),
  ));
}
