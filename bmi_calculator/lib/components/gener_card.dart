import 'package:flutter/material.dart';
import '../constants.dart';


class genderCard extends StatelessWidget {

  IconData iconData;
  String gender;

  genderCard({required this.iconData,required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80.0,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(gender,
          style: labelTextStyle,
        )
      ],
    );
  }
}
