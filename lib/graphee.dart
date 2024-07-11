import 'package:flutter/material.dart';
import 'dart:math';

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
