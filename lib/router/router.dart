import 'package:calc_kpi/features/factorial/factorial.dart';
import 'package:calc_kpi/features/firstOrDefault/defaultAction.dart';
import 'package:calc_kpi/features/matrixAddition/view/matrixAdd_screen.dart';
import 'package:calc_kpi/features/matrixScallarMultiply/view/matrixScalarMultiply_screen.dart';
import 'package:calc_kpi/features/matrixSubstaction/matrixSubstraction.dart';
import 'package:calc_kpi/features/trig/view/trig_screen.dart';
import 'package:flutter/material.dart';

import '../features/actionList/action_list.dart';
import '../features/summ/summ.dart';
import '../features/logarifms/log.dart';

final routes = {
  '/': (context) => const ActionList(),
  '/factorial': (context) => const Factorial(),
  '/default': (context) => const DefaultAct(),
  '/summ': (context) => const Summ(),
  '/matrix_addition': (context) => const MatrixAddition(),
  '/matrix_substraction': (context) => const MatrixSubstraction(),
  '/matrix_scalar_multiply': (context) => const MatrixScalarMultiply(),
  '/log': (context) => const LogCalculatorWidget(),
  '/trig': (context) => TrigCalculatorWidget(),
};
