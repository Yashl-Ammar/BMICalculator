import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({required this.height,required this.weight});

  final int height;
  final int weight;

  double? _bmi;

  String calculateBmi()
  {
    _bmi = weight / pow(height/100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String calculateWeight()
  {
    if(_bmi! >= 25.0){
      return 'Overweight';
    }
    else if (_bmi! >= 18.5){
      return 'Normal';
    }
    else{
      return 'underweight';
    }

  }

  String calculateInterpretation()
  {
    if(_bmi! >= 25.0){
      return 'You have a higher weight than the normal. Try exercising';
    }
    else if (_bmi! >= 18.5){
      return 'You have a normal weight. Good Job!';
    }
    else{
      return 'You have a lower weight than the normal. Try eating more';
    }
  }

}