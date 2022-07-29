import 'results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/reusable_card.dart';
import 'components/gener_card.dart';
import 'constants.dart';
import 'components/bottom_button.dart';
import 'calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {


  Gender? gender;

  int height = 160;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            gender = Gender.male;
                          });
                        },
                        child: ReusableCard(
                          colour: gender == Gender.male ? kColorConst : kInactiveCardColor,
                          cardChild: genderCard(
                            gender: 'MALE',
                            iconData: FontAwesomeIcons.mars,
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            gender = Gender.female;
                          });
                        },
                        child: ReusableCard(
                          colour: gender == Gender.female ? kColorConst : kInactiveCardColor,
                          cardChild: genderCard(
                            gender: 'FEMALE',
                            iconData: FontAwesomeIcons.venus,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kColorConst,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: labelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: wightedTextStyle,
                              ),
                              Text(
                                'cm',
                                style: labelTextStyle,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Colors.white,
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x26EB1555) ,
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                              trackHeight: 1,
                            ),
                            child: Slider(
                                value: height.toDouble(),
                                min: 100,
                                max: 220,

                                onChanged: (double newValue){
                                  setState(() {
                                    height = newValue.toInt();
                                  });

                                },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kColorConst,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Weight(kg)',style: labelTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(weight.toString(),style: wightedTextStyle,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(icon: FontAwesomeIcons.minus, onPress: (){
                                setState(() {
                                  weight--;
                                });
                              }),
                              /*RoundedIconButton(FontAwesomeIcons.minus, onPress: (){
                                setState(() {
                                  weight++;
                                });

                              },),*/
                              SizedBox(
                                width: 10,
                              ),
                              RoundedIconButton(icon: FontAwesomeIcons.plus, onPress: (){
                                setState(() {
                                  weight++;
                                });
                              }),
                              /*FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(FontAwesomeIcons.plus,
                                color: Colors.white,),
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                }
                              ),*/

                            ],
                          ),



                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kColorConst,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: wightedTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(icon: FontAwesomeIcons.minus,
                                  onPress: (){
                                    setState(() {
                                      age--;
                                    });
                                  }
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundedIconButton(icon: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                              ),
                            ],

                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: BottomButton(
                      title: 'CALCULATE',
                      onTap: (){

                        CalculatorBrain calculator = CalculatorBrain(height: height, weight:  weight);

                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ResultsPage(
                            bmi: calculator.calculateBmi(),
                            weight: calculator.calculateWeight(),
                            interpretation: calculator.calculateInterpretation(),
                          );
                        }));
                      },
                    ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {

  final VoidCallback onPress;
  final IconData icon;

  RoundedIconButton( {required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}




enum Gender{
  male,
  female,
}