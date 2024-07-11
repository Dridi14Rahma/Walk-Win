import 'package:flutter/material.dart';





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
