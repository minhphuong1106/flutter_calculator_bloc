import 'package:flutter_calculator_bloc/src/Utilities/project_constants.dart';

class CalculatorBloc{

  CalculatorReturn calculator(String noA, String noB, String operator){
    double numberA = ProjectConstants.defaultResultValue;
    double numberB = ProjectConstants.defaultResultValue;
    double calResult = ProjectConstants.defaultResultValue;
    bool isReturnInput = false;
    String resultText = ProjectConstants.stringEmpty;
    try {
      numberA = double.parse(noA);
    } on Exception catch (exception) {
      numberA = ProjectConstants.defaultResultValue;
    }
    try {
      numberB = double.parse(noB);
    } on Exception catch (exception) {
      numberB = ProjectConstants.defaultResultValue;
    }
    switch (operator) {
      case ProjectConstants.operatorAdd:
        {
          calResult = numberA + numberB;
        }
        break;
      case ProjectConstants.operatorSub:
        {
          calResult = numberA - numberB;
        }
        break;
      case ProjectConstants.operatorMul:
        {
          calResult = numberA * numberB;
        }
        break;
      case ProjectConstants.operatorDiv:
        {
          calResult = (numberB == ProjectConstants.defaultResultValue)
              ? ProjectConstants.defaultResultValue
              : numberA / numberB;
        }
        break;
      default: // Reset
        {
          noA = ProjectConstants.stringEmpty;
          noA = ProjectConstants.stringEmpty;
          calResult = ProjectConstants.defaultResultValue;
          isReturnInput = true;
        }
        break;
    }
    resultText = ProjectConstants.resultResultTextPrefix + '$calResult';
    CalculatorReturn result = new CalculatorReturn(noA, noB, resultText,
        isReturnInput);
    return result;
  }
}

class CalculatorReturn{
  String noA = ProjectConstants.stringEmpty;
  String noB = ProjectConstants.stringEmpty;
  String res = ProjectConstants.stringEmpty;
  bool isReturnInputParam = false;

  CalculatorReturn(String noA, String noB, String res, bool isReturnInputParam){
    this.noA = noA;
    this.noB = noB;
    this.res = res;
    this.isReturnInputParam = isReturnInputParam;
  }
}