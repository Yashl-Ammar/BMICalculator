import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {

  final VoidCallback onTap;
  final String title;

  BottomButton({required this.onTap,required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onTap,
      child: Container(
        height: kBottomContainerConst,
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}