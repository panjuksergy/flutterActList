import 'package:flutter/material.dart';
import '../models/modelListFill.dart';
import '../widgets/widgets.dart';

class ActionList extends StatefulWidget {
  const ActionList({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title = 'CalculatorCursach';

  @override
  State<ActionList> createState() => _ActionListState();
}

class _ActionListState extends State<ActionList> {
  final _actionRepository = ActionRepository();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView.separated(
        itemCount: _actionRepository.actions.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, i) {
          final action = _actionRepository.actions[i];
          return ActionTile(
              actionName: action.actionName,
              actionDescription: action.actionDescription,
              actRoute: action.routeStr,
              picRoute: action.picRoute);
        },
      ),
    );
  }
}
