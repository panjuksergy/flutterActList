import 'package:flutter_svg/svg.dart';

class Action {
  const Action({
    required this.actionName,
    required this.actionDescription,
    required this.routeStr,
    required this.picRoute,
  });

  final String picRoute;
  final String actionName;
  final String actionDescription;
  final String routeStr;
}
