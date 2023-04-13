import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

class Summ extends StatefulWidget {
  const Summ({Key? key}) : super(key: key);

  @override
  State<Summ> createState() => _SummState();
}

class _SummState extends State<Summ> {
  double calculateSum(String expression, int kMin, int kMax) {
    Parser p = Parser();
    ContextModel cm = ContextModel();

    double sum = 0.0;
    for (int k = kMin; k <= kMax; k++) {
      cm.bindVariable(Variable('k'), Number(k));
      Expression exp = p.parse(expression);
      double term = exp.evaluate(EvaluationType.REAL, cm);
      sum += term;
    }

    return sum;
  }

  String? actName;
  String fieldInput = 'Whats`up friend!';
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
    final _textController0 = TextEditingController();
    final _textController1 = TextEditingController();
    final _textController2 = TextEditingController();

    return Scaffold(
        appBar: AppBar(title: Text(actName ?? '...')),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //DisplayText
              Expanded(
                child: Container(
                  child: Center(
                    child: Text(
                      fieldInput,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
              //TextInput
              Row(
                children: [
                  // Sign of summation
                  Text('\u2211', style: TextStyle(fontSize: 24)),
                  SizedBox(width: 8),

                  // k input field
                  Flexible(
                    child: TextFormField(
                      controller: _textController0,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Start value of k',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),

                  // n input field
                  Flexible(
                    child: TextFormField(
                      controller: _textController1,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Finish value of k',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

// Expression input field
              TextFormField(
                controller: _textController2,
                decoration: InputDecoration(
                  hintText: 'Expression',
                  border: OutlineInputBorder(),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 31, 31, 31)),
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      fieldInput = calculateSum(
                              _textController2.text,
                              int.parse(_textController0.text),
                              int.parse(_textController1.text))
                          .toString();
                    });
                  },
                  child: Text(
                    'Calculate',
                    style: theme.textTheme.labelSmall,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
