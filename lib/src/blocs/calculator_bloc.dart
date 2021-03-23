import 'package:flutter_calculator_bloc/src/utilities/project_constants.dart';
import 'package:flutter_calculator_bloc/src/viewmodels/calculator_view_model.dart';

class CalculatorBloc{

  CalculatorViewModel calculator(String noA, String noB, String operator){
    double numberA = ProjectConstants.defaultResultValue;
    double numberB = ProjectConstants.defaultResultValue;
    double calResult = ProjectConstants.defaultResultValue;
    bool isReset = false;

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
          isReset = true;
        }
        break;
    }
    resultText = ProjectConstants.resultResultTextPrefix + '$calResult';
    CalculatorViewModel result = new CalculatorViewModel(noA, noB, resultText,
        isReset);
    return result;
  }
}