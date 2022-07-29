import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/reusable_card.dart';
import 'constants.dart';
import 'components/bottom_button.dart';

class ResultsPage extends StatelessWidget {



  ResultsPage({required this.weight,required this.bmi,required this.interpretation});

  final String bmi;
  final String interpretation;
  final String weight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Your Result',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
          Expanded(
            flex: 5,
              child: ReusableCard(
                colour: kColorConst,
                cardChild: Padding(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          weight,
                          style: TextStyle(
                            color: CupertinoColors.systemGreen,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          bmi,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 100,
                          ),
                        ),
                        Text(
                          interpretation,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
          ),
          Expanded(child: BottomButton(
            title: 'RE-CALCULATE',
            onTap: (){
              Navigator.pop(context);
            },
          ),)
        ],

      ),
    );
  }
}

