import 'dart:math';
import 'package:flutter/material.dart';

class TrigCalculatorWidget extends StatefulWidget {
  @override
  _TrigCalculatorWidgetState createState() => _TrigCalculatorWidgetState();
}

class _TrigCalculatorWidgetState extends State<TrigCalculatorWidget> {
  TextEditingController _textEditingController = TextEditingController();
  double _result = 0.0;

  String? actName;
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args');
    actName = args as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(actName ?? '...')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double input = double.parse(_textEditingController.text);
                  _result = sin(input);
                });
              },
              child: Text(
                'sin',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double input = double.parse(_textEditingController.text);
                  _result = cos(input);
                });
              },
              child: Text(
                'cos',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double input = double.parse(_textEditingController.text);
                  _result = asin(input);
                });
              },
              child: Text(
                'asin',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double input = double.parse(_textEditingController.text);
                  _result = acos(input);
                });
              },
              child: Text(
                'acos',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double input = double.parse(_textEditingController.text);
                  _result = tan(input);
                });
              },
              child: Text(
                'tan',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double input = double.parse(_textEditingController.text);
                  _result = 1 / tan(input);
                });
              },
              child: Text(
                'cot',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double input = double.parse(_textEditingController.text);
                  _result = atan(input);
                });
              },
              child: Text(
                'atan',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double input = double.parse(_textEditingController.text);
                  _result = pi / 2 - atan(input);
                });
              },
              child: Text(
                'acot',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Result: $_result',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
