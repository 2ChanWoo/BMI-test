import 'package:flutter/material.dart';

import 'bmi_result.dart';

class BmiMain extends StatefulWidget {
  @override
  _BmiMainState createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {
  final _formKey = GlobalKey<FormState>();

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final FocusNode _heightFocus = FocusNode();
  final FocusNode _weightFocus = FocusNode();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('비만도 계산기')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '키',
                ),
                controller: _heightController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return '키를 입력해 주세요';
                  }
                  return null;
                },
                focusNode: _heightFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (term) {
                  _fieldFocusChange(context, _heightFocus, _weightFocus);
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '몸무게',
                ),
                controller: _weightController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return '몸무게를 입력해 주세요';
                  }
                  return null;
                },
                focusNode: _weightFocus,
                textInputAction: TextInputAction.go,
                onFieldSubmitted: (term) {
                  /* go 말고 done은?? 버튼의 onPressed를 복붙했는데, >> focusNode처럼 간편한 방법은 없을까? << */
                  ////////////////////////////////////////////////////////////////////
                  if (_formKey.currentState.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BmiResult(
                              double.parse(_heightController.text.trim()),
                              double.parse(_weightController.text.trim()))),
                    );
                  }
                  /////////////////////////////////////////////////////////////
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BmiResult(
                                double.parse(_heightController.text.trim()),
                                double.parse(_weightController.text.trim()))),
                      );
                    }
                  },
                  child: Text('결과'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

_fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}