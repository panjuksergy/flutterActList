import 'package:flutter/material.dart';
import 'dart:math' as math;

class LogCalculatorWidget extends StatefulWidget {
  const LogCalculatorWidget({Key? key}) : super(key: key);

  @override
  _LogCalculatorWidgetState createState() => _LogCalculatorWidgetState();
}

class _LogCalculatorWidgetState extends State<LogCalculatorWidget> {
  final _numberController = TextEditingController();
  final _baseController = TextEditingController(text: 'e');
  double _result = 0;

  String? actName;
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args');
    actName = args as String;
    super.didChangeDependencies();
  }

  void _calculate() {
    double number = double.tryParse(_numberController.text) ?? 0;
    String base = _baseController.text.toLowerCase();

    if (base == 'e') {
      setState(() {
        _result = math.log(number);
      });
    } else {
      double baseValue = double.tryParse(base) ?? 0;
      setState(() {
        _result = math.log(number) / math.log(baseValue);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(actName ?? '...')),
      body: Column(children: [
        TextField(
          controller: _numberController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Enter a number',
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _baseController,
          decoration: InputDecoration(
            labelText: 'Enter the base logarithm (e for natural logarithm)',
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _calculate,
          child: Text(
            'Calculate',
            style: theme.textTheme.labelSmall,
          ),
        ),
        SizedBox(height: 20),
        if (_result != null)
          Text(
            'The logarithm base ${_baseController.text} of ${_numberController.text} is $_result',
            style: TextStyle(fontSize: 18),
          ),
      ]),
    );
  }
}
