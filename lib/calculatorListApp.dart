import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class CalculatorActionsListApp extends StatelessWidget {
  const CalculatorActionsListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: darkTheme,
      routes: routes,
    );
  }
}
