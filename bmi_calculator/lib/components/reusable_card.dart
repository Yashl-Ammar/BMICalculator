import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {


  final Color colour;
  Widget cardChild;

  ReusableCard({required this.colour,  required this.cardChild});

  @override
  Widget build(BuildContext context) {
      return Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: cardChild,
        );
  }
}
