import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Factorial extends StatefulWidget {
  const Factorial({Key? key}) : super(key: key);

  @override
  State<Factorial> createState() => _FactorialState();
}

class _FactorialState extends State<Factorial> {
  int factorial(String strNum) {
    int num = int.parse(strNum);
    int fact = 1;
    for (int i = 1; i <= num; i++) {
      fact *= i;
    }
    return fact;
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
    final _textController = TextEditingController();

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
              TextFormField(
                controller: _textController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'What u need to factorial?',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textController.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
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
                      fieldInput = factorial(_textController.text).toString();
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
