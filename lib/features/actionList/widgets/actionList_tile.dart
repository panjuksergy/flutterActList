import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActionTile extends StatelessWidget {
  const ActionTile({
    super.key,
    required this.actionName,
    required this.actionDescription,
    required this.actRoute,
    required this.picRoute,
  });

  final String actionName;
  final String actionDescription;
  final String actRoute;
  final String picRoute;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: SvgPicture.asset(
        picRoute,
        height: 25,
        width: 25,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
      title: Text(
        actionName,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        actionDescription,
        style: theme.textTheme.labelSmall,
      ),
      onTap: () {
        Navigator.of(context).pushNamed(actRoute, arguments: actionName);
      },
    );
  }
}
