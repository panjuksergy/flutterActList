import 'actionModel.dart';

class ActionRepository {
  List<Action> actions = [
    const Action(
        actionName: "Default calculator",
        actionDescription: "Default features like +,-,/,*",
        routeStr: "/default",
        picRoute: 'assets/svg/calcSign.svg'),
    const Action(
        actionName: "Summation",
        actionDescription: "The summation of an explicit sequence",
        routeStr: "/summ",
        picRoute: 'assets/svg/sumSign.svg'),
    const Action(
        actionName: "Factorial",
        actionDescription:
            "Factorial is the product of all positive integers less than or equal to n",
        routeStr: "/factorial",
        picRoute: 'assets/svg/factSign.svg'),
    const Action(
        actionName: 'Logarithm',
        actionDescription:
            'Logarithmizes an expression with different bases, including the natural logarithm with base "e"',
        routeStr: '/log',
        picRoute: 'assets/svg/logSign.svg'),
    const Action(
        actionName: "Matrix addition",
        actionDescription:
            "Addition matrix with equal sum of rows and columns?",
        routeStr: "/matrix_addition",
        picRoute: 'assets/svg/plusSign.svg'),
    const Action(
        actionName: "Matrix subtraction",
        actionDescription:
            "Subtraction matrix with equal sum of rows and columns?",
        routeStr: "/matrix_substraction",
        picRoute: 'assets/svg/minusSign.svg'),
    const Action(
        actionName: "Matrix scalar multiplication",
        actionDescription:
            "Multiplying a matrix a by a scalar k is done by multiplying each element of the matrix by k.",
        routeStr: "/matrix_scalar_multiply",
        picRoute: 'assets/svg/scalarSign.svg'),
  ];
}
