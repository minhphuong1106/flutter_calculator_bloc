import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calculator_bloc/src/Utilities/project_constants.dart';
import 'package:flutter_calculator_bloc/src/blocs/calculator_bloc.dart';

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController _numberAController = new TextEditingController();
  TextEditingController _numberBController = new TextEditingController();
  CalculatorBloc _bloc = new CalculatorBloc();
  CalculatorReturn _result;

  _CalculatorPageState() {
    _result = new CalculatorReturn(ProjectConstants.stringEmpty,
        ProjectConstants.stringEmpty, ProjectConstants.stringEmpty, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset('images/calculator.png'),
              Container(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  width: double.infinity,
                  height: 40,
                  child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _numberAController,
                      style: TextStyle(fontSize: ProjectConstants.fontSize),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      //
                      decoration: new InputDecoration.collapsed(
                          hintText: ProjectConstants.hintTextA))),
              Container(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  width: double.infinity,
                  height: 40,
                  child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _numberBController,
                      style: TextStyle(fontSize: ProjectConstants.fontSize),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      //
                      decoration: new InputDecoration.collapsed(
                          hintText: ProjectConstants.hintTextB))),
              Container(
                  width: double.infinity,
                  height: 40,
                  child: Text(
                    _result.res,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: ProjectConstants.fontSize),
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
                  Widget>[
                RaisedButton(
                    color: Colors.blue,
                    onPressed: () =>
                        _onPressedOperatorButton(ProjectConstants.operatorAdd),
                    child: Text(ProjectConstants.operatorAdd,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ProjectConstants.fontSize))),
                RaisedButton(
                    color: Colors.deepOrange,
                    onPressed: () =>
                        _onPressedOperatorButton(ProjectConstants.operatorSub),
                    child: Text(ProjectConstants.operatorSub,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ProjectConstants.fontSize))),
                RaisedButton(
                    color: Colors.green,
                    onPressed: () =>
                        _onPressedOperatorButton(ProjectConstants.operatorMul),
                    child: Text(ProjectConstants.operatorMul,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ProjectConstants.fontSize))),
                RaisedButton(
                    color: Colors.yellowAccent,
                    onPressed: () =>
                        _onPressedOperatorButton(ProjectConstants.operatorDiv),
                    child: Text(ProjectConstants.operatorDiv,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ProjectConstants.fontSize))),
              ]),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                    color: Colors.grey,
                    onPressed: () =>
                        _onPressedOperatorButton(ProjectConstants.operatorRes),
                    child: Text(ProjectConstants.operatorRes,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ProjectConstants.fontSize))),
              ),
            ],
          ),
        ));
  }

  void _onPressedOperatorButton(String operator) {
    _result = _bloc.calculator(
        _numberAController.text, _numberBController.text, operator);
    if (_result.isReturnInputParam) {
      _numberAController.text = ProjectConstants.stringEmpty;
      _numberBController.text = ProjectConstants.stringEmpty;
    }
    setState(() {});
  }
}
