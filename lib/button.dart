import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.border,
      required this.boxShadow,
      required this.ontapped,
      required this.text,
      required this.color,
      required this.textColor});
  final color;
  final text;
  final textColor;
  final ontapped;
  final boxShadow;
  final border;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapped,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Container(
          decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular(50),
            color: color,
            boxShadow: boxShadow,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
