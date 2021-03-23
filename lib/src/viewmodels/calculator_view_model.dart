import 'package:flutter_calculator_bloc/src/utilities/project_constants.dart';

class CalculatorViewModel{
  String noA = ProjectConstants.stringEmpty;
  String noB = ProjectConstants.stringEmpty;
  String res = ProjectConstants.stringEmpty;
  bool isReset = false;

  CalculatorViewModel(String noA, String noB, String res, bool isReset){
    this.noA = noA;
    this.noB = noB;
    this.res = res;
    if (this.res == null || this.res == ProjectConstants.stringEmpty)
      this.res = ProjectConstants.resultResultTextPrefix + ProjectConstants
          .defaultResultValue.toString();
    this.isReset = isReset;
  }
}